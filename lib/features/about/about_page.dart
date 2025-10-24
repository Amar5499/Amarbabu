import 'package:amarbabu_portfolio/shared/utils/animated_section.dart';
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
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- OBJECTIVE ---
                  AnimatedSection(
                    delay: 0,
                    child: _buildSection(
                      context,
                      title: 'Objective',
                      content:
                          'Mobile App Developer with 3+ years of experience building cross-platform applications using Flutter and Next.js. '
                          'Passionate about crafting performant, maintainable, and user-centric digital products following clean architecture principles. '
                          'Aiming to contribute to scalable, design-driven solutions that blend functionality with seamless UI/UX.',
                    ),
                  ),

                  // --- EDUCATION ---
                  AnimatedSection(
                    delay: 200,
                    child: _buildSection(
                      context,
                      title: 'Education',
                      content: 'B.Tech in Information Technology\n'
                          'School of Engineering, CUSAT (2018–2022)',
                    ),
                  ),

                  // --- EXPERIENCE ---
                  AnimatedSection(
                    delay: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Experience',
                            style: theme.textTheme.headlineMedium),
                        const SizedBox(height: 16),
                        _experienceSection(
                          context,
                          title:
                              'Flutter Developer Consultant (Freelance) – CodeScribo Technologies',
                          duration: 'May 2025 – Present',
                          highlights: [
                            'Developed a full-featured Shopify e-commerce app using Flutter, Riverpod, GraphQL, and Clean Architecture.',
                            'Enhanced a field Observation & Task Management app with offline-first support using Drift, Sembast, and get_it.',
                            'Implemented modular architecture and network-aware syncing for robust offline data handling.',
                          ],
                        ),
                        _experienceSection(
                          context,
                          title: 'Software Engineer – Perfectz Digital',
                          duration: 'Jan 2023 – Jun 2025',
                          highlights: [
                            'Built multi-role e-commerce, school bus tracking, and booking apps with Flutter and Firebase.',
                            'Integrated Stripe payments, Google Sign-In, and Medusa APIs for dynamic order and payment flows.',
                            'Led responsive web app development using React (Next.js), Redux, and Vite with AWS S3 deployment.',
                            'Collaborated on clean architecture, performance optimization, and real-time notification systems.',
                          ],
                        ),
                      ],
                    ),
                  ),

                  // --- OPEN SOURCE / ACHIEVEMENTS ---
                  AnimatedSection(
                    delay: 600,
                    child: _buildSection(
                      context,
                      title: 'Open Source & Achievements',
                      content:
                          '• Published “Flutter Responsive Kit” on pub.dev — a lightweight package for building adaptive Flutter UIs.\n'
                          '• Authored a Medium article on “Certificate Transparency in Flutter: Enhancing App Security”.\n'
                          '• Recognized for client appreciation and rapid delivery of scalable, production-ready features.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper for simple text sections ---
  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text(content, style: theme.textTheme.bodyMedium?.copyWith(height: 1.5)),
        const SizedBox(height: 32),
        Divider(color: theme.dividerColor.withOpacity(0.3)),
      ],
    );
  }

  // --- Helper for experience with bullet points ---
  Widget _experienceSection(BuildContext context,
      {required String title,
      required String duration,
      required List<String> highlights}) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(duration,
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey)),
        const SizedBox(height: 8),
        ...highlights.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(point,
                        style:
                            theme.textTheme.bodyMedium?.copyWith(height: 1.4)),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 24),
        Divider(color: theme.dividerColor.withOpacity(0.3)),
      ],
    );
  }
}
