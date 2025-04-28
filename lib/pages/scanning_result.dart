import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/env.dart';

class ScanningResultPage extends StatefulWidget {
  final File? image;

  const ScanningResultPage({
    super.key,
    required this.image,
  });

  @override
  State<ScanningResultPage> createState() => _ScanningResultPageState();
}

class _ScanningResultPageState extends State<ScanningResultPage> {
  String materialType = '';
  bool isRecyclable = false;
  bool isLoading = true;
  String errorMessage = '';

  // Azure OpenAI API configuration
  final String _apiKey1 = Environment.apiKey1;
  final String _apiKey2 = Environment.apiKey2;
  final String _endpoint = Environment.endpoint;
  final String _deploymentId = Environment.deploymentId;
  final String _apiVersion = Environment.apiVersion;

  @override
  void initState() {
    super.initState();
    _analyzeMaterial();
  }

  Future<void> _analyzeMaterial() async {
    if (widget.image == null) {
      setState(() {
        errorMessage = 'No image available for analysis';
        isLoading = false;
      });
      return;
    }

    try {
      // Convert image to base64
      final List<int> imageBytes = await widget.image!.readAsBytes();
      final String base64Image = base64Encode(imageBytes);
      
      // Prepare the API URL
      final url = '$_endpoint/openai/deployments/$_deploymentId/chat/completions?api-version=$_apiVersion';
      
      // Prepare the request body with the image
      final requestBody = {
        'messages': [
          {
            'role': 'system', 
            'content': 'You are a material identification expert. Analyze the image and identify what material it is made of. Then determine if it is recyclable or not. Respond in JSON format with two fields: "material" (string) and "recyclable" (boolean).'
          },
          {
            'role': 'user',
            'content': [
              {'type': 'text', 'text': 'What material is this object made of? Is it recyclable?'},
              {
                'type': 'image_url',
                'image_url': {
                  'url': 'data:image/jpeg;base64,$base64Image'
                }
              }
            ]
          }
        ],
        'max_tokens': 800,
        'temperature': 0.3,
      };
      
      // Make the API request with first key
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'api-key': _apiKey1,
        },
        body: jsonEncode(requestBody),
      );
      
      // If first key fails, try with second key
      if (response.statusCode != 200) {
        response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'api-key': _apiKey2,
          },
          body: jsonEncode(requestBody),
        );
      }
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiResponse = data['choices'][0]['message']['content'];
        
        // Parse the JSON response
        try {
          final Map<String, dynamic> result = jsonDecode(aiResponse);
          setState(() {
            materialType = result['material'] ?? 'Unknown material';
            isRecyclable = result['recyclable'] ?? false;
            isLoading = false;
          });
        } catch (e) {
          // If JSON parsing fails, try to extract information from text
          if (aiResponse.toLowerCase().contains('plastic')) {
            setState(() {
              materialType = 'Plastic';
              isRecyclable = aiResponse.toLowerCase().contains('recyclable');
              isLoading = false;
            });
          } else if (aiResponse.toLowerCase().contains('paper')) {
            setState(() {
              materialType = 'Paper';
              isRecyclable = true;
              isLoading = false;
            });
          } else if (aiResponse.toLowerCase().contains('glass')) {
            setState(() {
              materialType = 'Glass';
              isRecyclable = true;
              isLoading = false;
            });
          } else if (aiResponse.toLowerCase().contains('metal')) {
            setState(() {
              materialType = 'Metal';
              isRecyclable = true;
              isLoading = false;
            });
          } else {
            setState(() {
              materialType = 'Unknown material';
              isRecyclable = false;
              isLoading = false;
            });
          }
        }
      } else {
        setState(() {
          errorMessage = 'Failed to analyze material: API error ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to analyze material: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5FFEC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5FFEC),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Analyzing material...',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Color(0xFFAEE55B)),
              const SizedBox(height: 20),
              const Text(
                'Analyzing your item...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const Text(
                'Our AI is identifying the material',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      );
    }
    
    if (errorMessage.isNotEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xFFF5FFEC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5FFEC),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Error',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 60, color: Colors.red),
                const SizedBox(height: 20),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                      errorMessage = '';
                    });
                    _analyzeMaterial();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAEE55B),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFEC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5FFEC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Scanning result',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.image != null
                    ? Image.file(
                        widget.image!,
                        width: double.infinity,
                        height: 350,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: double.infinity,
                        height: 350,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text('No image available'),
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              // Material type chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFAEE55B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  materialType,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Recyclable status
              Text(
                isRecyclable ? "It's Recyclable" : "Not Recyclable",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 40),
              // Show recommendation button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to recommendations page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Recommendations coming soon')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAEE55B),
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Show Recommendation',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}