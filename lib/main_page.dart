import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'constants/restaurants.dart';
import 'navigation_drawer.dart';
import 'widget/near_one.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Completer<YandexMapController> completer = Completer();
  // late YandexMapController controller;
  // // Location location = Location();
  // LocationData? currentPosition;
  // final FocusNode _focusNode = FocusNode();
  // final List<PlacemarkMapObject> markers = [];
  // double? lat;
  // double? long;

  // Future<void> zoomIn() async {
  //   controller.moveCamera(
  //     CameraUpdate.zoomIn(),
  //     animation: const MapAnimation(
  //       duration: .5,
  //       type: MapAnimationType.linear,
  //     ),
  //   );
  // }

  // Future<void> zoomOut() async {
  //   controller.moveCamera(
  //     CameraUpdate.zoomOut(),
  //     animation: const MapAnimation(
  //       duration: .5,
  //       type: MapAnimationType.linear,
  //     ),
  //   );
  // }

  // void _navigateToCurrentLocation() {
  //   if (lat != null && long != null) {
  //     controller.moveCamera(
  //       CameraUpdate.newCameraPosition(
  //         const CameraPosition(
  //           target: Point(
  //             latitude: 37.786834,
  //             longitude: -122.406417,
  //           ),
  //           zoom: 15,
  //         ),
  //       ),
  //       animation: const MapAnimation(
  //         duration: 1,
  //         type: MapAnimationType.linear,
  //       ),
  //     );
  //   }
  // }

  // late final YandexMapController _controller;
  late YandexMapController _controller;
  final FocusNode _focusNode = FocusNode();
  final List<PlacemarkMapObject> markers = [];
  double? lat;
  double? long;

  // @override
  // void initState() {
  //   super.initState();
  //   for (var i = 0; i < restaurants.length; ++i) {
  //     markers.add(
  //       PlacemarkMapObject(
  //         opacity: 1,
  //         mapId: MapObjectId(restaurants[i].id),
  //         point: Point(
  //           latitude: restaurants[i].lat,
  //           longitude: restaurants[i].long,
  //         ),
  //         onTap: _navigateToPoint,
  //         icon: PlacemarkIcon.single(
  //           PlacemarkIconStyle(
  //             image: BitmapDescriptor.fromBytes(markers[i] as Uint8List),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavigationDrawers(),
      body: Stack(
        children: [
          YandexMap(
            tiltGesturesEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            modelsEnabled: true,
            nightModeEnabled: false,
            onMapCreated: (YandexMapController yandexMapController) async {
              _controller = yandexMapController;

              final cameraPosition = await _controller.getCameraPosition().then(
                (value) async {
                  await _controller.moveCamera(CameraUpdate.newCameraPosition(
                      const CameraPosition(
                          target: Point(latitude: 41.2995, longitude: 69.2401),
                          zoom: 12.0)));
                },
              );

              //  await _getCurrentPosition(context);
              // _initialPosition();
            },
          ),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
                child: SizedBox(
                  height: 98,
                  width: w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(builder: (context) {
                            return GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: const SvgIcon(
                                    "assets/icons/menu_icon.svg"));
                          }),
                          SizedBox(
                            width: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                SvgIcon("assets/icons/bell_icon.svg"),
                                SvgIcon("assets/icons/filter_icon.svg"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      zoomIn();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 22,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff636363),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      zoomOut();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 22,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Color(0xff636363),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      _navigateToCurrentLocation;
                      // getLocation();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 22,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.my_location_rounded,
                        color: Color(0xff636363),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          NearOne(w: w)
        ],
      ),
    );
  }

  void _initialPosition() {
    if (lat != null && long != null) {
      markers.add(
        PlacemarkMapObject(
          opacity: 1,
          mapId: const MapObjectId('current location'),
          point: Point(
            latitude: lat!,
            longitude: long!,
          ),
          onTap: _navigateToPoint,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              scale: 1,
              isVisible: true,
              isFlat: true,
              image: BitmapDescriptor.fromBytes(
                markers[markers.length - 1] as Uint8List,
              ),
            ),
          ),
        ),
      );
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: Point(
              latitude: 37.786834,
              longitude: -122.406417,
            ),
            zoom: 15,
          ),
        ),
      );

      setState(() {});
    }
  }

  void _navigateToCurrentLocation() {
    if (lat != null && long != null) {
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: Point(
              latitude: 37.786834,
              longitude: -122.406417,
            ),
            zoom: 15,
          ),
        ),
        animation: const MapAnimation(
          duration: 1,
          type: MapAnimationType.linear,
        ),
      );
    }
  }

  Future<void> zoomIn() async {
    _controller.moveCamera(
      CameraUpdate.zoomIn(),
      animation: const MapAnimation(
        duration: .5,
        type: MapAnimationType.linear,
      ),
    );
  }

  Future<void> zoomOut() async {
    _controller.moveCamera(
      CameraUpdate.zoomOut(),
      animation: const MapAnimation(
        duration: .5,
        type: MapAnimationType.linear,
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition(BuildContext context) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      lat = position.latitude;
      long = position.longitude;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _navigateToPoint(_, point) {
    _controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: point.latitude,
            longitude: point.longitude,
          ),
          zoom: 18,
        ),
      ),
      animation: const MapAnimation(
        duration: 1,
        type: MapAnimationType.linear,
      ),
    );
  }
}
