import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PolylineScreen extends StatefulWidget {
  final double destinationLatitude;
  final double destinationLongitude;

  const PolylineScreen({
    Key? key,
    required this.destinationLatitude,
    required this.destinationLongitude,
  }) : super(key: key);

  @override
  State<PolylineScreen> createState() => _PolylineScreenState();
} 

class _PolylineScreenState extends State<PolylineScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late Location location;
  late Future<LocationData> currentLocation;

  @override
  void initState() {
    super.initState();
    location = Location();
    currentLocation = getLocation();
  }

  Future<LocationData> getLocation() async {
    try {
      return await location.getLocation();
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PolyLine"),
      ),
      body: FutureBuilder(
        future: currentLocation,
        builder: (context, AsyncSnapshot<LocationData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If still waiting for the current location, you can show a loading indicator
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error while obtaining the location, handle it here
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            // Once the location is obtained, show the Google Map
            LocationData userLocation = snapshot.data!;

            return GoogleMap(
              markers: {
                Marker(
                  markerId: MarkerId('currentPosition'),
                  position: LatLng(userLocation.latitude ?? 0.0, userLocation.longitude ?? 0.0),
                  infoWindow: InfoWindow(
                    title: 'Current Position',
                    snippet: '5 star',
                  ),
                  icon: BitmapDescriptor.defaultMarker,
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: LatLng(widget.destinationLatitude, widget.destinationLongitude),
                  infoWindow: InfoWindow(
                    title: 'Destination',
                    snippet: '5 star',
                  ),
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('1'),
                  points: [
                    LatLng(userLocation.latitude ?? 0.0, userLocation.longitude ?? 0.0), // Current position
                    LatLng(widget.destinationLatitude, widget.destinationLongitude), // Destination
                  ],
                  color: Colors.blue, // Set the color to blue
                ),
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(userLocation.latitude ?? 0.0, userLocation.longitude ?? 0.0),
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              mapType: MapType.normal,
              myLocationEnabled: true,
            );
          }
        },
      ),
    );
  }
}
