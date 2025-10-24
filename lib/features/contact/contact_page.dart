import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:html' as html; // for Flutter web

@RoutePage()
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  Future<void> _launchUri(String uri) async {
    final parsed = Uri.parse(uri);
    if (await canLaunchUrl(parsed)) {
      await launchUrl(parsed, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $uri');
    }
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = Uri.encodeComponent(_nameController.text);
      final email = Uri.encodeComponent(_emailController.text);
      final message = Uri.encodeComponent(_messageController.text);

      final subject = Uri.encodeComponent("Portfolio Contact from $name");
      final body = Uri.encodeComponent(
          "Name: $name\nEmail: $email\n\nMessage:\n$message");

      final mailUri =
          'mailto:amarbabutharol@gmail.com?subject=$subject&body=$body';
      await _launchUri(mailUri);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email client opened!')),
      );

      _formKey.currentState?.reset();
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  Future<void> _sendWhatsApp() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = Uri.encodeComponent(_nameController.text);
      final email = Uri.encodeComponent(_emailController.text);
      final message = Uri.encodeComponent(_messageController.text);

      // Your WhatsApp number with country code (no +)
      const phone = '919497865499';

      // Construct the message
      final text = "Hi, my name is $name.\nEmail: $email\n\n$message";

      // WhatsApp URL
      final url = 'https://wa.me/$phone?text=$text';

      if (kIsWeb) {
        // Open in a new browser tab
        html.window.open(url, '_blank');
      } else {
        final parsed = Uri.parse(url);
        if (await canLaunchUrl(parsed)) {
          await launchUrl(parsed, mode: LaunchMode.externalApplication);
        } else {
          debugPrint('Could not launch WhatsApp');
        }
      }

      // Optional: show feedback
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('WhatsApp chat opened!')),
      );

      // Clear form
      _formKey.currentState?.reset();
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 800;

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
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Flex(
                direction: isWide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LEFT SIDE: Contact Cards
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Get in Touch',
                                style: theme.textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold))
                            .animate()
                            .fadeIn(duration: 400.ms),
                        const SizedBox(height: 12),
                        Text(
                          'Reach out through your preferred platform:',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                        ...contacts
                            .map((contact) => ContactTile(info: contact))
                            .toList()
                            .animate(interval: 100.ms)
                            .fadeIn(duration: 500.ms)
                            .slideX(begin: -0.1),
                      ],
                    ),
                  ),

                  if (isWide)
                    const SizedBox(width: 40)
                  else
                    const SizedBox(height: 40),

                  // RIGHT SIDE: Contact Form
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Send a Message',
                                style: theme.textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold))
                            .animate()
                            .fadeIn(duration: 400.ms),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: theme.colorScheme.surface,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Your Name',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'Please enter your name'
                                            : null,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: 'Your Email',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                          .hasMatch(value)) {
                                        return 'Enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _messageController,
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                      labelText: 'Message',
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'Please enter a message'
                                            : null,
                                  ),
                                  const SizedBox(height: 24),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton.icon(
                                      onPressed: _sendWhatsApp,
                                      icon: const Icon(Icons.send_rounded),
                                      label: const Text('Send'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        foregroundColor:
                                            theme.colorScheme.onPrimary,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 14),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),
                      ],
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

  Future<void> _launchUri(String uri) async {
    if (kIsWeb) {
      // Open mailto link in new browser tab
      html.window.open(uri, '_blank');
    } else {
      final parsed = Uri.parse(uri);
      if (await canLaunchUrl(parsed)) {
        await launchUrl(parsed);
      } else {
        debugPrint('Could not launch $uri');
      }
    }
  }

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
}
