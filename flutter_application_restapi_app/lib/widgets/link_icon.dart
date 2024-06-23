import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkIcon extends StatelessWidget {
  const LinkIcon({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final Uri uri = Uri.parse(link);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.black,content: Text('Could not launch $link',style: const TextStyle(color: Colors.white),)),
          );
        }
      },
      icon: const Icon(Icons.link),
    );
  }
}
