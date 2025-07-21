import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  final List<String> technicalSkills = const [
    'Flutter',
    'Dart',
    'React.js',
    'Firebase',
    'Riverpod',
    'GetX',
    'Redux',
    'Stripe API',
    'REST APIs',
    'Gemini API',
    'Vite',
    'Medusa API',
  ];

  final List<String> tools = const [
    'Git',
    'Figma',
    'Postman',
    'VS Code',
    'Android Studio',
    'TestFlight',
    'AWS (Hosting)',
  ];

  final List<String> softSkills = const [
    'Clean code practices',
    'Quick learning & adaptability',
    'Client communication',
    'Team collaboration',
    'Agile methodology',
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
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSkillSection(
                    context, 'Technical Skills', technicalSkills),
                _buildSkillSection(context, 'Tools & Platforms', tools),
                _buildSkillSection(context, 'Soft Skills', softSkills),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillSection(
      BuildContext context, String title, List<String> items) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineMedium),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        Divider(color: theme.dividerColor.withOpacity(0.3)),
      ],
    );
  }
}
