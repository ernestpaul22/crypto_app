import 'package:crypto_app/services/internet_connectivity_service.dart';
import 'package:crypto_app/styles/fonts.dart';
import 'package:flutter/material.dart';

class InternetStatusWidget extends StatefulWidget {
  @override
  State<InternetStatusWidget> createState() => _InternetStatusWidgetState();
}

class _InternetStatusWidgetState extends State<InternetStatusWidget> {
  bool connectedToInternet = true;

  getConnectionStatus() async {
    bool connected = await InternetConnectivityService()
        .checkIfDeviceIsConnectedToInternet();
    setState(() {
      connectedToInternet = connected;
    });
  }

  @override
  void initState() {
    super.initState();
    getConnectionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          if (!connectedToInternet)
            SizedBox(
              height: 24,
            ),
          if (!connectedToInternet)
            Text(
              'You are not connected to the internet. Please connect to receive realtime updates!',
              style: AppFonts.primaryText,
            ),
          if (!connectedToInternet)
            TextButton(
                onPressed: () {
                  getConnectionStatus();
                },
                child: Text('Retry'))
        ],
      ),
    );
  }
}
