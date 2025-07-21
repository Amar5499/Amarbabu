import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:html';
import 'dart:math' as math;
import 'package:amar_portfolio/core/routing/app_router.dart';
import 'package:amar_portfolio/shared/app_assets.dart';
import 'package:amar_portfolio/shared/app_colors.dart';

@RoutePage()
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/themes/theme_provider.dart';
import '../../shared/widgets/typing_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  void _downloadResume() {
    final anchor = AnchorElement(href: 'assets/docs/Amarbabu-29:04:2025.pdf')
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
    final themeMode = ref.watch(themeModeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: CurvedWaveClipper(
                        reverse: false,
                        phase: _controller.value * 2 * math.pi,
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: CurvedWaveClipper(
                        reverse: false,
                        phase: _controller.value * 2 * math.pi,
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: CurvedWaveClipper(
                        reverse: false,
                        phase: _controller.value * 2 * math.pi,
                      ),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.05),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 66,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.profile,
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ).animate().scale(duration: 500.ms).fadeIn(),
                  const SizedBox(height: 24),
                  TypingText(
                    text: "Hi, I'm Amarbabu T",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Cross-platform Flutter Developer | 2+ years\n'
                    'Skilled in Riverpod, Bloc, GetX, Firebase, Stripe, REST/GraphQL APIs & scalable architecture',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 500.ms),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
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
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(IconData icon, String label, void Function() onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      ),
    );
  }
}

class CurvedWaveClipper extends CustomClipper<Path> {
  final bool reverse;
  final double phase;
  CurvedWaveClipper({this.reverse = false, this.phase = 0});

  @override
  Path getClip(Size size) {
    final path = Path();
    const double amplitude = 10;
    const double frequency = 2;

    if (!reverse) {
      path.moveTo(0, size.height / 2);
      for (double x = 0; x <= size.width; x++) {
        double y = size.height / 2 +
            amplitude *
                math.sin((2 * math.pi * frequency * x / size.width) + phase);
        path.lineTo(x, y);
      }
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    } else {
      path.moveTo(0, size.height / 2);
      for (double x = 0; x <= size.width; x++) {
        double y = size.height / 2 -
            amplitude *
                math.sin((2 * math.pi * frequency * x / size.width) + phase);
        path.lineTo(x, y);
      }
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
