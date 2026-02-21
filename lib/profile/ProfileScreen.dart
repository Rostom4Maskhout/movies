import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import '../theme/app_text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showHeader = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging || _tabController.index != _tabController.previousIndex) {
        setState(() {
          _showHeader = _tabController.index == 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            if (_showHeader)
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                color: AppColors.darkGrey,
                child: const Column(
                  children: [
                    _ProfileHeader(),
                    SizedBox(height: 16),
                    _ActionButtons(),
                  ],
                ),
              ),

            Container(
              color: _showHeader ? AppColors.darkGrey : AppColors.black,
              child: _CustomTabBar(controller: _tabController),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  _WatchListContent(),
                  _HistoryContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  final TabController controller;
  const _CustomTabBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: AppColors.yellow,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelColor: AppColors.yellow,
      unselectedLabelColor: AppColors.yellow,
      tabs: [
        Tab(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.watchListIcons, color: AppColors.yellow, height: 24),
              const SizedBox(height: 4),
              const Text('Watch List', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Tab(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.folder, color: AppColors.yellow, height: 24),
              const SizedBox(height: 4),
              const Text('History', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistoryContent extends StatelessWidget {
  const _HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> movies = [
      AppImages.group13, AppImages.group21, AppImages.group22,
      AppImages.group23, AppImages.group24, AppImages.group25,
      AppImages.group26, AppImages.group27, AppImages.group28,
      AppImages.group29, AppImages.group30, AppImages.group31,
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(movies[index], fit: BoxFit.cover),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppImages.gamer1),
              ),
              const SizedBox(height: 10),
              Text('John Safwat', style: AppTextStyles.headlineMedium),
            ],
          ),
          const _StatItem(count: '12', label: 'Wish List'),
          const _StatItem(count: '10', label: 'History'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count, label;
  const _StatItem({required this.count, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: AppTextStyles.headlineLarge),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: Text('Edit Profile', style: AppTextStyles.bodyLarge),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app, color: AppColors.white, size: 20),
              label: Text('Exit', style: AppTextStyles.labelLarge),
            ),
          ),
        ],
      ),
    );
  }
}

class _WatchListContent extends StatelessWidget {
  const _WatchListContent();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.empty1, width: 200),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
