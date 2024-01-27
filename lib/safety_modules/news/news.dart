import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

void main() {
  runApp(const GoogleNewsPage());
}

class GoogleNewsPage extends StatefulWidget {
  const GoogleNewsPage({super.key});

  @override
  State<GoogleNewsPage> createState() => _GoogleNewsPageState();
}

class _GoogleNewsPageState extends State<GoogleNewsPage> {
  final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
  Future<void>? _launched;

  @override
  void initState() {
    super.initState();
    // Check for Android Custom Tab support.
    launcher
        .supportsMode(PreferredLaunchMode.inAppBrowserView)
        .then((bool result) {
      setState(() {
        // _hasCustomTabSupport = result;
      });
    });
  }

  Future<void> _launchInWebView(String url) async {
    if (!await launcher.launchUrl(
      url,
      const LaunchOptions(mode: PreferredLaunchMode.inAppWebView),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // The URL is not displayed in the UI.
    const String toLaunch = 'https://news.google.com/search?pz=1&cf=all&hl=en-IN&q=Sexual+harassment&gl=IN&ceid=IN:ens';
    return Scaffold(
      appBar: AppBar(
        title: Text('Google News Page'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Commented out the line below to hide the URL
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Text(toLaunch),
              // ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInWebView(toLaunch);
                }),
                child: const Text('Launch in web view'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}
