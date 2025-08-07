import 'dart:async';
import 'dart:io';
import 'package:attendence_app/widgets/customScaffoldWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';



class TireScannerScreen extends StatefulWidget {
  @override
  _TireScannerScreenState createState() => _TireScannerScreenState();
}

class _TireScannerScreenState extends State<TireScannerScreen> {
  File? _capturedImage;
  bool _isAdShowing = false;
  bool _showReport = false;
  VideoPlayerController? _videoController;

  Future<void> _scanImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _isAdShowing = true;
        _capturedImage = File(pickedFile.path);
        _showReport = false;
      });

      _videoController = VideoPlayerController.asset('assets/sample_ad.mp4')
        ..initialize().then((_) {
          setState(() {});
          _videoController!.play();
        });

      // Delay 15 seconds before showing result
      await Future.delayed(Duration(seconds: 15));

      _videoController?.pause();
      setState(() {
        _isAdShowing = false;
        _showReport = true;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Widget _buildScanView() {
    return GestureDetector(
      onTap: _scanImage,
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
        child: Center(
          child: Text(
            '📷 Tap to Scan Image',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildAdScreen() {
    return Center(
      child: _videoController != null && _videoController!.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            )
          : CircularProgressIndicator(),
    );
  }

  Widget _buildResultView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (_capturedImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                _capturedImage!,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(height: 20),
          Text(
            'Tiretest.ai Analysis',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '✔️ Tread depth is optimal\n'
              '✔️ No visible cracks\n'
              '✔️ Tire pressure appears consistent\n'
              '⚠️ Recommend full check after 1000km\n',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    if (_isAdShowing) {
      bodyContent = _buildAdScreen();
    } else if (_showReport) {
      bodyContent = _buildResultView();
    } else {
      bodyContent = Center(child: _buildScanView());
    }

    return CustomScaffoldWidget(
     // appBar: AppBar(title: Text('Tiretest.ai Anaylsis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: bodyContent,
      ), appbartitle: 'Report',
    );
  }
}