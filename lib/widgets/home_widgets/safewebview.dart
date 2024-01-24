import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SafeWebView extends StatelessWidget {
  final String? url;

  SafeWebView({this.url});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _launchUrl(context, url),
      child: Text('Open URL'),
    );
  }

  _launchUrl(BuildContext context, String? url) async {
    if (url != null) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Handle error, for example, display a Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cannot launch URL: $url'),
          ),
        );
      }
    }
  }
}
