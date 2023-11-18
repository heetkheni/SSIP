import 'dart:convert';

import 'package:arogya_mitra/screens/admin_profile_screen.dart';
import 'package:arogya_mitra/screens/chat_screen.dart';
import 'package:arogya_mitra/screens/home_screen.dart';
import 'package:arogya_mitra/screens/markers_list_screen.dart';
import 'package:arogya_mitra/screens/profile_screen.dart';
import 'package:arogya_mitra/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HealthCenterMap extends StatefulWidget {
  @override
  _HealthCenterMapState createState() => _HealthCenterMapState();
}

class _HealthCenterMapState extends State<HealthCenterMap> {
  int _currentIndex = 1;
  List<Widget> screens = [HomeScreen(), HealthCenterMap(), ChatScreen(), ProfileScreen()];
  GoogleMapController? mapController;
  Location _locationController = Location();
  LatLng? _currentPosition;
  Set<Marker> _markers = {};
  Marker? _selectedMarker;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
    fetchNearbyHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the markers list screen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarkersListScreen(markers: _markers),
            ),
          );
        },
        child: Icon(Icons.list),
      ),
      body: Stack(
        children: [
          _currentPosition == null
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _currentPosition!,
                    zoom: 14.0,
                  ),
                  markers: _markers,
                  onTap: (_) {
                    setState(() {
                      _selectedMarker = null;
                    });
                  },
                  // onMarkerTapped: (Marker marker) {
                  //   setState(() {
                  //     _selectedMarker = marker;
                  //   });
                  // },
                ),
                
          if (_selectedMarker != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 100,
              child: Container(
                height: 100,
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedMarker!.infoWindow.title ?? '',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _selectedMarker!.infoWindow.snippet ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) async {
          if (i == 3) {
            bool isAdmin = AuthServices().isAdminUser();

            if (isAdmin) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdminProfileScreen()));
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            }
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screens[i]));
          }
        },
        selectedItemColor: Color(0xFF0856DE),
        itemPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.local_hospital,
            ),
            title: const Text("Hospital"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.message),
            title: const Text("Chat"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition!, 15.0),
      );
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
        if (currentLocation.latitude != null && currentLocation.longitude != null) {
          setState(() {
            _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          });

          await updateMarkers();
        }
      },
    );
  }

  Future<void> fetchNearbyHospitals() async {
    if (_currentPosition == null) return;

    final String apiKey = "AIzaSyDZBDsy-h4nwFjLLMncwwhYnGTdtBM9jY8";
    final String apiUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${_currentPosition!.latitude},${_currentPosition!.longitude}&radius=5000&type=hospital&key=${apiKey}";

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
            Marker(markerId: MarkerId(name), position: LatLng(lat, lng), infoWindow: InfoWindow(title: name, snippet: result['vicinity']), onTap: () {}),
          );
        }

        setState(() {});
      }
    }
  }

    Future<void> updateMarkers() async {
    await fetchNearbyHospitals();

    Set<Marker> markers = {
      Marker(
        markerId: MarkerId('currentLocation'),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
      ..._markers,
    };

    setState(() {
      _markers = markers;
    });
  }
}

    
    
    
    
    
    
    
//     Scaffold(
//       body: _currentPosition == null
//           ? Center(child: CircularProgressIndicator())
//           : GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _currentPosition!,
//                 zoom: 14.0,
//               ),
//               markers: _markers,
//             ),
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: _currentIndex,
//         onTap: (i) {
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) => screens[i]));
//         },
//         selectedItemColor: Color(0xFF0856DE),
//         itemPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         items: [
//           SalomonBottomBarItem(
//             icon: const Icon(
//               Icons.home,
//             ),
//             title: const Text("Home"),
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(
//               Icons.local_hospital,
//             ),
//             title: const Text("Hospital"),
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.message),
//             title: const Text("Chat"),
//           ),
//           SalomonBottomBarItem(
//             icon: const Icon(Icons.person),
//             title: const Text("Profile"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;

//       // Center the map on Gir Somnath when it's created
//       mapController!.animateCamera(
//         CameraUpdate.newLatLngZoom(LatLng(20.8500, 70.4833), 15.0),
//       );

//       // Fetch nearby hospitals once the map is created
//       fetchNearbyHospitals();
//     });
//   }

//   Future<void> getLocationUpdates() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await _locationController.serviceEnabled();

//     if (_serviceEnabled) {
//       _serviceEnabled = await _locationController.requestService();
//     } else {
//       return;
//     }

//     _permissionGranted = await _locationController.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _locationController.requestPermission();

//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _locationController.onLocationChanged.listen(
//       (LocationData currentLocation) async {
//         if (currentLocation.latitude != null && currentLocation.longitude != null) {
//           setState(() {
//             _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
//           });

//           // Update markers when location changes
//           await fetchNearbyHospitals();
//         }
//       },
//     );
//   }

//   Future<void> fetchNearbyHospitals() async {
//     final String apiKey = "AIzaSyDZBDsy-h4nwFjLLMncwwhYnGTdtBM9jY8";
//     final String apiUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=20.8135,70.4644&radius=5000&type=hospital&key=${apiKey}";

//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       if (data['status'] == 'OK') {
//         final List<dynamic> results = data['results'];

//         for (final result in results) {
//           final String name = result['name'];
//           final double lat = result['geometry']['location']['lat'];
//           final double lng = result['geometry']['location']['lng'];

//           _markers.add(
//             Marker(markerId: MarkerId(name), position: LatLng(lat, lng), infoWindow: InfoWindow(title: name), onTap: () {}),
//           );
//         }

//         setState(() {}); // Update the state to trigger a rebuild with markers
//       }
//     }
//   }

//   Future<void> updateMarkers() async {
//     // Fetch nearby hospitals using a service like Google Places API
//     // Here, I'm adding a sample marker for demonstration purposes
//     await fetchNearbyHospitals(); // Fetch nearby hospitals

//     Set<Marker> markers = {
//       Marker(
//         markerId: MarkerId('currentLocation'),
//         position: _currentPosition!,
//         infoWindow: InfoWindow(title: 'Your Location'),
//       ),
//       ..._markers, // Add other markers fetched from the API
//     };

//     setState(() {
//       _markers = markers;
//       print(markers);
//     });
//   }
// }
