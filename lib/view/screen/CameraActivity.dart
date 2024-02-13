

import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';
import '../../network/viewmodel/MyProfileVM.dart';
import '../../utills/AppString.dart';
import '../../utills/CustomColor.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler ;


import 'dart:async';

void main() {
  setupLocator();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyProfileVM()),


        ],
        child: MaterialApp(
          // theme: ThemeData(
          //   primaryColor: CustomColor.white,
          //   primaryColorDark: CustomColor.white,// Define the primary color
          //   iconTheme: IconThemeData(color: Colors.white),
          // ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.white),
            useMaterial3: true,
            textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
              bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
            ),
          ),
          debugShowCheckedModeBanner: false,
          // initialRoute: Routes.initialRoute,
          // routes: Routes.routes,
          home: CameraActivity(),
          //home: YourScreen(),
          // home: PortraitLandscapePlayerPage(),
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/DashBoard': (context) =>  CameraActivity(),


          },
        )
    );


  }
}



class CameraActivity extends StatefulWidget {
  CameraActivity();

  @override
  State<CameraActivity> createState() => _CameraActivityState();
}

class _CameraActivityState extends State<CameraActivity> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image



  @override
  void initState() {
    loadCamera();

    _checkPermissions();

    super.initState();
  }
  final Location location = Location();

  PermissionStatus? _permissionGranted;

  Future<void> _checkPermissions() async
  {
    final permissionGrantedResult = await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
    if (_permissionGranted != PermissionStatus.granted) {
      final permissionRequestedResult = await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    } else {
      _checkService();
    }
  }

  Future<void> _checkService() async
  {
    final serviceEnabledResult = await location.serviceEnabled();
    setState(() {
      _serviceEnabled = serviceEnabledResult;
    });


    if (!(_serviceEnabled ?? false))
    {
      final serviceRequestedResult = await location.requestService();
      setState(()
      {
        _serviceEnabled = serviceRequestedResult;
      });
      if (_serviceEnabled == false)
      {
        _checkService();
      }
    }
  }


  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted)
    {
      final permissionRequestedResult = await location.requestPermission();
      setState(()
      {
        _permissionGranted = permissionRequestedResult;
      });
    }
    else{
      _checkService();
    }


  }

  bool? _serviceEnabled;


  loadCamera() async {
    cameras = await availableCameras();

    if (cameras != null)
    {
      controller = CameraController(
          cameras![selectedCameraIndex], ResolutionPreset.high);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  List<CameraDescription> camerasdesc = [];

  int selectedCameraIndex = 0;
  String FilePath = "";

  void _onSwitchCamera()
  {
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras!.length;
    controller =
        CameraController(cameras![selectedCameraIndex], ResolutionPreset.high);

    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    Navigator.pop(context, true);
    return true; // Example: Always allow back navigation
  }


 Widget CameraBt()
  {
    return Padding(

        padding: const EdgeInsets.only(
            bottom: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async
            {
              try {
                if (controller != null) {
                  //check if contrller is not null
                  if (controller!.value.isInitialized) {
                    //check if controller is initialized
                    final  image = await controller! .takePicture(); //capture image

                    FilePath = image?.path ?? "";
                    Provider.of<MyProfileVM>(context, listen: false).myData = FilePath;
                    setState(() {

                    });

                    _onBackPressed(context);
                  }
                }
              } catch (e) {
                print(e); //show error
              }




            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0, // 1 pixel white border
                ),
              ),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,   decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                    width: 1.0, // 1 pixel transparent gap
                  ),
                  color: Colors.white, // White fill color
                ),
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Align(
            alignment: Alignment.topLeft, child: Text(AppString.capture_pick,
            style: TextStyle(color: Colors.white))),
        backgroundColor: CustomColor.purple,
        elevation: 2.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          tooltip: 'Menu Icon',
          onPressed: () {
            _onBackPressed(context);
          },
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: controller != null &&  controller!.value.isInitialized
              ? CameraPreview(controller!)
              : Center(child: CircularProgressIndicator(),
          )),
      floatingActionButton: CameraBt(),
    );
  }


}
