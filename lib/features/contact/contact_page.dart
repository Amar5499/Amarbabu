import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final contacts = [
      ContactInfo(
        icon: Icons.email,
        label: 'Email',
        value: 'amarbabutharol@gmail.com',
        uri: 'mailto:amarbabutharol@gmail.com',
      ),
      ContactInfo(
        icon: Icons.phone,
        label: 'Phone',
        value: '+91 94978 65499',
        uri: 'tel:+919497865499',
      ),
      ContactInfo(
        icon: Icons.person,
        label: 'LinkedIn',
        value: 'linkedin.com/in/amarbabu-t-15a301198',
        uri: 'https://www.linkedin.com/in/amarbabu-t-15a301198',
      ),
      ContactInfo(
        icon: Icons.code,
        label: 'GitHub',
        value: 'github.com/Amar5499',
        uri: 'https://github.com/Amar5499',
      ),
      ContactInfo(
        icon: Icons.camera_alt,
        label: 'Instagram',
        value: 'instagram.com/_a_.m_.r',
        uri: 'https://www.instagram.com/_a_.m_.r/',
      ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let’s connect!',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                Text(
                  'Reach out via your preferred platform below:',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                ...contacts
                    .map((contact) => ContactTile(info: contact))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo {
  final IconData icon;
  final String label;
  final String value;
  final String uri;

  const ContactInfo({
    required this.icon,
    required this.label,
    required this.value,
    required this.uri,
  });
}

class ContactTile extends StatelessWidget {
  final ContactInfo info;

  const ContactTile({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      color: theme.colorScheme.surface,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        leading: Icon(info.icon, color: theme.colorScheme.primary),
        title: Text(info.label, style: theme.textTheme.titleMedium),
        subtitle: Text(
          info.value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary.withOpacity(0.9),
            decoration: TextDecoration.underline,
          ),
        ),
        onTap: () => _launchUri(info.uri),
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
