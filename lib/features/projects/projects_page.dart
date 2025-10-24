import 'package:amarbabu_portfolio/shared/utils/animated_project_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../shared/app_colors.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Flutter E-commerce App (Shopify Integration)',
      'description':
          'Developed a full-featured e-commerce application integrated with Shopify Storefront GraphQL APIs. Implemented product catalog, wishlist, order history, and dynamic filtering using Riverpod and MVVM Clean Architecture for scalability and maintainability.',
    },
    {
      'title': 'Observation & Task Management App',
      'description':
          'Enhanced an offline-first field data collection app with checklist-based observations, dynamic forms, image capture, and network-aware syncing. Utilized Flutter, BLoC/Cubit, Drift, Sembast, and get_it for local persistence and modular Clean Architecture.',
    },
    {
      'title': 'School Bus Management App',
      'description':
          'Built staff and parent Flutter apps with RFID-based check-in/out, GPS live tracking, and FCM notifications. Integrated Firebase, OpenStreetMap, and Telpo devices to ensure real-time monitoring and student safety, managed via scalable Riverpod state management.',
    },
    {
      'title': 'Multi-role E-commerce Platform',
      'description':
          'Developed three role-specific apps (User, Driver, Store) using Flutter, Firebase, Stripe, and Medusa API. Implemented real-time order updates, secure authentication, and responsive UIs using Riverpod and GetX.',
    },
    {
      'title': 'Bookezy – Service Booking App',
      'description':
          'Led UI/UX design and implementation for a Flutter app enabling real-time service booking, secure authentication, and profile management through custom REST APIs and Riverpod.',
    },
    {
      'title': 'ShopLite – E-commerce Web App',
      'description':
          'Created a responsive web platform using React (Next.js), Vite, Redux, and Firebase. Integrated REST APIs for product and order management and deployed the solution on AWS S3 with modular architecture for maintainability.',
    },
    {
      'title': 'AI-Powered Grammar Correction App',
      'description':
          'Designed a multimodal Flutter application leveraging the Gemini API for real-time grammar correction. Integrated speech-to-text, text-to-speech, and camera preview for an immersive, accessible user experience.',
    },
    {
      'title': 'Cross-Platform Chat & Location App',
      'description':
          'Developed a feature-rich Flutter chat application with Firebase push notifications, local SQLite storage, and QR-based device token exchange. Added bilingual support (English/Arabic) and geofencing using Google Maps for location-aware interactions.',
    },
    {
      'title': 'Flutter Responsive Kit (Open Source)',
      'description':
          'Published a Flutter package providing responsive layout helpers and utilities for adaptive UI design across mobile, tablet, and desktop platforms. Focused on developer experience with clean APIs and comprehensive documentation.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Projects',
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
      ),
    );
  }
}
