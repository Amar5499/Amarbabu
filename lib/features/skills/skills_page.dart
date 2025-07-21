import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:amar_portfolio/shared/app_colors.dart';
import 'package:amar_portfolio/shared/app_text_styles.dart';

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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Skills'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSkillSection('Technical Skills', technicalSkills),
                _buildSkillSection('Tools & Platforms', tools),
                _buildSkillSection('Soft Skills', softSkills),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.headline),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: items.map((skill) {
            return Chip(
              label: Text(skill, style: AppTextStyles.body),
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppColors.primary.withOpacity(0.5)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
