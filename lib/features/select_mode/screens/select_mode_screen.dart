import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import '../../../shared/widgets/app_main_button.dart';
import '../../../ui/camera.dart';
import '../../../ui/gallery.dart';
import '../../auth/auth_service.dart';
import '../../auth/screens/login_screen.dart';

class SelectModeScreen extends StatefulWidget {
  const SelectModeScreen({Key? key}) : super(key: key);

  @override
  State<SelectModeScreen> createState() => _SelectModeScreenState();
}

class _SelectModeScreenState extends State<SelectModeScreen> {
  String loginUser = " ";
  late CameraDescription cameraDescription;
  int _selectedIndex = 0;
  List<Widget>? _widgetOptions;

  bool cameraIsAvailable = Platform.isAndroid || Platform.isIOS;
  @override
  void initState() {
    super.initState();
    getUserName();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initPages();
    });
  }

  initPages() async {
    _widgetOptions = [const GalleryScreen()];

    if (cameraIsAvailable) {
      // get list available camera
      cameraDescription = (await availableCameras()).first;
      _widgetOptions!.add(CameraScreen(camera: cameraDescription));
    }

    setState(() {});
  }

  void _onItemTapped(int index) {
    if (!cameraIsAvailable) {
      debugPrint("This is not supported on your current platform");
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString("user") ?? "";

    Map<String, dynamic> savedUser = jsonDecode(userJson);

    String username = savedUser['username'];

    setState(() {
      loginUser = username;
    });
  }

  File? profilePictureFile;
  String? profilePicture;

  final AuthService authService = AuthService();
  void _logout(BuildContext context) async {
    await authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text(
          'Hello! $loginUser',
          style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
        backgroundColor: Color(0xff51a13d),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _widgetOptions?.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Select From Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Live Camera',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
