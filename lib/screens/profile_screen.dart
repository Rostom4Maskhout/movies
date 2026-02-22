import 'package:flutter/material.dart';
import '../widgets/avatar_picker_bottom_sheet.dart';
import '../widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedAvatar = 0;

  final List<String> avatars = [
    "assets/images/gamer (1).png",
    "assets/images/gamer (2).png",
    "assets/images/gamer (3).png",
    "assets/images/gamer (4).png",
    "assets/images/gamer (5).png",
    "assets/images/gamer (6).png",
    "assets/images/gamer (7).png",
    "assets/images/gamer (8).png",
    "assets/images/gamer (9).png",
  ];

  void openAvatarPicker() async {
    final result = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => AvatarPickerBottomSheet(
        avatars: avatars,
        selectedIndex: selectedAvatar,
      ),
    );

    if (result != null) {
      setState(() {
        selectedAvatar = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.amber),
                  Spacer(),
                  Text(
                    "Pick Avatar",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                ],
              ),

              const SizedBox(height: 25),

              GestureDetector(
                onTap: openAvatarPicker,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage(avatars[selectedAvatar]),
                ),
              ),

              const SizedBox(height: 30),

              const CustomTextField(
                icon: Icons.person,
                hint: "John Safwat",
              ),

              const SizedBox(height: 15),

              const CustomTextField(
                icon: Icons.phone,
                hint: "01200000000",
              ),

              const SizedBox(height: 15),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),

              const Spacer(),

              buildButton(
                text: "Delete Account",
                color: const Color(0xFFFF2E2E),
                textColor: Colors.white,
              ),

              const SizedBox(height: 15),

              buildButton(
                text: "Update Data",
                color: const Color(0xFFFFC107),
                textColor: Colors.black,
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}