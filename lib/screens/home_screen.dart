// ignore_for_file: prefer_const_constructors

import 'package:arogya_mitra/data/testdata.dart';
import 'package:arogya_mitra/screens/all_hospital_screen.dart';
import 'package:arogya_mitra/screens/admin_profile_screen.dart';
import 'package:arogya_mitra/screens/chat_screen.dart';
import 'package:arogya_mitra/screens/diabetic_screen.dart';
import 'package:arogya_mitra/screens/disease_screen.dart';
import 'package:arogya_mitra/screens/guidance_screen.dart';
import 'package:arogya_mitra/screens/hospital_screen.dart';
import 'package:arogya_mitra/screens/map_screen.dart';
import 'package:arogya_mitra/screens/nutrition_screen.dart';
import 'package:arogya_mitra/screens/profile_screen.dart';
import 'package:arogya_mitra/screens/test_screen.dart';
import 'package:arogya_mitra/screens/vaccine_screen.dart';
import 'package:arogya_mitra/services/auth_service.dart';
import 'package:arogya_mitra/services/db_services.dart';
import 'package:arogya_mitra/widgets/carousle_slider.dart';
import 'package:arogya_mitra/widgets/common_row.dart';
import 'package:arogya_mitra/widgets/search_bar.dart';
import 'package:arogya_mitra/widgets/service_circle_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;
  bool? isAdmin;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isAdmin = userEmail!.substring(0, 3) == "phc" || userEmail!.substring(0, 3) == "uhc" ||
          userEmail!.substring(0, 3) == "chc";
    });

    if (isAdmin! == false) {
      gettingUserData(user.uid);
    }
  }

  gettingUserData(String id) async {
    await DatabaseServices().getUserData(id).then((value) {
      setState(() {
        userData = value;
      });
    });
  }

  @override
  int _currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    HealthCenterMap(),
    ChatScreen(),
    ProfileScreen()
  ];
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: SizedBox(),
          elevation: 0,
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                userData != null
                    ? Text(userData!['fullName'],
                        style: Theme.of(context).textTheme.bodyLarge)
                    : Text("Loading....",
                        style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications,
                      color: Colors.black, size: 25)),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kheight * 0.005,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: SearchBarWidget(),
                ),
                SizedBox(
                  height: kheight * 0.01,
                ),
                Carousel(
                    imgURL1:
                        "https://media.istockphoto.com/vectors/prevention-of-covid19-infographic-poster-with-doctor-coronavirus-vector-id1216365040",
                    imgURL2:
                        "https://th.bing.com/th/id/OIP._KZBxvAp2wGHuMYrq6HBXQHaEW?pid=ImgDet&rs=1",
                    imgURL3:
                        "https://media.istockphoto.com/vectors/children-vaccination-and-immunization-concept-poster-doctor-with-vector-id1184156931?k=6&m=1184156931&s=170667a&w=0&h=X9NgWghAubwZCh1jBFbrlRIGrinN_gJ1jkK6wh5nNr8=",
                    Name1: "",
                    Name2: "",
                    Name3: ""),
                SizedBox(
                  height: kheight * 0.015,
                ),
                CommonRowWidget(text: "Services", onTap: () {}),
                Container(
                  height: kheight * 0.24,
                  width: kwidth * 0.93,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: Offset(1, 1)),
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ServiceCircleWidget(
                            radius: 24,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiseaseScreen()));
                            },
                            text: "Disease",
                            imgUrl: "assets/images/mask.png",
                          ),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                            radius: 20,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TestsScreen(allTests)));
                            },
                            text: "Test",
                            imgUrl: "assets/images/blood-test.png",
                          ),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                            radius: 23,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VaccineList()));
                            },
                            text: "Vaccine",
                            imgUrl: "assets/images/vaccines.png",
                          ),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                            radius: 21,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HospitalScreen()));
                            },
                            text: "Clinic",
                            imgUrl: "assets/images/clinic.png",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kheight * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ServiceCircleWidget(
                              radius: 24,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GuidanceScreen()));
                              },
                              text: "Exersice",
                              imgUrl: "assets/images/treadmill.png"),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                              radius: 24,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NutritionScreen()));
                              },
                              text: "Diet",
                              imgUrl: "assets/images/diet.png"),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                            radius: 24,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiabeticScreen()));
                            },
                            text: "Diabetes",
                            imgUrl: "assets/images/diabetes.png",
                          ),
                          SizedBox(
                            width: kwidth * 0.1,
                          ),
                          ServiceCircleWidget(
                            radius: 24,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AllHospitalScreen()));
                            },
                            text: "Hospital",
                            imgUrl: "assets/images/hospital.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) async {
            if (i == 3) {
              bool isAdmin = AuthServices().isAdminUser();

              if (isAdmin) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdminProfileScreen()));
              }
              else{
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileScreen()));
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
      ),
    );
  }
}
