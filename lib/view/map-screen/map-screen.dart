import 'package:baxi/component/mycolor.dart';
import 'package:baxi/component/params.dart';
import 'package:baxi/gen/assets.gen.dart';
import 'package:baxi/service/dio-service.dart';
import 'package:baxi/view/map-screen/widgets/custom-bottom-sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController = MapController();
  GeoJsonParser myGeoJsonParser = GeoJsonParser();
  List<Polyline> polyline = [];

  var box = GetStorage();
  var selected = 0.obs;

  getRoute() async {
    var response = await DioService().getPolyline(
        'https://api.openrouteservice.org/v2/directions/driving-car',
        '${box.read('startLong')},${box.read('startLat')}',
        '${box.read('endLong')},${box.read('endLat')}');
    debugPrint(
        '${box.read('startLong')},${box.read('startLat')} \\ ${box.read('endLong')},${box.read('endLat')}');

    myGeoJsonParser.parseGeoJson(response.data);

    debugPrint('>>>>> ${response.data}');
    setState(() {
      polyline = myGeoJsonParser.polylines;
    });
  }

  cancelRoute() {
    setState(() {
      polyline.clear();
      box.write('startLong', null);
      box.write('startLat', null);
      box.write('endLong', null);
      box.write('endLat', null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              onTap: (tapPosition, point) {
                setState(() {
                  if (box.read('startLong') == null) {
                    box.write('startLong', point.longitude);
                    box.write('startLat', point.latitude);
                  } else {
                    box.read('endLong') ??
                        box.write('endLong', point.longitude);
                    box.write('endLat', point.latitude);
                  }

                  if (box.read('startLong') != null &&
                      box.read('endLong') != null) {
                    getRoute();
                  }
                });
              },
              initialCenter: const LatLng(34.79851091145589, 48.51475194713862),
              initialZoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/ryanrobinson1831/clsjfw1vy01do01qrcdel69zy/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnlhbnJvYmluc29uMTgzMSIsImEiOiJjbHNqZjVydnEwMHB2MnFsYWx6a2o5b25hIn0.fd1HCQnagCkkI7BdMwcURw',
                // 'https://api.mapbox.com/styles/v1/ryanrobinson1831/clssy2vvq001u01qz9d383yk0/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnlhbnJvYmluc29uMTgzMSIsImEiOiJjbHNqZjVydnEwMHB2MnFsYWx6a2o5b25hIn0.fd1HCQnagCkkI7BdMwcURw',
              ),
              if (polyline.isNotEmpty)
                PolylineLayer(polylineCulling: true, polylines: polyline),
              if (box.read('startLong') == null)
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      Assets.icons.origin,
                    ),
                  ),
                ),
              if (box.read('endLong') == null && box.read('startLong') != null)
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      Assets.icons.destination,
                    ),
                  ),
                ),
              if (box.read('startLong') != null)
                MarkerLayer(markers: [
                  Marker(
                      point:
                          LatLng(box.read('startLat'), box.read('startLong')),
                      height: 40,
                      width: 40,
                      child: SizedBox(
                        child: SvgPicture.asset(
                          Assets.icons.origin,
                        ),
                      ))
                ]),
              if (box.read('endLong') != null)
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(box.read('endLat'), box.read('endLong')),
                      height: 40,
                      width: 40,
                      child: SizedBox(
                        child: SvgPicture.asset(
                          Assets.icons.destination,
                        ),
                      ))
                ]),
            ],
          ),
          // back icon
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                cancelRoute();
              },
              child: Container(
                height: Params.height / 20,
                width: Params.height / 20,
                decoration: BoxDecoration(
                    color: MyColor.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: MyColor.borderTextField)),
                child: const Center(child: Icon(Icons.arrow_forward_ios)),
              ),
            ),
          ),
          box.read('startLong') == null
              ? Positioned(
                  bottom: 16,
                  right: 24,
                  left: 24,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          box.write('startLat', mapController.center.latitude);
                          box.write(
                              'startLong', mapController.center.longitude);
                        });
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyColor.primary),
                          fixedSize: MaterialStateProperty.all(
                              Size(Params.width / 1.22, Params.height / 16))),
                      child: Text(
                        'تایید مبدا',
                        style: GoogleFonts.poppins(
                            color: MyColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                )
              : box.read('endLong') == null
                  ? Positioned(
                      bottom: 16,
                      right: 24,
                      left: 24,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              box.write(
                                  'endLat', mapController.center.latitude);
                              box.write(
                                  'endLong', mapController.center.longitude);
                              getRoute();
                              debugPrint(
                                  '${box.read('startLong')},${box.read('startLat')} \\ ${box.read('endLong')},${box.read('endLat')}');
                            });
                            showModalBottomSheet(
                                isDismissible: true,
                                context: context,
                                builder: (context) {
                                  return ChooseBaxiServiceBottomSheet(
                                      selected: selected);
                                }).then((value) => selected.value = 0);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyColor.primary),
                              fixedSize: MaterialStateProperty.all(Size(
                                  Params.width / 1.22, Params.height / 16))),
                          child: Text(
                            'تایید مقصد',
                            style: GoogleFonts.poppins(
                                color: MyColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  : Positioned(
                      bottom: 16,
                      right: 24,
                      left: 24,
                      child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: true,
                                context: context,
                                builder: (context) {
                                  return ChooseBaxiServiceBottomSheet(
                                      selected: selected);
                                }).then((value) => selected.value = 0);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyColor.primary),
                              fixedSize: MaterialStateProperty.all(Size(
                                  Params.width / 1.22, Params.height / 16))),
                          child: Text(
                            'انتخاب سرویس',
                            style: GoogleFonts.poppins(
                                color: MyColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
        ]),
      ),
    );
  }
}


              // MarkerLayer(rotate: true, markers: [
              //   Marker(
              //       height: 25,
              //       width: 25,
              //       point: const LatLng(
              //         35.696786247860146,
              //         51.40199439726041,
              //       ),
              //       child: Container(
              //         decoration: const BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                   offset: Offset(2, 3),
              //                   color: Colors.red,
              //                   blurRadius: 15)
              //             ],
              //             color: Color.fromARGB(255, 16, 184, 245),
              //             shape: BoxShape.circle),
              //       ))
              // ]),
              // PolygonLayer(polygons: [
              //   Polygon(
              //       points: [
              //         const LatLng(
              //           35.69333303978374,
              //           51.40388983944294,
              //         ),
              //         const LatLng(
              //           35.69390346490637,
              //           51.400260950883734,
              //         ),
              //         const LatLng(
              //           35.6929856154221,
              //           51.40093405118179,
              //         ),
              //         const LatLng(
              //           35.69333303978374,
              //           51.40388983944294,
              //         ),
              //       ],
              //       color: Colors.yellow,
              //       borderColor: Colors.red,
              //       strokeJoin: StrokeJoin.round,
              //       borderStrokeWidth: 3,
              //       isDotted: true,
              //       isFilled: true)
              // ]),
              // PolylineLayer(polylines: [
              //   Polyline(
              //       points: [
              //         const LatLng(
              //           35.69616135764569,
              //           51.391774034090275,
              //         ),
              //         const LatLng(
              //           35.69544834579246,
              //           51.40429955266859,
              //         ),
              //         const LatLng(
              //           35.69029070356075,
              //           51.40330453483685,
              //         ),
              //         const LatLng(
              //           35.69257246660787,
              //           51.41138173840645,
              //         ),
              //       ],
              //       color: Colors.green,
              //       borderColor: Colors.green,
              //       borderStrokeWidth: 5,
              //       strokeJoin: StrokeJoin.round)
              // ]),
              // RichAttributionWidget(
              //   attributions: [
              //     TextSourceAttribution(
              //       'OpenStreetMap contributors',
              //       onTap: () => launchUrl(
              //           Uri.parse('https://openstreetmap.org/copyright')),
              //     ),
              //   ],
              // ),