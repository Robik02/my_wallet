import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'success_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late ImagePicker _imagePicker;

  late BuildContext storedContext;
  late String capturedImagePath;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _initializeCamera(context);
  }

  Future<void> _initializeCamera(BuildContext context) async {
    storedContext = context;

    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Card'),
      ),
      body: _buildCameraPreview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _imagePicker.pickImage(source: ImageSource.camera);

          if (image != null) {
            processCapturedImage(image);

            Navigator.push(
              storedContext,
              MaterialPageRoute(
                builder: (context) => SuccessScreen(cardName: 'Test', imagePath: capturedImagePath),
              ),
            );
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_controller.value.isInitialized ?? false) {
      return CameraPreview(_controller);
    } else {
      return Container();
    }
  }

  void processCapturedImage(XFile image) {
    print("Captured image path: ${image.path}");

    // Save the image to a variable
    capturedImagePath = image.path;

    // TODO: Implement further image processing and data extraction
  }
}