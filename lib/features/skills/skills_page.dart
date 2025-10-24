import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_animate/flutter_animate.dart';

@RoutePage()
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  final List<String> programmingLanguages = const [
    'Dart',
    'JavaScript',
    'TypeScript',
    'HTML',
    'CSS',
  ];

  final List<String> frameworks = const [
    'Flutter',
    'Next.js',
    'React.js',
    'Riverpod',
    'BLoC / Cubit',
    'GetX',
    'Redux',
    'MVVM',
    'Clean Architecture',
  ];

  final List<String> backendAndCloud = const [
    'Firebase (Auth, Firestore, FCM, Realtime DB)',
    'REST APIs',
    'GraphQL APIs',
    'Stripe Integration',
    'AWS (S3)',
    'Medusa API',
    'Gemini API',
    'Drift (Local DB)',
    'Sembast (Offline Storage)',
  ];

  final List<String> toolsAndPlatforms = const [
    'Git & GitHub',
    'Postman',
    'Figma',
    'VS Code',
    'Android Studio',
    'Xcode',
    'TestFlight',
    'Firebase App Distribution',
    'Jira',
  ];

  final List<String> softSkills = const [
    'Clean code practices',
    'Critical thinking & problem-solving',
    'Client communication',
    'Team collaboration',
    'Agile methodology',
    'Leadership & ownership',
    'Adaptability & fast learning',
    'Attention to detail',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Skills'),
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
                  'Backend & Cloud',
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
            style: theme.textTheme.headlineSmall
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
