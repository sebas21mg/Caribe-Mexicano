import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController _mapController = MapController();
  String? selectedCity;

  final List<Marker> markers = [
    Marker(
      point: LatLng(20.581074086250766, -87.1196658178705),
      builder:
          (ctx) => Icon(Icons.favorite, color: Color(0xFFDC2626), size: 25),
    ),
    Marker(
      point: LatLng(20.215192012344747, -87.4295392215827),
      builder:
          (ctx) => Icon(Icons.favorite, color: Color(0xFFDC2626), size: 25),
    ),
    Marker(
      point: LatLng(20.629764707165467, -86.84696570100505),
      builder:
          (ctx) => Icon(Icons.favorite, color: Color(0xFFDC2626), size: 25),
    ),
    Marker(
      point: LatLng(20.319516912836143, -87.35773489464454),
      builder:
          (ctx) => Icon(Icons.favorite, color: Color(0xFFDC2626), size: 25),
    ),
    Marker(
      point: LatLng(20.397727854756535, -87.31388727949015),
      builder:
          (ctx) => Icon(Icons.favorite, color: Color(0xFFDC2626), size: 25),
    ),
    Marker(
      point: LatLng(21.059584576320184, -86.78157379087182),
      builder:
          (ctx) =>
              const Icon(Icons.history_edu, color: Color(0xFFD97706), size: 25),
    ),
    Marker(
      point: LatLng(18.732275353705955, -87.71420069502224),
      builder:
          (ctx) =>
              const Icon(Icons.fastfood, color: Color(0xFF7E22CE), size: 25),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(20.211, -87.465),
        zoom: 7.0,
        onTap: (_, __) {
          setState(() {
            selectedCity = null;
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
          backgroundColor: Colors.white,
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}
