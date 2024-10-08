// Widget for account selection dialog
import 'package:flutter/material.dart';

class AccountSelectionWidget extends StatelessWidget {
  final Size screenSize; // Screen size for responsive design
  final String accountName; // User account name
  final String email; // User email
  final String appName; // Application name

  const AccountSelectionWidget({
    super.key,
    required this.screenSize,
    required this.accountName,
    required this.email,
    required this.appName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          screenSize.width * 0.05), // Padding based on screen width
      width: screenSize.width * 0.9, // Container width based on screen width
      height:
      screenSize.height * 0.60, // Container height based on screen height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Choose an account', // Header text
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10), // Spacer
          Text(
            'To continue to $appName', // Text showing the application name

            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20), // Spacer
          ListTile(
            leading: const CircleAvatar(
              // Account profile picture
            ),
            title: Text(accountName,
                overflow: TextOverflow.clip), // Display account name
            subtitle: Text(email), // Display account email
            onTap: () {
              // Action when this account is selected
            },
          ),
          const Divider(), // Divider between list items
          ListTile(
            leading: const Icon(
                Icons.person_2_outlined), // Icon for adding another account
            title: const Text(
                'Use another account'), // Text for using another account
            onTap: () {
              // Action when "Use another account" is selected
            },
          ),
          const SizedBox(height: 10), // Spacer
          Text(
            'To continue, Google will share your name, email address, and profile picture with $appName.',
            style: TextStyle(color: Colors.grey.shade600), // Disclaimer text
          ),
        ],
      ),
    );
  }
}