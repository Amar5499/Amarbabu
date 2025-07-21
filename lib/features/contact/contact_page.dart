import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amar_portfolio/shared/app_colors.dart';
import 'package:amar_portfolio/shared/app_text_styles.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                ContactTile(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'amarbabutharol@gmail.com',
                  onTap: () => _launchUri('mailto:amarbabutharol@gmail.com'),
                ),
                ContactTile(
                  icon: Icons.phone,
                  label: 'Phone',
                  value: '+91 94978 65499',
                  onTap: () => _launchUri('tel:+919497865499'),
                ),
                ContactTile(
                  icon: Icons.linked_camera, // or Icons.person
                  label: 'LinkedIn',
                  value: 'linkedin.com/in/amarbabu-t-15a301198',
                  onTap: () => _launchUri(
                      'https://www.linkedin.com/in/amarbabu-t-15a301198'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUri(String uri) async {
    final parsed = Uri.parse(uri);
    if (await canLaunchUrl(parsed)) {
      await launchUrl(parsed, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $uri');
    }
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const ContactTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label, style: AppTextStyles.subtitle),
        subtitle:
            Text(value, style: AppTextStyles.body.copyWith(color: Colors.blue)),
        onTap: onTap,
      ),
    );
  }
}
