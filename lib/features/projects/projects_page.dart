import 'package:amarbabu_portfolio/shared/utils/animated_project_card.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../shared/app_colors.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Hub Business Center – Floor Management App',
      'description':
          'Developed a complex multi-role tenant management system at Insasoft Technologies. Features include real-time seat/floor management using Ably, Bloc-driven state handling, and Chopper-based REST services. Built with Clean Architecture to support Android, iOS, and Web platforms.',
    },
    {
      'title': 'Mr Coach Pro – Fitness & Coaching Platform',
      'description':
          'Enhanced a professional coaching platform with Bloc-based state management. Integrated Razorpay payment gateway for seamless subscription handling and Firebase Cloud Messaging for real-time alerts. Successfully managed the end-to-end release process on the Google Play Store.',
    },
    {
      'title': 'GPA – Gram Panchayath App',
      'description':
          'A citizen-centric Android application featuring a Google Maps integration with a 2km geofencing radius to highlight local activities. Built using Flutter and Firebase, following the MVC pattern with Riverpod for efficient state management.',
    },
    {
      'title': 'Flutter E-commerce App (Shopify Integration)',
      'description':
          'Developed a high-performance e-commerce application integrated with Shopify Storefront GraphQL APIs. Implemented product catalogs, wishlists, and dynamic filtering using Riverpod and MVVM Clean Architecture.',
    },
    {
      'title': 'Observation & Task Management App',
      'description':
          'An offline-first field data collection app featuring dynamic forms and network-aware syncing. Utilized Drift and Sembast for local persistence and get_it for dependency injection within a modular Clean Architecture.',
    },
    {
      'title': 'School Bus Management & RFID Tracking',
      'description':
          'Built a dual-app system (Staff/Parent) with RFID-based check-in/out and live GPS tracking. Integrated OpenStreetMap and Telpo hardware devices with Firebase for real-time student safety monitoring.',
    },
    {
      'title': 'Flutter Responsive Kit (Open Source)',
      'description':
          'Published a lightweight, extensible Flutter package on pub.dev to streamline adaptive UI construction. Includes utilities like ResponsiveBuilder and ResponsiveGrid, supporting dynamic breakpoints across Mobile, Tablet, and Desktop.',
    },
    {
      'title': 'Multi-role E-commerce & Medusa API',
      'description':
          'Engineered a three-tier app ecosystem (User, Driver, Store) using Flutter and Medusa API. Integrated Stripe payments and real-time order tracking with a focus on responsive UI/UX across all device types.',
    },
    {
      'title': 'AI-Powered Grammar Correction App',
      'description':
          'Designed a multimodal Flutter application leveraging the Gemini API for real-time grammar correction. Features speech-to-text, text-to-speech, and camera-based text recognition for an immersive user experience.',
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
