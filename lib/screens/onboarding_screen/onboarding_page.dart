import 'package:flutter/material.dart';

import 'onboarding_item_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
          ),
        ),

        // Gradient overlay (always)
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
        ),

        // Conditional content
        item.useBottomSheet
            ? _BottomSheetContent(item, onNext, onBack)
            : _TransparentContent(item, onNext),
      ],
    );
    ;
  }
  Widget _TransparentContent(OnboardingItem item, VoidCallback onNext) {
    return Positioned(
      left: 24,
      right: 24,
      bottom: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(item.primaryButtonText),
            ),
          ),
        ],
      ),
    );
  }


  Widget _BottomSheetContent(
      OnboardingItem item,
      VoidCallback onNext,
      VoidCallback onBack,
      ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item.description,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                if (item.showBack)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onBack,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        foregroundColor: Colors.amber,
                      ),
                      child: const Text('Back'),
                    ),
                  ),
                if (item.showBack) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: Text(item.primaryButtonText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




}
