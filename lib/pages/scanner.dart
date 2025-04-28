import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:eco_advisor/pages/Home.dart';
import 'package:eco_advisor/pages/scanning_result.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isProcessing = false;
  
  // Camera controller
  CameraController? _cameraController;
  List<CameraDescription> cameras = [];
  bool _isCameraInitialized = false;
  bool _isFrontCamera = false;
  
  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No cameras found')),
        );
        return;
      }
      
      // Start with back camera
      await _setupCamera(cameras[0]);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing camera: $e')),
      );
    }
  }
  
  Future<void> _setupCamera(CameraDescription camera) async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
    }
    
    _cameraController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    
    try {
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error setting up camera: $e')),
      );
    }
  }
  
  Future<void> _switchCamera() async {
    if (cameras.length < 2) return;
    
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      _isCameraInitialized = false;
    });
    
    await _setupCamera(cameras[_isFrontCamera ? 1 : 0]);
  }
  
  Future<void> _takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Camera is not initialized')),
      );
      return;
    }
    
    try {
      setState(() {
        _isProcessing = true;
      });
      
      final XFile photo = await _cameraController!.takePicture();
      setState(() {
        _image = File(photo.path);
      });
      
      // Simulate AI processing delay
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() {
        _isProcessing = false;
      });
      
      // Navigate to scanning result page
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanningResultPage(
            image: _image,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error taking picture: $e')),
      );
    }
  }
  
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = File(image.path);
          _isProcessing = true;
        });
        
        // Simulate processing delay
        await Future.delayed(const Duration(seconds: 2));
        
        setState(() {
          _isProcessing = false;
        });
        
        // Navigate to scanning result page
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScanningResultPage(
              image: _image,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize camera when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeCamera();
    });
  }
  
  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 700,
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 50), // <-- Add this line to increase space (adjust height as needed)
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Camera preview
                  _isCameraInitialized && _cameraController != null
                      ? ClipRRect(
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: CameraPreview(_cameraController!),
                          ),
                        )
                      : Container(
                          color: Colors.black,
                          child: const Center(
                            child: CircularProgressIndicator(color: Color(0xFFAEE55B)),
                          ),
                        ),
                  
                  // Top controls
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0),
                        shape: BoxShape.circle
                      ),
                      child: const Icon(
                        Icons.flash_off,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  
                  // AI indicator
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'AI',
                        style: TextStyle(
                          color: Color(0xFFFFD700), // Gold color for AI
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  
                  // Scanning frame overlay
                  Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      child: Stack(
                        children: [
                          // Top-left corner
                          Positioned(
                            top: 0,
                            left: 0,
                            child: _buildCorner(),
                          ),
                          // Top-right corner
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Transform.rotate(
                              angle: 90 * 3.14159 / 180,
                              child: _buildCorner(),
                            ),
                          ),
                          // Bottom-left corner
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Transform.rotate(
                              angle: 270 * 3.14159 / 180,
                              child: _buildCorner(),
                            ),
                          ),
                          // Bottom-right corner
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Transform.rotate(
                              angle: 180 * 3.14159 / 180,
                              child: _buildCorner(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Processing indicator
                  if (_isProcessing)
                    Container(
                      color: Colors.black.withOpacity(0.7),
                      child: const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(color: Color(0xFFAEE55B)),
                            SizedBox(height: 16),
                            Text(
                              'Analyzing...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Add spacing between camera frame and bottom controls
            const SizedBox(height: 40),
            // Bottom controls
            Container(
              height: 100,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Gallery button
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.photo_library, color: Colors.white, size: 35),
                    ),
                    onPressed: _pickImageFromGallery,
                    iconSize: 48,
                  ),
                  
                  // Capture button
                  GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  
                  // Switch camera button
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(Icons.flip_camera_ios, color: Colors.white, size: 35),
                    ),
                    onPressed: _switchCamera,
                    iconSize: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper method to build corner brackets for the scanning frame
  Widget _buildCorner() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: CornerPainter(),
      ),
    );
  }
}

// Custom painter for corner brackets
class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    
    final Path path = Path()
      ..moveTo(0, size.height * 0.4)
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.4, 0);
    
    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}