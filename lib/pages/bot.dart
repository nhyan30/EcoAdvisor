import 'package:eco_advisor/pages/home.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../config/env.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';


class bot extends StatelessWidget {
  const bot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF5FFEC),
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  File? _selectedImage;

  // Azure OpenAI API configuration
  // Load API keys and configuration from environment file
  // See lib/config/env.template.dart for setup instructions
  // Import the environment configuration
  final String _apiKey1 = Environment.apiKey1;
  final String _apiKey2 = Environment.apiKey2;
  
  // Your Azure OpenAI endpoint
  final String _endpoint = Environment.endpoint;
  
  // The deployment name you created in Azure OpenAI Studio
  final String _deploymentId = Environment.deploymentId;
  
  // API version
  final String _apiVersion = Environment.apiVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5FFEC),
        iconTheme: const IconThemeData(color: Colors.black87),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Home()),),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5FFEC),
        ),
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? _buildSuggestionsView()
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(8.0),
                      reverse: false,
                      itemCount: _messages.length,
                      itemBuilder: (_, int index) => _messages[index],
                    ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: CircularProgressIndicator(color: Color(0xFF8EC23F)),
              ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionsView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Good day! What can I help you with today?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1E242A),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Some ideas to get you started',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1E242A),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          _buildSuggestionCard(
            'Suggest creative ways to reuse plastic bottles',
            Icons.lightbulb_outline,
          ),
          const SizedBox(height: 15),
          _buildSuggestionCard(
            'Give me eco-friendly tips for reducing household waste',
            Icons.home_outlined,
          ),
          const SizedBox(height: 15),
          _buildSuggestionCard(
            'Find the nearest recycling center to my location',
            Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        _textController.text = text;
        _handleSubmitted(text);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFF49B02D),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF49B02D)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF1E242A),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      decoration: const BoxDecoration(
        color: Color(0xFFF5FFEC),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _messages.clear(); // Clear all messages
                _isLoading = false;
                _selectedImage = null; // Clear selected image
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF8EC23F),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'images/newchat.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE4E4E4)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: _selectedImage != null ? 'Add a caption...' : 'Ask me anything...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF7D7984),
                          fontSize: 15,
                          fontFamily: 'Inter',
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                  if (_selectedImage != null)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _selectedImage!,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.image, color: Color(0xFF8EC23F)),
            onPressed: _pickImage,
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF8EC23F)),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  // ScrollController to manage scrolling to bottom when new messages arrive
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  // Scroll to the bottom of the list
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty && _selectedImage == null) return;
    
    _textController.clear();
    
    ChatMessage userMessage = ChatMessage(
      text: text,
      isUser: true,
      image: _selectedImage,
    );
    
    setState(() {
      _messages.add(userMessage); // Add to the end instead of inserting at 0
      _isLoading = true;
      _selectedImage = null; // Clear the selected image after sending
    });
    
    _scrollToBottom(); // Scroll to show the new message
    _getAIResponseWithFallback(text);
  }

  Future<void> _getAIResponse(String query, {bool useSecondKey = false}) async {
    try {
      // Prepare the API URL
      final url = '$_endpoint/openai/deployments/$_deploymentId/chat/completions?api-version=$_apiVersion';
      
      // Prepare the request body
      final body = jsonEncode({
        'messages': [
          {'role': 'system', 'content': 'You are a sustainability expert specializing in eco-friendly practices, recycling, waste reduction, renewable energy, and conservation. Provide practical, actionable advice that helps users reduce their environmental impact. Include specific tips, facts, and resources when appropriate. Focus on solutions that are accessible to everyday people and explain environmental concepts in clear, understandable terms.'},
          {'role': 'user', 'content': query}
        ],
        'max_tokens': 800,
        'temperature': 0.7,
      });
      
      // Make the API request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'api-key': useSecondKey ? _apiKey2 : _apiKey1, // Use appropriate key
        },
        body: body,
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiResponse = data['choices'][0]['message']['content'];
        
        setState(() {
          _messages.add(ChatMessage(
            text: aiResponse,
            isUser: false,
          ));
          _isLoading = false;
        });
        _scrollToBottom(); // Scroll to show the AI response
        return; // Success, exit the function
      } else {
        // If using first key and it failed, try the second key
        if (!useSecondKey) {
          throw Exception('First key failed with status ${response.statusCode}');
        }
        
        // If using second key and it failed, show error
        setState(() {
          _messages.add(ChatMessage(
            text: 'Sorry, I encountered an error. Please try again later.',
            isUser: false,
          ));
          _isLoading = false;
        });
        _scrollToBottom(); // Scroll to show the error message
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      // If using first key and caught an exception, try the second key
      if (!useSecondKey) {
        throw e; // Re-throw to be caught by _getAIResponseWithFallback
      }
      
      // If using second key and caught an exception, show error
      setState(() {
        _messages.add(ChatMessage(
          text: 'Sorry, I encountered an error. Please try again later.',
          isUser: false,
        ));
        _isLoading = false;
      });
      _scrollToBottom(); // Scroll to show the error message
      print('Exception: $e');
    }
  }

  // Function to try with first key, then fall back to second key if needed
  Future<void> _getAIResponseWithFallback(String query) async {
    try {
      // Try with the first key
      await _getAIResponse(query, useSecondKey: false);
    } catch (e) {
      // If first key fails, try with the second key
      try {
        await _getAIResponse(query, useSecondKey: true);
      } catch (e) {
        // Both keys failed
        setState(() {
          _messages.add(ChatMessage(
            text: 'Sorry, I encountered an error. Please try again later.',
            isUser: false,
          ));
          _isLoading = false;
        });
        _scrollToBottom(); // Scroll to show the error message
        print('Both keys failed: $e');
      }
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;
  final File? image;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[  
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF8EC23F),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.eco,
                color: Colors.white,
              ),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: isUser ? const Color(0xFFAEE55B) : Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (image != null) ...[  
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        image!,
                        width: 200,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                  if (text.isNotEmpty)
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontFamily: 'Inter',
                        fontWeight: isUser ? FontWeight.w500 : FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isUser) ...[  
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}