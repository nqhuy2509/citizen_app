import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ProfileAvatar");
      },
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/icons/ci-point-icon.png'),
                ),
                const SizedBox(height: 10),
                Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
