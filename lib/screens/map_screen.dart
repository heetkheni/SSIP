import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class HealthCenterMap extends StatefulWidget {
  @override
  _HealthCenterMapState createState() => _HealthCenterMapState();
}

class _HealthCenterMapState extends State<HealthCenterMap> {
  GoogleMapController? mapController;
  Location _locationController = Location();
  LatLng? _currentPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
    fetchNearbyHospitals(); // Add this line
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 14.0,
              ),
              markers: _markers,
            ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
  setState(() {
    mapController = controller;

    // Center the map on Gir Somnath when it's created
    mapController!.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(20.8135, 70.4644), 14.0),
    );

    // Fetch nearby hospitals once the map is created
    fetchNearbyHospitals();
  });
}


  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();

    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen(
      (LocationData currentLocation) async {
        if (currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          setState(() {
            _currentPosition =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });

          // Update markers when location changes
          await fetchNearbyHospitals();
        }
      },
    );
  }

  Future<void> fetchNearbyHospitals() async {
    final String apiKey = "AIzaSyDZBDsy-h4nwFjLLMncwwhYnGTdtBM9jY8";
    final String apiUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=20.8135,70.4644&radius=5000&type=hospital&key=${apiKey}";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final List<dynamic> results = data['results'];

        for (final result in results) {
          final String name = result['name'];
          final double lat = result['geometry']['location']['lat'];
          final double lng = result['geometry']['location']['lng'];

          _markers.add(
            Marker(
                markerId: MarkerId(name),
                position: LatLng(lat, lng),
                infoWindow: InfoWindow(title: name),
                onTap: () {}),
          );
        }

        setState(() {}); // Update the state to trigger a rebuild with markers
      }
    }
  }

  Future<void> updateMarkers() async {
    // Fetch nearby hospitals using a service like Google Places API
    // Here, I'm adding a sample marker for demonstration purposes
    await fetchNearbyHospitals(); // Fetch nearby hospitals

    Set<Marker> markers = {
      Marker(
        markerId: MarkerId('currentLocation'),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
      ..._markers, // Add other markers fetched from the API
    };
    

    setState(() {
      _markers = markers;
      print(markers);
    });
  }
}
