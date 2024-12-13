import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({super.key});

  @override
  _EmojiScreenState createState() {
    return _EmojiScreenState();
  }
}

class _EmojiScreenState extends State<EmojiScreen> {
  final Set<Polyline> _polylines = {};
  final LatLng _origin = const LatLng(37.7749, -122.4194);
  final LatLng _destination = const LatLng(34.0522, -118.2437);
  final String _apiKey = 'AIzaSyCHJwjZjGSOBc18-3mJM8tCqDYoV3Nk9tQ';

  @override
  void initState() {
    super.initState();
    _getRoutePolyline();
  }

  Future<void> _getRoutePolyline() async {
    final String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=${_origin.latitude},${_origin.longitude}&destination=${_destination.latitude},${_destination.longitude}&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK') {
          final points = data['routes'][0]['overview_polyline']['points'];
          final polylinePoints = PolylinePoints();
          final List<PointLatLng> decodedPoints = polylinePoints.decodePolyline(points);

          final List<LatLng> polylineCoordinates = decodedPoints.map((point) {
            return LatLng(point.latitude, point.longitude);
          }).toList();

          setState(() {
            _polylines.add(
              Polyline(
                polylineId: const PolylineId('route'),
                points: polylineCoordinates,
                color: Colors.blue,
                width: 5,
              ),
            );
          });
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Route"),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {},
        initialCameraPosition: CameraPosition(target: _origin, zoom: 10),
        polylines: _polylines,
        markers: {
          Marker(markerId: const MarkerId('origin'), position: _origin),
          Marker(markerId: const MarkerId('destination'), position: _destination),
        },
      ),
    );
  }
}
