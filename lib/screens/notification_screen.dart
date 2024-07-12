// import 'dart:convert';
// import 'dart:io';
// import 'package:arogya_mitra/Widgets/widget.dart';
// import 'package:arogya_mitra/services/notification_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({Key? key}) : super(key: key);

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   NotificationServices notificationServices = NotificationServices();

//   @override
//   void initState() {
//     super.initState();
//     notificationServices.notificationPermission();
//     notificationServices.firebaseInit();
//     notificationServices.isTokenRefresh();
//     notificationServices.getToken().then((value) {
//       print(value);
//     });
//     selectedToken = tokens.first;
//   }

//   final List<String> tokens = [
//     "cPpihhK9SniTnWsDkPAFrm:APA91bGdUYEdhAyO-44H_BdxxKZMmDfleIuoaBUVBhxSyHuDM5r4t68nu7xcnD41LlEdB3maCY_dCi5IETyvk1awqBe_tjJWCMq1UDSdOybrVEQUC5zetvxeSGCrv36EyFME9KkyvPJr",
//     "fH2EGtp7Q5iVZbYB_mhFpZ:APA91bHj8-8I3IaKDdLxuN6Wg380bOoNo8EEUSAUh1ZXDg8z0HToOBWFVn1int6RR-h43j6CrcpohHiGlv1bSA2h_6D7TG6v9ow6OdLXw-ICSpIh6y5Dp96ZaGpe1-raXG2G0xbZT0cH",
//   ];

//   String selectedToken = "";
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   String? imageUrl;

//   Future<void> _sendNotification(
//       String token, String title, String body, String? imageUrl) async {
//     final String serverKey =
//         "AAAA58nY7Lg:APA91bEGhtk7nsXkT63O_AKauTdtGHvs3DXxkecXqZfLsZ5y4OJI7LRihTt1yK88LQbDnepGjxejyrVL_y1Tlmzwv4yB4jrxNFi0ZzyPQExgxcx9DZy3JKjuujiRZnt8l3nZoKEQogeD";

//     final url = 'https://fcm.googleapis.com/fcm/send';
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'key=$serverKey',
//     };

//     final Map<String, dynamic> data = {
//       'to': token,
//       'notification': {
//         'title': title,
//         'body': body,
//         //'image': imageUrl,
//       },
//     };

//     final response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: jsonEncode(data),
//     );

//     if (response.statusCode == 200) {
//       print('Notification sent successfully!');
      
//     } else {
//       print('Failed to send notification. Status code: ${response.statusCode}');
//     }

//     // await _firestore.collection('notifications').add({
//     //   'title': title,
//     //   'body': body,
//     //   'description': descriptionController.text,
//     //   //'imageUrl': imageUrl,
//     // }).then((value) {
//     //   print("Data Saved");
//     // }).onError((error, stackTrace) {
//     //   print(error.toString());
//     // });
//   }

//   Future<void> _sendAllNotifications(
//       String title, String body, String? imageUrl) async {
//     for (String token in tokens) {
//       await _sendNotification(token, title, body, imageUrl);
//     }

//     await _firestore.collection('notifications').add({
//       'title': title,
//       'body': body,
//       'description': descriptionController.text,
//       'imageUrl': imageUrl,
//     });
//   }

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//         imageUrl =await uploadImageToFirebaseStorage(File(pickedFile.path));
//       setState(() {
//          imageUrl = imageUrl; 
//       });
//     }
//   }

//   Future<void> _deleteNotificationsCollection() async {
//     try {
//       await _firestore.collection('notifications').get().then((snapshot) {
//         for (DocumentSnapshot doc in snapshot.docs) {
//           doc.reference.delete();
//         }
//       });
//       print('Notifications collection deleted successfully!');
//     } catch (error) {
//       print('Failed to delete notifications collection: $error');
//     }
//   }

//   // Future<void> _pickImage() async {
//   //   final pickedFile =
//   //       await ImagePicker().pickImage(source: ImageSource.gallery);

//   //   if (pickedFile != null) {
//   //     String? imageUrl =
//   //         await uploadImageToFirebaseStorage(File(pickedFile.path));

//   //     setState(() {
//   //       imageUrl = imageUrl;
//   //     });
//   //   }
//   // }

//   Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
//     try {
//       firebase_storage.Reference storageReference = firebase_storage
//           .FirebaseStorage.instance
//           .ref()
//           .child("images/${DateTime.now().millisecondsSinceEpoch}");

//       firebase_storage.UploadTask uploadTask =
//           storageReference.putFile(imageFile);

//       await uploadTask.whenComplete(() => null);

//       String imageUrl = await storageReference.getDownloadURL();
//       print(imageUrl);
//       return imageUrl;
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double widht = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Send Notification"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Select FCM Token:',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 DropdownButton<String>(
//                   value: selectedToken,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedToken = newValue!;
//                     });
//                   },
//                   items: tokens.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value.length < 20
//                             ? value
//                             : value.substring(0, 30).toString(),
//                         style: TextStyle(fontSize: 15),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Enter Notification Details:',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: titleController,
//                   decoration: textInputDecoration.copyWith(
//                     labelText: 'Title',
//                     labelStyle:
//                         TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//                     prefixIcon: Icon(
//                       Icons.announcement,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: bodyController,
//                   decoration: textInputDecoration.copyWith(
//                     labelText: 'Body',
//                     labelStyle:
//                         TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//                     prefixIcon: Icon(
//                       Icons.message,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: descriptionController,
//                   decoration: textInputDecoration.copyWith(
//                     labelText: 'Description',
//                     labelStyle:
//                         TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
//                     prefixIcon: Icon(
//                       Icons.book,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton.icon(
//                   onPressed: _pickImage,
//                   icon: Icon(Icons.image), // Choose an appropriate icon
//                   label: Text('Pick Image'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Set the button background color
//                     onPrimary: Colors.white, // Set the text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           8.0), // Adjust the border radius
//                     ),
//                   ),
//                 ),
//                 if (imageUrl != null)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 8.0, vertical: 10),
//                     child: Image.file(
//                       File(imageUrl!),
//                       height: height * 0.3,
//                       width: widht * 0.95,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                 else
//                   Container(
//                     height: 100,
//                     width: 100,
//                     color: Colors.grey,
//                     child: Center(
//                       child: Text('No Image'),
//                     ),
//                   ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     _sendNotification(selectedToken, titleController.text,
//                         bodyController.text, imageUrl);
//                   },
//                   child: Text('Send Notification'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.green, // Set the button background color
//                     onPrimary: Colors.white, // Set the text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           8.0), // Adjust the border radius
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     _sendAllNotifications(
//                         titleController.text, bodyController.text, imageUrl);
//                   },
//                   child: Text('Send All Notifications'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue, // Set the button background color
//                     onPrimary: Colors.white, // Set the text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           8.0), // Adjust the border radius
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     _deleteNotificationsCollection();
//                   },
//                   child: Text('Delete Notifications Collection'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.red, // Set the button background color
//                     onPrimary: Colors.white, // Set the text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           8.0), // Adjust the border radius
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'dart:io';
import 'package:arogya_mitra/Widgets/widget.dart';
import 'package:arogya_mitra/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.notificationPermission();
    notificationServices.firebaseInit();
    notificationServices.isTokenRefresh();
    notificationServices.getToken().then((value) {
      print(value);
    });
    selectedToken = tokens.first;
  }

  final List<String> tokens = [
    "cPpihhK9SniTnWsDkPAFrm:APA91bGdUYEdhAyO-44H_BdxxKZMmDfleIuoaBUVBhxSyHuDM5r4t68nu7xcnD41LlEdB3maCY_dCi5IETyvk1awqBe_tjJWCMq1UDSdOybrVEQUC5zetvxeSGCrv36EyFME9KkyvPJr"
    "eG1sU37cTVKRhS7_w0jVIi:APA91bFWbTxIgYED75M3EhmvuAOOinI7Lczv3BDx0IGNhFIXKJwLLReTCwwlDjm5w-E681pLP_0LIESP9BmHpVD4Ph4-2GNarZ5u6DICn3Z2Jnm7F6SKLMvm1WkHFaRYd8fotnDH_MpS"
    "eRdvcOYWTTCRvKzdc3PDs7:APA91bHZIvVxttRBVBC9LaeasRp8ppNr3oI9_S8ugPoUoYefJGgAXlGJQMTtMYppn4S2k4a2vCAMQMrZKIZGwbrAzcxrqQyipajPEC7ztOEumA4jtFx3LqfX4IR6q-ntu56i7rWi5Tze"
    "cPpihhK9SniTnWsDkPAFrm:APA91bGdUYEdhAyO-44H_BdxxKZMmDfleIuoaBUVBhxSyHuDM5r4t68nu7xcnD41LlEdB3maCY_dCi5IETyvk1awqBe_tjJWCMq1UDSdOybrVEQUC5zetvxeSGCrv36EyFME9KkyvPJr"
    "fH2EGtp7Q5iVZbYB_mhFpZ:APA91bHj8-8I3IaKDdLxuN6Wg380bOoNo8EEUSAUh1ZXDg8z0HToOBWFVn1int6RR-h43j6CrcpohHiGlv1bSA2h_6D7TG6v9ow6OdLXw-ICSpIh6y5Dp96ZaGpe1-raXG2G0xbZT0cH"
  ];

  String selectedToken = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? imageUrl;

  Future<void> _sendNotification(
      String token, String title, String body, String? imageUrl) async {
    final String serverKey =
        "AAAA58nY7Lg:APA91bEGhtk7nsXkT63O_AKauTdtGHvs3DXxkecXqZfLsZ5y4OJI7LRihTt1yK88LQbDnepGjxejyrVL_y1Tlmzwv4yB4jrxNFi0ZzyPQExgxcx9DZy3JKjuujiRZnt8l3nZoKEQogeD";

    final url = 'https://fcm.googleapis.com/fcm/send';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final Map<String, dynamic> data = {
      'to': token,
      'notification': {
        'title': title,
        'body': body,
        //'image': imageUrl,
      },
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully!');
    } else {
      print('Failed to send notification. Status code: ${response.statusCode}');
    }

    await _firestore.collection('notifications').add({
      'title': title,
      'body': body,
      'description': descriptionController.text,
      //'imageUrl': imageUrl,
    }).then((value) {
      print("Data Saved");
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  Future<void> _sendAllNotifications(
      String title, String body, String? imageUrl) async {

    

    for (String token in tokens) {
      await _sendNotification(token, title, body, imageUrl);
    }

    await _firestore.collection('notifications').add({
      'title': title,
      'body': body,
      //'description': descriptionController.text,
      'imageUrl': imageUrl,
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageUrl = await uploadImageToFirebaseStorage(File(pickedFile.path));
      setState(() {
        // Assign the retrieved imageUrl to the class variable
        imageUrl = imageUrl;
      });
    }
  }

  Future<String?> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().millisecondsSinceEpoch}");

      firebase_storage.UploadTask uploadTask =
          storageReference.putFile(imageFile);

      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();
      print(imageUrl);
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _deleteNotificationsCollection() async {
    try {
      await _firestore.collection('notifications').get().then((snapshot) {
        for (DocumentSnapshot doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      print('Notifications collection deleted successfully!');
    } catch (error) {
      print('Failed to delete notifications collection: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widht = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Send Notification"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: SingleChildScrollView(
            child:
            Container()
            //  Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     // Text(
            //     //   'Select FCM Token:',
            //     //   style: TextStyle(
            //     //     fontSize: 18,
            //     //     fontWeight: FontWeight.bold,
            //     //   ),
            //     // ),
            //     // DropdownButton<String>(
            //     //   value: selectedToken,
            //     //   onChanged: (String? newValue) {
            //     //     setState(() {
            //     //       selectedToken = newValue!;
            //     //     });
            //     //   },
            //     //   items: tokens.map<DropdownMenuItem<String>>((String value) {
            //     //     return DropdownMenuItem<String>(
            //     //       value: value,
            //     //       child: Text(
            //     //         value.length < 20
            //     //             ? value
            //     //             : value.substring(0, 30).toString(),
            //     //         style: TextStyle(fontSize: 15),
            //     //       ),
            //     //     );
            //     //   }).toList(),
            //     // ),
            //     SizedBox(height: 16),
            //     Text(
            //       'Enter Notification Details:',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       controller: titleController,
            //       decoration: textInputDecoration.copyWith(
            //         labelText: 'Title',
            //         labelStyle:
            //             TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            //         prefixIcon: Icon(
            //           Icons.announcement,
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     TextFormField(
            //       controller: bodyController,
            //       decoration: textInputDecoration.copyWith(
            //         labelText: 'Body',
            //         labelStyle:
            //             TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            //         prefixIcon: Icon(
            //           Icons.message,
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 12,
            //     ),
            //     // TextFormField(
            //     //   controller: descriptionController,
            //     //   decoration: textInputDecoration.copyWith(
            //     //     labelText: 'Description',
            //     //     labelStyle:
            //     //         TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            //     //     prefixIcon: Icon(
            //     //       Icons.book,
            //     //       color: Theme.of(context).primaryColor,
            //     //     ),
            //     //   ),
            //     // ),
            //     // SizedBox(height: 16),
            //     ElevatedButton.icon(
            //       onPressed: _pickImage,
            //       icon: Icon(Icons.image), // Choose an appropriate icon
            //       label: Text('Pick Image'),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.blue, // Set the button background color
            //         onPrimary: Colors.white, // Set the text color
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(
            //               8.0), // Adjust the border radius
            //         ),
            //       ),
            //     ),
            //     const SizedBox(height: 10,),
            //     if (imageUrl != null)
            //       Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 8.0, vertical: 10),
            //         child: Image.network(
            //           imageUrl!,
            //           height: height * 0.3,
            //           width: widht * 0.95,
            //           fit: BoxFit.cover,
            //         ),
            //       )
            //     else
            //       Container(
            //         height: height *0.3,
            //         width: height * 0.95,
            //         color: Colors.grey,
            //         child: Center(
            //           child: Text('No Image'),
            //         ),
            //       ),
            //     SizedBox(height: 16),
            //     // ElevatedButton(
            //     //   onPressed: () {
            //     //     _sendNotification(selectedToken, titleController.text,
            //     //         bodyController.text, imageUrl);
            //     //   },
            //     //   child: Text('Send Notification'),
            //     //   style: ElevatedButton.styleFrom(
            //     //     primary: Colors.green, // Set the button background color
            //     //     onPrimary: Colors.white, // Set the text color
            //     //     shape: RoundedRectangleBorder(
            //     //       borderRadius: BorderRadius.circular(
            //     //           8.0), // Adjust the border radius
            //     //     ),
            //     //   ),
            //     // ),
            //     // SizedBox(height: 8),
            //     ElevatedButton(
            //       onPressed: () {
            //         _sendAllNotifications(
            //             titleController.text, bodyController.text, imageUrl);
            //       },
            //       child: Text('Send All Notifications'),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.blue, // Set the button background color
            //         onPrimary: Colors.white, // Set the text color
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(
            //               8.0), // Adjust the border radius
            //         ),
            //       ),
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         _deleteNotificationsCollection();
            //       },
            //       child: Text('Delete Notifications Collection'),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.red, // Set the button background color
            //         onPrimary: Colors.white, // Set the text color
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(
            //               8.0), // Adjust the border radius
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            
          ),
        ),
      ),
    );
  }
}
