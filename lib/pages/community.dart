import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eco_advisor/pages/home.dart';
import 'package:eco_advisor/pages/scanner.dart';
import 'package:eco_advisor/pages/bot.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // State variables for like counts
  int firstPostLikes = 1200;
  int secondPostLikes = 856;
  bool isFirstPostLiked = false;
  bool isSecondPostLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFEC),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView(
                children: [
                  _buildPostCard(context),
                  _buildPromotedCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('images/profile_img.jpeg'),
            radius: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 15),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPostCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/tom.png'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Tom Karen',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Following',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '35,548 followers • 12h',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "I'm happy to share my latest upcycling project—transforming waste plastic bottles into vibrant flower baskets!",
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                ),
                const Text(
                  "Let's all do our part in making the world greener! 🌍💚",
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    '...see more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'images/post.jpg', // Using available image
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.eco,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$firstPostLikes',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '8 Comments',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, isFirstPostLiked ? 'Liked' : 'Like', onPressed: () {
                  setState(() {
                    if (isFirstPostLiked) {
                      firstPostLikes--;
                      isFirstPostLiked = false;
                    } else {
                      firstPostLikes++;
                      isFirstPostLiked = true;
                    }
                  });
                }),
                _buildActionButton(Icons.chat_bubble_outline, 'Comment'),
                _buildActionButton(Icons.share_outlined, 'Share'),
                _buildActionButton(Icons.send_outlined, 'Send'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, {VoidCallback? onPressed}) {
    return TextButton.icon(
      onPressed: onPressed ?? () {},
      icon: Icon(icon, color: Colors.grey),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _buildPromotedCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/sophia.png'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Sophia Carter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Promoted',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 10,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '28,312 followers • 2h',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Check out my latest upcycling project! I transformed old plastic bottles into these beautiful planters.",
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                ),
                const Text(
                  "#Upcycling #Sustainability #EcoFriendly 🌱♻️",
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    '...see more',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'images/upcycle.png',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.eco,
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$secondPostLikes',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '12 Comments',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, isSecondPostLiked ? 'Liked' : 'Like', onPressed: () {
                  setState(() {
                    if (isSecondPostLiked) {
                      secondPostLikes--;
                      isSecondPostLiked = false;
                    } else {
                      secondPostLikes++;
                      isSecondPostLiked = true;
                    }
                  });
                }),
                _buildActionButton(Icons.chat_bubble_outline, 'Comment'),
                _buildActionButton(Icons.share_outlined, 'Share'),
                _buildActionButton(Icons.send_outlined, 'Send'),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFAEE55B),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          child: Container(
            width: 28,
            height: 28,
            child: SvgPicture.asset(
              'images/home.svg',
              fit: BoxFit.contain,
            ),
          ),
          ),
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              'images/locator.svg',
              fit: BoxFit.contain,
            ),
          ),
          // Center scan button with floating circular design
          Transform.translate(
            offset: const Offset(0, -12), // Move up to match UI
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScannerPage()),
                );
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'images/scan.svg',
                    width: 29,
                    height: 29,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const bot()),
              );
            },
            child: Container(
              width: 36,
              height: 36,
              child: SvgPicture.asset(
                'images/chatbot.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              'images/community.svg',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}