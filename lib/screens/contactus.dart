

import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ContactOption(
            icon: Icons.email,
            title: 'Email Us',
            subtitle: 'support@example.com',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening Email...')),
              );
            },
          ),
          ContactOption(
            icon: Icons.message,
            title: 'WhatsApp',
            subtitle: '+1 234 567 890',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening WhatsApp...')),
              );
            },
          ),
          ContactOption(
            icon: Icons.question_answer,
            title: 'Post a Query',
            subtitle: 'Submit your question online',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Redirecting to Query Form...')),
              );
            },
          ),
          ContactOption(
            icon: Icons.telegram,
            title: 'Telegram',
            subtitle: '@example_support',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening Telegram...')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}

