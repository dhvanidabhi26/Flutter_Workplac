import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("URL Launcher"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                makeCall("+918460270805");
              },
              child: const Icon(Icons.call),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                sendSMS("+918460270805");
              },
              child: const Icon(Icons.sms),
            ),
          ],
        ),
      ),
    );
  }

  void makeCall(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url))
      {
      await launchUrl(url);
    } else {
      _showErrorDialog('Could not launch $url');
    }
  }

  void sendSMS(String number) async {
    final Uri url = Uri(scheme: 'sms', path: number);
    if (await canLaunchUrl(url))
    {
      await launchUrl(url);
    } else {
      _showErrorDialog('Could not launch $url');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions:[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}