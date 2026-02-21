class OnboardingItem {
  final String image;
  final String title;
  final String description;
  final String primaryButtonText;
  final bool showBack;
  final bool isLast;
  final bool useBottomSheet;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    this.showBack = false,
    this.isLast = false,
    this.useBottomSheet = true,
  });
}