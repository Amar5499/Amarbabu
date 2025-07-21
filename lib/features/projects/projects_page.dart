import 'package:amar_portfolio/shared/utils/animated_project_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'School Bus Management App',
      'description':
          'Led UI development for a school transport app with Firebase-based real-time notifications and seamless app distribution.'
    },
    {
      'title': 'Multi-app E-commerce Platform',
      'description':
          'Built Flutter UIs for User, Driver, and Store apps. Integrated Stripe, Firebase, and Medusa APIs. Used GetX and Riverpod.'
    },
    {
      'title': 'Bookezy Booking App',
      'description':
          'Designed intuitive UI and built user authentication, profile, booking & scheduling with custom APIs and Riverpod.'
    },
    {
      'title': 'ShopLite Web App',
      'description':
          'Created a high-performance e-commerce site using React + Vite. Integrated REST APIs, Redux, Firebase, and deployed on AWS.'
    },
    {
      'title': 'GPA App',
      'description':
          'Developed a Flutter app for Grama Panchayath to help citizens connect with local governance. Firebase backend.'
    },
    {
      'title': 'Transcriber App',
      'description':
          'Real-time grammar correction using Gemini API. Used camera preview, speech-to-text, and TTS playback for interaction.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Projects'),
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
              children: List.generate(
                projects.length,
                (index) => AnimatedProjectCard(
                  title: projects[index]['title']!,
                  description: projects[index]['description']!,
                  delay: index * 150,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
