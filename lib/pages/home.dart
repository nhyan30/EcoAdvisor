import 'package:flutter/material.dart';

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
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 1), // Smaller spacing between PT and Pascal Tech
            // Pascal in green and Tech in blue
            Row(
              children: [
                Text(
                  'Pascal',
                  style: TextStyle(
                    color: Color(0xFFAEE55B),  // Green color for Pascal
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  ' Tech',
                  style: TextStyle(
                    color: Color(0xFF2196F3),  // Blue color for Tech
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        // Notification and Profile Icons
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.notifications_outlined, color: Colors.black, size: 20),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFAEE55B),
              ),
              child: Icon(Icons.person_outline, color: Colors.black, size: 20),
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
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Let\'s contribution to our earth.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
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
            Icon(Icons.location_on, color: Colors.green, size: 20),
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.location_on_outlined, color: Colors.black),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.qr_code_scanner, color: Colors.black),
          ),
          Icon(Icons.shopping_bag_outlined, color: Colors.black),
          Icon(Icons.language, color: Colors.black),
        ],
      ),
    );
  }
}