import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../shared/app_colors.dart';

@RoutePage()
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  final List<String> programmingLanguages = const [
    'Dart',
    'JavaScript',
    'TypeScript',
    'SQL', // Added for SQLite/Drift expertise
    'HTML',
    'CSS',
  ];

  final List<String> frameworks = const [
    'Flutter (Android, iOS, Web)',
    'Flutter Bloc / Cubit', // Promoted based on Insasoft role
    'Riverpod',
    'Clean Architecture',
    'Next.js',
    'React.js',
    'GetX',
    'MVC / MVVM',
  ];

  final List<String> backendAndCloud = const [
    'Firebase (Auth, Firestore, FCM, Storage)',
    'Chopper & Retrofit (REST)', // Added from Insasoft stack
    'Ably Real-time', // Added from Insasoft stack
    'Stripe & Razorpay Integration', // Added specific gateways
    'GraphQL APIs (Shopify)',
    'Google Maps SDK & Geofencing', // Added from GPA project
    'Drift, Sembast & SQLite', // Consolidated local DBs
    'AWS (S3)',
    'Medusa API',
    'Gemini AI API',
  ];

  final List<String> toolsAndPlatforms = const [
    'Git & GitHub',
    'Postman',
    'Play Store & App Store Deployment', // Added to show release experience
    'TestFlight & Firebase Distribution',
    'Figma',
    'VS Code',
    'Xcode & Android Studio',
    'Jira & Agile Boards',
  ];

  final List<String> softSkills = const [
    'Technical Leadership', // Added based on your senior role
    'Clean Code & SOLID Principles',
    'Critical Thinking & Problem-solving',
    'Client Communication (Freelance)',
    'Team Collaboration',
    'Fast Learning & Adaptability',
    'Attention to Detail',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Skills',
          style: theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _animatedSkillSection(
                  context,
                  'Programming Languages',
                  programmingLanguages,
                  delay: 0,
                ),
                _animatedSkillSection(
                  context,
                  'Frameworks & Architecture',
                  frameworks,
                  delay: 150,
                ),
                _animatedSkillSection(
                  context,
                  'Backend, Real-time & Cloud',
                  backendAndCloud,
                  delay: 300,
                ),
                _animatedSkillSection(
                  context,
                  'Tools & Platforms',
                  toolsAndPlatforms,
                  delay: 450,
                ),
                _animatedSkillSection(
                  context,
                  'Soft Skills',
                  softSkills,
                  delay: 600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedSkillSection(
    BuildContext context,
    String title,
    List<String> items, {
    int delay = 0,
  }) {
    final theme = Theme.of(context);

    return Animate(
      delay: Duration(milliseconds: delay),
      effects: const [
        FadeEffect(duration: Duration(milliseconds: 600)),
        SlideEffect(begin: Offset(0, 0.2))
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: items.map((skill) {
              return Chip(
                label: Text(skill, style: theme.textTheme.bodyMedium),
                backgroundColor: theme.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.5)),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Divider(color: theme.dividerColor.withOpacity(0.3)),
        ],
      ),
    );
  }
}
