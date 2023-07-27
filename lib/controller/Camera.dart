import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:lihat_in/logs.dart';

class Camera with ChangeNotifier{
  bool enableAudio = true;

  List<CameraDescription> _availableCamera = [];

  List get availableCamera=>_availableCamera;

  


  void _checkCamera() async {
    try {
        WidgetsFlutterBinding.ensureInitialized();
        _availableCamera = await availableCameras();
        print(availableCamera);
      } on CameraException catch (e) {
        Log().logError(e.code, e.description);
      }
  }

   Future<CameraController> initializeCameraController(
      CameraDescription cameraDescription, CameraController? controller) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: enableAudio,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;
    return controller;
    
  }

  void onPictureTake(CameraController usedControler) {

    usedControler.takePicture().then(
      (XFile? imageFile){
        if (imageFile != null) {
          print(imageFile.path);
        }
      } 
      );

  }

  

}