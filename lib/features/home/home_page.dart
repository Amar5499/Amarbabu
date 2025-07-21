import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:amar_portfolio/core/routing/app_router.dart';
import 'package:amar_portfolio/shared/app_assets.dart';
import 'package:amar_portfolio/shared/app_colors.dart';
import 'package:amar_portfolio/shared/app_text_styles.dart';
import 'dart:html' as html; // ⬅️ Only works on Flutter Web

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _downloadResume() {
    const resumeUrl = 'assets/docs/Amarbabu-29:04:2025.pdf';
    final anchor = html.AnchorElement(href: resumeUrl)
      ..setAttribute('download', 'Amarbabu_Resume.pdf')
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Amarbabu T'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.white,
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.profile,
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Updated intro
                const Text(
                  'Hi, I\'m Amarbabu T',
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter & React Developer\n2+ years experience | Firebase | Riverpod | Stripe | AWS',
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Navigation buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => context.router.push(const AboutRoute()),
                      icon: const Icon(Icons.person),
                      label: const Text('About'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () =>
                          context.router.push(const ProjectsRoute()),
                      icon: const Icon(Icons.code),
                      label: const Text('Projects'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () =>
                          context.router.push(const ContactRoute()),
                      icon: const Icon(Icons.mail),
                      label: const Text('Contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => context.router.push(const SkillsRoute()),
                      icon: const Icon(Icons.star),
                      label: const Text('Skills'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),

                ElevatedButton.icon(
                  onPressed: _downloadResume,
                  icon: const Icon(Icons.download),
                  label: const Text('Download Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
