
import '../../utils/app_assets.dart';
import 'onboarding_item_model.dart';

final List<OnboardingItem> onboardingItems = [
  // Screen 1 – Explore button only
  OnboardingItem(
    image: AppAssets.onboarding1,
    title: 'Find Your Next Favorite Movie Here',
    description:
    'Get access to a huge library of movies to suit all tastes. You will surely like it',
    primaryButtonText: 'Explore Now',
    useBottomSheet: false,
  ),

  // Screen 2 – Next button only
  OnboardingItem(
    image: AppAssets.onboarding2,
    title: 'Discover Movies',
    description:
    'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    primaryButtonText: 'Next',
  ),

  // Screen 3 – Back + Next
  OnboardingItem(
    image: AppAssets.onboarding3,
    title: 'Explore All Genres',
    description:
    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    primaryButtonText: 'Next',
    showBack: true,
  ),

  // Screen 4 – Back + Next
  OnboardingItem(
    image: AppAssets.onboarding4,
    title: 'Create Watchlists',
    description:
    'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres..',
    primaryButtonText: 'Next',
    showBack: true,
  ),
  OnboardingItem(
    image: AppAssets.onboarding5,
    title: 'Rate, Review, and Learn',
    description:
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews..",
    primaryButtonText: 'Next',
    showBack: true,
  ),

  // Screen 5 – Back + Finish
  OnboardingItem(
    image: AppAssets.onboarding6,
    title: 'Start Watching Now',
    description: '',
    primaryButtonText: 'Finish',
    showBack: true,
    isLast: true,
  ),
];
