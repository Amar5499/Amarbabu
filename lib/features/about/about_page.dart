import 'package:amarbabu_portfolio/shared/app_colors.dart';
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
        title: Text(
          'About Me',
          style: theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.white),
        ),
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
                          'Flutter Developer with 3 years of experience building high-quality, scalable cross-platform mobile apps and responsive web applications. '
                          'Expertise in Clean Architecture, Flutter Bloc, and real-time integrations. Passionate about performance optimization '
                          'and delivering user-centric digital products in dynamic development environments.',
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
                            style: theme.textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.w500)),
                        const SizedBox(height: 16),

                        // NEW ROLE: INSASOFT
                        _experienceSection(
                          context,
                          title: 'Mobile App Developer – Insasoft Technologies',
                          duration: 'Oct 2025 – Present',
                          highlights: [
                            'Developing "Hub Business Center," a multi-role floor/seat management system using Flutter and Clean Architecture.',
                            'Implementing complex state handling with Bloc and Chopper-based REST services.',
                            'Integrating Ably real-time notifications and Firebase push messaging for seamless user updates.',
                            'Ensuring secure role-based access control across Android, iOS, and Web platforms.',
                          ],
                        ),

                        _experienceSection(
                          context,
                          title:
                              'Flutter Developer Consultant (Freelance) – CodeScribo Technologies',
                          duration: 'May 2025 – Oct 2025',
                          highlights: [
                            'Improved UI/UX and implemented Bloc state management for "Mr Coach Pro," a fitness platform released on Google Play Store.',
                            'Added custom reusable components and Firebase messaging for real-time trainer-client alerts.',
                            'Developed a Shopify e-commerce app using Flutter, Riverpod, and GraphQL.',
                            'Enhanced field management apps with offline-first support using Drift and Sembast.',
                          ],
                        ),

                        _experienceSection(
                          context,
                          title: 'Software Engineer – Perfectz Digital',
                          duration: 'Jan 2023 – Jun 2025',
                          highlights: [
                            'Built multi-role e-commerce, school bus tracking, and booking apps with Flutter and Firebase.',
                            'Integrated Stripe payments, Google Sign-In, and Medusa APIs for dynamic order flows.',
                            'Led responsive web development using React (Next.js) and Vite with AWS S3 deployment.',
                            'Collaborated on real-time notification systems and performance optimization.',
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
                          '• Published “Flutter Responsive Kit” on pub.dev — a lightweight package for building adaptive UIs across mobile, tablet, and desktop.\n'
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
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
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
