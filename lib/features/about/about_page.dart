import 'package:amar_portfolio/shared/utils/animated_section.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSection(
                  delay: 0,
                  child: _buildSection(
                    context,
                    title: 'Objective',
                    content:
                        'Software Engineer with 2+ years of experience in Flutter and React.js development. '
                        'Passionate about building scalable, user-centric applications across platforms. Seeking opportunities to drive innovation and deliver high-quality software.',
                  ),
                ),
                AnimatedSection(
                  delay: 200,
                  child: _buildSection(
                    context,
                    title: 'Education',
                    content:
                        'B.Tech in Information Technology\nSchool of Engineering, CUSAT (2018–2022)',
                  ),
                ),
                AnimatedSection(
                  delay: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Experience', style: theme.textTheme.headlineMedium),
                      const SizedBox(height: 16),
                      _experienceSection(
                        context,
                        title: 'Software Engineer at Perfectz Digital',
                        duration: 'Jan 2023 – Present',
                        highlights: [
                          'Led UI development for school bus & e-commerce apps',
                          'Integrated Firebase, Stripe, Medusa APIs',
                          'Used Riverpod & GetX for scalable state management',
                          'Built Web app with React.js, Vite, Redux',
                          'Handled real-time notifications and deployment',
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedSection(
                  delay: 600,
                  child: _buildSection(
                    context,
                    title: 'Achievements',
                    content: '• Star of the Quarter\n'
                        '• Champ of the Month\n'
                        '• Client appreciation for clean code & fast support',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(content, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 32),
        Divider(color: theme.dividerColor.withOpacity(0.3)),
      ],
    );
  }

  Widget _experienceSection(BuildContext context,
      {required String title,
      required String duration,
      required List<String> highlights}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(duration,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
        const SizedBox(height: 8),
        ...highlights.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                      child: Text(point, style: theme.textTheme.bodyMedium)),
                ],
              ),
            )),
        const SizedBox(height: 32),
        Divider(color: theme.dividerColor.withOpacity(0.3)),
      ],
    );
  }
}
