//import 'dart:math';
//import 'package:background_sms/background_sms.dart';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:mini_project/main.dart';
import 'package:mini_project/safehome/SafeHome.dart';
import 'package:mini_project/safety_modules/safety_tips_home.dart';
//import 'package:mini_project/widgets/bookscree.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

//import 'package:mini_project/widgets/home_widgets/custom_appBar.dart';
import 'package:mini_project/widgets/home_widgets/CustomCarouel.dart';
import 'package:mini_project/widgets/home_widgets/emergency.dart';
import 'package:mini_project/widgets/live_safe.dart';
import 'package:mini_project/widgets/home_widgets/contacts.dart';
import 'package:mini_project/widgets/account.dart';
//import 'package:shake/shake.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mini_project/db/db_services.dart';
import 'package:geolocator/geolocator.dart';
import 'model/contactsm.dart';
import 'package:telephony/telephony.dart';

//import 'package:mini_project/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  //int qIndex = 2;
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  Position? _curentPosition;
  //String? _currentAddress;
  LocationPermission? permission;
  _getPermission() async => await [Permission.sms].request();
  _isPermissionGranted() async => await Permission.sms.status.isGranted;

  /*_sendSms(String phoneNumber, String message, {int? simSlot}) async {
      background_sms.SmsStatus result = await BackgroundSms.sendMessage(
          phoneNumber: phoneNumber, message: message, simSlot: 1);
     if (result == background_sms.SmsStatus.sent) {
    print("Sent");
         Fluttertoast.showToast(msg: "send");
       } else {
    Fluttertoast.showToast(msg: "failed");
       }
    }*/
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    final Telephony telephony = Telephony.instance;
    await telephony.requestPhoneAndSmsPermissions;
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _curentPosition = position;
        print(_curentPosition!.latitude);
        _getAddressFromLatLon();
      });
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  _getAddressFromLatLon() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _curentPosition!.latitude, _curentPosition!.longitude);

      Placemark place = placemarks[0];
      setState(() {

        //_currentAddress =
        "${place.locality},${place.postalCode},${place.street},";
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  /*getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }*/

  getAndSendSms() async {
    List<TContact> contactList = await DatabaseHelper().getContactList();

    //String messageBody =
        "https://maps.google.com/?daddr=${_curentPosition!.latitude},${_curentPosition!.longitude}";
    if (await _isPermissionGranted()) {
      contactList.forEach((element) {
        //_sendSms"${element.number}", "i am in trouble $messageBody");
      });
    } else {
      Fluttertoast.showToast(msg: "something wrong");
    }
  }

  @override
  void initState() {
    //getRandomQuote();
    super.initState();
    _getPermission();
    _getCurrentLocation();

    ////// shake feature ///

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            //body:Scaffold(),

            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    /*CustomAppBar(
                      //quoteIndex: qIndex,
                      onTap: () {
                        //getRandomQuote();
                      },
                    ),*/


                    CustomCarouel(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Emergency Contacts",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Emergency(),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Explore Live Savers",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    LiveSafe(),
                    SafeHome(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: WaterDropNavBar(
              backgroundColor: navigationBarColor,
              onItemSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });

                // Use Navigator to navigate to the desired screen based on the selected index
                switch (selectedIndex) {
                  case 0:
                  // Navigate to HomeScreen (optional)
                    break;
                  case 1:
                  // Navigate to BookScreen (replace with your screen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>FeaturedScreen()), // Replace BookScreen with your screen
                    );
                    break;
                  case 2:
                  // Navigate to AccountScreen (replace with your screen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactsPage()), // Replace AccountScreen with your screen
                    );
                    break;
                  case 3:
                  // Navigate to AccountScreen (replace with your screen)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountScreen()), // Replace AccountScreen with your screen
                    );
                    break;
                // Add more cases for additional icons/screens as needed
                }
              },
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  filledIcon: Icons.home,
                  outlinedIcon: Icons.home_rounded,
                ),
                BarItem(
                  filledIcon: Icons.cast_for_education,
                  outlinedIcon: Icons.cast_for_education_rounded,
                ),
                BarItem(
                  filledIcon: Icons.contact_page,
                  outlinedIcon: Icons.contact_page_rounded,
                ),
                BarItem(
                  filledIcon: Icons.account_circle,
                  outlinedIcon: Icons.account_circle_outlined,
                ),
              ],
            ),
          );
        }
      }

