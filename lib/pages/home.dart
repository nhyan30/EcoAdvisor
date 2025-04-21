import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5FFEC),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildStatusBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTopBar(),
                        const SizedBox(height: 16),
                        _buildGreeting(),
                        const SizedBox(height: 16),
                        _buildLocationInput(),
                        const SizedBox(height: 24),
                        _buildRecyclingGuide(),
                        const SizedBox(height: 20),
                        _buildStatisticsCards(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 13),
      child: Row(
        children: [
          
          const Spacer(),
          
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Pascal Tech Logo and Name
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Company logo image
            Image.asset(
              'images/company_logo.png',
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 0), // Spacing between logo and company name
            // Company name image
            Image.asset(
              'images/pascalTech.png',
              height: 16,
              fit: BoxFit.contain,
            ),
          ],
        ),
        // Notification and Profile Icons
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'images/notifi.png',
                width: 23,
                height: 23,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'images/profile.png',
                width: 23,
                height: 23,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Manar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Let\'s contribution to our earth.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInput() {
    return Container(
      height: 42,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFBDBDBD)),
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Icon(Icons.location_on, color: Colors.green, size: 30),
            const SizedBox(width: 8),
            Text(
              'Men\'s Library',
              style: TextStyle(
                color: Color(0xFFA8A8A8),
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecyclingGuide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recycling Guide',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.50,
            letterSpacing: -0.20,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryItem(Icons.water_drop_outlined),
            _buildCategoryItem(Icons.recycling),
            _buildCategoryItem(Icons.checkroom),
            _buildCategoryItem(Icons.description_outlined),
            _buildCategoryItem(Icons.devices_other),
            _buildCategoryItem(Icons.delete_outline),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: ShapeDecoration(
        color: const Color(0xFFAEE55B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _buildStatisticsCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFFFF4FE),
                title: '0.00',
                prefix: 'AED',
                subtitle: 'Earned So far',
                icon: Icons.account_balance_wallet_outlined,
                iconColor: Color(0xFFFFB6E6),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFFFF8EE),
                title: '0',
                subtitle: 'Pickups',
                icon: Icons.local_shipping_outlined,
                iconColor: Color(0xFFFFD2A9),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFFFFBE6),
                title: '~0',
                subtitle: 'Fuel Saved',
                suffix: 'Ltrs',
                icon: Icons.local_gas_station,
                iconColor: Color(0xFFFFE899),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFECF8FF),
                title: '~0',
                subtitle: 'CO2 Averted',
                suffix: 'Kgs',
                icon: Icons.cloud_outlined,
                iconColor: Color(0xFFB6E0FF),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFEBFFEB),
                title: '~0',
                subtitle: 'Trees saved',
                icon: Icons.park_outlined,
                iconColor: Color(0xFFB6FFB6),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildStatCard(
                color: Color(0xFFFFFDE6),
                title: '~0',
                subtitle: 'Waste',
                suffix: 'Kgs',
                icon: Icons.delete_outline,
                iconColor: Color(0xFFFFF599),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required Color color,
    required String title,
    required String subtitle,
    String? prefix,
    String? suffix,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      height: 120,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    if (prefix != null)
                      Text(
                        prefix,
                        style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF6E6E6E),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (suffix != null)
                      Text(
                        suffix,
                        style: TextStyle(
                          color: Color(0xFF6E6E6E),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF585858),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
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
          Container(
            width: 28,
            height: 28,
            child: Image.asset(
              'images/home.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            child: Image.asset(
              'images/locator.png',
              fit: BoxFit.contain,
            ),
          ),
          // Center scan button with floating circular design
          Transform.translate(
            offset: const Offset(0, -12), // Move up to match UI
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
                child: Image.asset(
                  'images/scan.png',
                  width: 29,
                  height: 29,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            child: Image.asset(
              'images/chatbot.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 30,
            height: 30,
            child: Image.asset(
              'images/community.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}