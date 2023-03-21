import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:trac_ai/model/api_service.dart';

class AutomateStreamView extends StatelessWidget {
  const AutomateStreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Automate"),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton.filled(
                  disabledColor: Colors.red,
                  child: const Text("End"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Mjpeg(
                  isLive: true,
                  timeout: const Duration(seconds: 1),
                  stream: streamUrl,
                  error: (context, error, stack) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      child: Text(error.toString()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton.filled(
                  disabledColor: Colors.red,
                  child: const Text("Reload"),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AutomateStreamView()),
                        (route) => route.isFirst);
                  }),
            ]));
  }
}
