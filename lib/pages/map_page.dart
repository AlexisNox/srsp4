// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   static const _initialCameraPosition = CameraPosition(
//     target: LatLng(37.773972, -122.431297),
//     zoom: 15,
//   );
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: false,
//         zoomControlsEnabled: false,
//         initialCameraPosition: _initialCameraPosition,
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.242243, 76.949704),
    zoom: 15,
  );

  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(43.242243, 76.949704),
  );

  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(43.24027104438641, 76.91731636696574),
  );

  static final Polyline _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
    points: [
      LatLng(43.242243, 76.949704),
      LatLng(43.24027104438641, 76.91731636696574),
    ],
    width: 5,
  );

  static final Polygon _kPolygon = Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      LatLng(43.242243, 76.949704),
      LatLng(43.24027104438641, 76.91731636696574),
      LatLng(43.230, 76.920),
      LatLng(43.270, 76.950),
    ],
    strokeWidth: 5,
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {
          _kGooglePlexMarker,
          _kGooglePlexMarker2
        },
        polylines: {
          _kPolyline,
        },
        polygons: {
          _kPolygon,
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  }
}
  // Completer<GoogleMapController> _controller = Completer();
  // static const LatLng aLocation = LatLng(43.242243, 76.949704);
  // static const LatLng bLocation = LatLng(43.24027104438641, 76.91731636696574);
  //
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(43.2566700, 76.9286100),
  //   zoom: 13.4746,
  // );
  //
  //
  // static final Marker _kGooglePlexMarker = Marker(
  //     markerId: MarkerId('source'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  //     position: aLocation);
  //
  //
  // static final Marker _kSecposMarker = Marker(
  //     markerId: MarkerId('destination'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  //     position: bLocation);
  //
  //
  // static final Polyline _kPolyline = Polyline(
  //     polylineId: PolylineId('_kPolyline'),
  //     points: [aLocation, bLocation],
  //     width: 4,
  //     color: Colors.purpleAccent);
  //
  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     body: GoogleMap(
  //       mapType: MapType.normal,
  //       markers: {_kGooglePlexMarker, _kSecposMarker},
  //       polylines: {_kPolyline},
  //       initialCameraPosition: _kGooglePlex,
  //       onMapCreated: (GoogleMapController controller) {
  //         _controller.complete(controller);
  //       },
  //     ),
  //   );
  // }
  // }