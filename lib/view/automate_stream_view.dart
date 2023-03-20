import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

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
              Mjpeg(
                isLive: true,
                timeout: const Duration(seconds: 1),
                stream: 'http://192.168.137.102:81/stream',
                error: (context, error, stack) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    child: Text(error.toString()),
                  );
                },
              ),
            ]));
  }
}
