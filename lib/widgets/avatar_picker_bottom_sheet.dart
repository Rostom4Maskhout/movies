import 'package:flutter/material.dart';

class AvatarPickerBottomSheet extends StatelessWidget {
  final List<String> avatars;
  final int selectedIndex;

  const AvatarPickerBottomSheet({
    super.key,
    required this.avatars,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: avatars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (_, index) {
            final isSelected = index == selectedIndex;

            return GestureDetector(
              onTap: () {
                Navigator.pop(context, index);
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.amber,
                        width: isSelected ? 3 : 1.5,
                      ),
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(avatars[index]),
                      ),
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}