import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CropDiseaseScreen extends StatefulWidget {
  @override
  _CropDiseaseScreenState createState() => _CropDiseaseScreenState();
}

class _CropDiseaseScreenState extends State<CropDiseaseScreen> {
  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _openWebPage(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Disease Detection'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF86E591),
              Color(0xFFFFFFFF), // Hex value: #FFFFFF (white)
              // Hex value: #86E591 (green)
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_image != null) ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(_image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your logic for processing the uploaded image
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Detect Disease',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ] else ...[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    _openWebPage(context, 'https://www.plant.id/');
                  },
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text(
                    'Plant ID',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: _getImageFromGallery,
                  leading: Icon(Icons.photo_library, color: Colors.blue),
                  title: Text(
                    'Select Image from Gallery',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: _getImageFromCamera,
                  leading: Icon(Icons.camera_alt, color: Colors.blue),
                  title: Text(
                    'Capture Image from Camera',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No image selected',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ],
            SizedBox(height: 20),
            Text(
              '\n\n\n\nTHIS IS IN DEVELOPMENT PHASE AND DOES NOT WORK AS OF NOW',
              style: TextStyle(fontSize: 18, color: Colors.red, fontWeight:FontWeight.bold),
            ),          ],

        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Disease Detection'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
