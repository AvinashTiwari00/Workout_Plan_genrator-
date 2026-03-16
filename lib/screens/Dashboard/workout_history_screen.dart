// import 'package:flutter/material.dart';
// import 'package:college_project/models/user_models.dart';

// class WorkoutHistoryScreen extends StatelessWidget {
//   final User user;
//   const WorkoutHistoryScreen({super.key, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       appBar: AppBar(
//         title: const Text("Workout History"),
//         centerTitle: true,
//         backgroundColor: Colors.blue.shade700,
//       ),
//       body: user.history.isEmpty
//           ? const Center(child: Text("No workouts completed yet 😴"))
//           : ListView.builder(
//               padding: const EdgeInsets.all(20),
//               itemCount: user.history.length,
//               itemBuilder: (context, index) {
//                 final workout = user.history[index];
//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   padding: const EdgeInsets.all(18),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(14),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(workout["name"], style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
//                       Text(workout["date"], style: const TextStyle(fontSize: 14, color: Colors.black54)),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
