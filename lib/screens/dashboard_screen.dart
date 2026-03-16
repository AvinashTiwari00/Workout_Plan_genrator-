import 'package:flutter/material.dart';
import 'package:college_project/models/user_models.dart';
import 'package:college_project/screens/Dashboard/weekly_progress_screen.dart';
import 'package:college_project/screens/Dashboard/weekly_summary_screen.dart';
import 'package:college_project/widgets/dashboard_stat_card.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  const DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWeb = constraints.maxWidth > 600;
        final screenWidth = MediaQuery.of(context).size.width;
        final isSmallScreen = screenWidth < 400;
        
        // Responsive values
        final horizontalPadding = isWeb ? 40.0 : (isSmallScreen ? 16.0 : 20.0);
        final verticalPadding = isWeb ? 30.0 : 20.0;
        final maxContentWidth = isWeb ? 800.0 : double.infinity;
        
        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FA),

          // -------------------- APP BAR --------------------
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(isWeb ? 80 : 70),
            child: Container(
              padding: EdgeInsets.only(top: isWeb ? 20 : 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade700, Colors.blue.shade900],
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isWeb ? 26 : 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // -------------------- BODY --------------------
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------- GREETING --------------------
                    Row(
                      children: [
                        CircleAvatar(
                          radius: isWeb ? 36 : (isSmallScreen ? 28 : 32),
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.person,
                            size: isWeb ? 44 : (isSmallScreen ? 36 : 40),
                            color: Colors.blue.shade700,
                          ),
                        ),
                        SizedBox(width: isWeb ? 18 : 15),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, ${user.name}",
                                style: TextStyle(
                                  fontSize: isWeb ? 26 : (isSmallScreen ? 20 : 22),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Ready for today's workout?",
                                style: TextStyle(
                                  fontSize: isWeb ? 17 : (isSmallScreen ? 14 : 15),
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isWeb ? 30 : 25),

                    // -------------------- TODAY'S WORKOUT CARD --------------------
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isWeb ? 28 : (isSmallScreen ? 16 : 20)),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade600, Colors.blue.shade900],
                        ),
                        borderRadius: BorderRadius.circular(isWeb ? 24 : 20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade200.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Workout",
                            style: TextStyle(
                              fontSize: isWeb ? 22 : (isSmallScreen ? 16 : 18),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: isWeb ? 10 : 8),
                          Text(
                            "${user.todayWorkout} • ${user.exercisesCount} exercises",
                            style: TextStyle(
                              fontSize: isWeb ? 17 : (isSmallScreen ? 14 : 15),
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: isWeb ? 18 : 15),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.blue.shade800,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: isWeb ? 14 : 10,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/categories', arguments: user);
                                  },
                                  child: Text(
                                    "Start Workout",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: isWeb ? 18 : (isSmallScreen ? 14 : 16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: isWeb ? 16 : 12),
                              SizedBox(
                                height: isWeb ? 80 : (isSmallScreen ? 60 : 70),
                                width: isWeb ? 80 : (isSmallScreen ? 60 : 70),
                                child: ClipOval(
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8wPEX6H-CILWI1SJ69L4yMUFwKmjLk9BGmQ&s",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isWeb ? 35 : 30),

                    // -------------------- WEEKLY PROGRESS --------------------
                   
                    Text(
                      "Weekly Progress",
                      style: TextStyle(
                        fontSize: isWeb ? 24 : (isSmallScreen ? 18 : 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: isWeb ? 16 : 12),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WeeklyProgressScreen(user: user),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(isWeb ? 28 : (isSmallScreen ? 16 : 20)),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade600, Colors.blue.shade900],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(isWeb ? 26 : 22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.shade300.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // ⭐ Big circular weekly score
                            SizedBox(
                              height: isWeb ? 140 : (isSmallScreen ? 100 : 120),
                              width: isWeb ? 140 : (isSmallScreen ? 100 : 120),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value:
                                        user.weeklyProgress.values
                                            .where((v) => v == 1)
                                            .length /
                                        7,
                                    strokeWidth: isWeb ? 13 : 11,
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                    backgroundColor: Colors.white30,
                                  ),
                                  Text(
                                    "${user.weeklyProgress.values.where((v) => v == 1).length}/7",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isWeb ? 30 : (isSmallScreen ? 22 : 26),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: isWeb ? 20 : 16),

                            // ⭐ Days row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: user.weeklyProgress.entries.map((e) {
                                final bool done = e.value == 1;
                                return Column(
                                  children: [
                                    CircleAvatar(
                                      radius: isWeb ? 20 : (isSmallScreen ? 16 : 18),
                                      backgroundColor: done
                                          ? Colors.green.shade200
                                          : Colors.red.shade200,
                                      child: Icon(
                                        done ? Icons.check : Icons.close,
                                        color: done
                                            ? Colors.green.shade700
                                            : Colors.red.shade700,
                                        size: isWeb ? 24 : (isSmallScreen ? 20 : 22),
                                      ),
                                    ),
                                    SizedBox(height: isWeb ? 8 : 6),
                                    Text(
                                      e.key,
                                      style: TextStyle(
                                        fontSize: isWeb ? 16 : (isSmallScreen ? 12 : 14),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),

                            SizedBox(height: isWeb ? 20 : 16),

                            //  Tap to expand message
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tap to view full report",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: isWeb ? 15 : (isSmallScreen ? 12 : 13),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: isWeb ? 16 : (isSmallScreen ? 12 : 14),
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: isWeb ? 35 : 30),

                    // -------------------- QUICK STATS --------------------
                    Text(
                      "Quick Stats",
                      style: TextStyle(
                        fontSize: isWeb ? 26 : (isSmallScreen ? 20 : 22),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: isWeb ? 22 : 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: DashboardStatCard(
                              icon: Icons.monitor_weight,
                              title: "Weight",
                              value: "${user.weight} kg",
                              gradient: const [
                                Color(0xFF56ab2f),
                                Color(0xFFa8e063),
                              ],
                              isWeb: isWeb,
                              isSmallScreen: isSmallScreen,
                            ),
                          ),
                        ),
                        SizedBox(width: isWeb ? 16 : 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: DashboardStatCard(
                              icon: Icons.done_all,
                              title: "Completed",
                              value: user.completed.toString(),
                              gradient: const [
                                Color(0xFF614385),
                                Color(0xFF516395),
                              ],
                              isWeb: isWeb,
                              isSmallScreen: isSmallScreen,
                            ),
                          ),
                        ),
                        SizedBox(width: isWeb ? 16 : 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      WeeklySummaryScreen(user: user),
                                ),
                              );
                            },
                            child: DashboardStatCard(
                              icon: Icons.calendar_month,
                              title: "This Week",
                              value: user.thisWeek.toString(),
                              gradient: const [
                                Color(0xFF2193b0),
                                Color(0xFF6dd5ed),
                              ],
                              isWeb: isWeb,
                              isSmallScreen: isSmallScreen,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: isWeb ? 50 : 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // -------------------- STAT CARD --------------------
  Widget statCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue.shade800, size: 30),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // -------------------- PROGRESS BAR --------------------
  Widget progressBar({required String day, required int value}) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 70,
          width: 14,
          decoration: BoxDecoration(
            color: value == 1 ? Colors.blue.shade700 : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(height: 6),
        Text(day, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// statBox extracted into DashboardStatCard widget in widgets/dashboard_stat_card.dart
