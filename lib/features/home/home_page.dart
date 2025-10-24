import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:html';
import 'package:amarbabu_portfolio/core/routing/app_router.dart';
import 'package:amarbabu_portfolio/shared/app_assets.dart';
import 'package:amarbabu_portfolio/shared/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/themes/theme_provider.dart';
import '../../shared/widgets/typing_text.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void _downloadResume() {
    final anchor =
        AnchorElement(href: 'assets/docs/AMARBABU-T-Resume-20251024.pdf')
          ..setAttribute('download', 'Amarbabu_Resume.pdf')
          ..click();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              tooltip: 'Toggle Theme',
              onPressed: () {
                final mode = isDark ? ThemeMode.light : ThemeMode.dark;
                ref.read(themeModeProvider.notifier).state = mode;
              },
            ),
          ),
        ],
      ),
      floatingActionButton: kIsWeb
          ? FloatingActionButton.extended(
              onPressed: _downloadResume,
              label: const Text('Resume'),
              icon: const Icon(Icons.download),
              backgroundColor: AppColors.secondary,
            )
          : null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile image
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        isDark ? AppAssets.profileDark : AppAssets.profileLight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ).animate().scale(duration: 600.ms).fadeIn(),
                const SizedBox(height: 40),

                // Typing name
                TypingText(
                  text: "Hi, I'm Amarbabu T",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    'Mobile App Developer | 3+ Years of Experience\n'
                    'Specialized in Flutter & Dart — focused on building scalable, high-performance mobile apps.\n'
                    'Proficient in BLoC, Riverpod & GetX; experienced with Firebase, REST, and GraphQL APIs.\n'
                    'Also skilled in Next.js and React for modern, responsive web applications.\n'
                    'Passionate about clean architecture, performance optimization, and elegant UI/UX design.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(height: 1.6),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 400.ms)
                    .slideY(begin: 0.2, duration: 600.ms)
                    .then(delay: 300.ms),

                const SizedBox(height: 50),

                // Navigation buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _navButton(Icons.person, 'About',
                        () => context.router.push(const AboutRoute())),
                    _navButton(Icons.code, 'Projects',
                        () => context.router.push(const ProjectsRoute())),
                    _navButton(Icons.star, 'Skills',
                        () => context.router.push(const SkillsRoute())),
                    _navButton(Icons.mail, 'Contact',
                        () => context.router.push(const ContactRoute())),
                  ],
                ).animate().slideY(begin: 0.3, duration: 500.ms).fadeIn(),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navButton(IconData icon, String label, void Function() onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 22),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
