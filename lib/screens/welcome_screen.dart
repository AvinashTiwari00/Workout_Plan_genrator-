import 'package:flutter/material.dart';
import 'user_input_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌆 Full Hero Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              "https://images.pexels.com/photos/6390236/pexels-photo-6390236.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          // 🖤 Dark Glass Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // ⭐ Center Content with Responsiveness
          LayoutBuilder(
            builder: (context, constraints) {
              final isWeb = constraints.maxWidth > 600;
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: isWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        if (isWeb) const Spacer(), // Push content more to center on web

                        // ⚡ Main Title
                        Text(
                          "TRANSFORM\nYOUR BODY",
                          textAlign: isWeb ? TextAlign.center : TextAlign.start,
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.1,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 🔥 Subtitle & Value Prop
                        Text(
                          "Your fitness journey starts here.",
                          textAlign: isWeb ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.95),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Personalized workout plans based on your body goal and fitness level.",
                          textAlign: isWeb ? TextAlign.center : TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white.withOpacity(0.80),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 48),

                        // 💠 CTA Button
                        SizedBox(
                          width: isWeb ? 300 : double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const UserInputScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade600,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.zero,
                              elevation: 8,
                              shadowColor: Colors.blue.withOpacity(0.4),
                            ),
                            child: const Text(
                              "Create My Plan",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // 👉 Skip Button
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Skipping directly to Dashboard requires a default user or logic
                              // For now, we'll direct to input screen as 'Skip' might imply 'Skip Intro'
                              // If flow requires skipping input, we need default data.
                              // Based on prompt "Keep the “Skip for now” option... Ensure it does not visually compete",
                              // I will keep it pointing to Input Screen or Dashboard if possible. 
                              // But Dashboard needs user. Let's send to Input Screen for now to ensure data integrity
                              // OR we can make a default user. 
                              // Current code sent to UserInputScreen. I will keep that flow to be safe.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const UserInputScreen()),
                              );
                            },
                            child: Text(
                              "Skip for now",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(height: isWeb ? 40 : 20),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
