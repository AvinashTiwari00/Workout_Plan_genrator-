import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final List<Color> gradient;
  final bool isWeb;
  final bool isSmallScreen;

  const DashboardStatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.gradient,
    this.isWeb = false,
    this.isSmallScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isWeb ? 24 : (isSmallScreen ? 16 : 20),
        horizontal: isWeb ? 12 : 8,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(isWeb ? 20 : 18),
        boxShadow: [
          BoxShadow(
            color: gradient.first.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(isWeb ? 12 : (isSmallScreen ? 8 : 10)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: isWeb ? 36 : (isSmallScreen ? 26 : 30),
              color: Colors.white,
            ),
          ),
          SizedBox(height: isWeb ? 14 : 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isWeb ? 17 : (isSmallScreen ? 13 : 15),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isWeb ? 8 : 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: isWeb ? 24 : (isSmallScreen ? 18 : 20),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

