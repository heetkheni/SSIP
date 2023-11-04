import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersListScreen extends StatelessWidget {
  final Set<Marker> markers;

  MarkersListScreen({required this.markers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markers List'),
      ),
      body: ListView.builder(
        itemCount: markers.length,
        itemBuilder: (context, index) {
          Marker marker = markers.elementAt(index);

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(marker.infoWindow.title ?? ''),
              subtitle: Text(marker.infoWindow.snippet ?? ''),
              onTap: () {
                // You can add navigation or other actions here when a marker card is tapped
              },
            ),
          );
        },
      ),
    );
  }
}
