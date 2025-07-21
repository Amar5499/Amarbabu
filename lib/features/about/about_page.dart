import 'package:amar_portfolio/shared/utils/animated_section.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:amar_portfolio/shared/app_colors.dart';
import 'package:amar_portfolio/shared/app_text_styles.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('About Me'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
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
                    title: 'Objective',
                    content:
                        'Software Engineer with 2+ years of experience in Flutter and React.js development. '
                        'Passionate about building scalable, user-centric applications across platforms. Seeking opportunities to drive innovation and deliver high-quality software.',
                  ),
                ),
                AnimatedSection(
                  delay: 200,
                  child: _buildSection(
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
                      Text('Experience', style: AppTextStyles.headline),
                      const SizedBox(height: 16),
                      _experienceSection(
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

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.headline),
        const SizedBox(height: 8),
        Text(content, style: AppTextStyles.body),
        const SizedBox(height: 32),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }

  Widget _experienceSection({
    required String title,
    required String duration,
    required List<String> highlights,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.subtitle),
        const SizedBox(height: 4),
        Text(duration, style: AppTextStyles.body.copyWith(color: Colors.grey)),
        const SizedBox(height: 8),
        ...highlights.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(child: Text(point, style: AppTextStyles.body)),
                ],
              ),
            )),
        const SizedBox(height: 32),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
