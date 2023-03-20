import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:trac_ai/packages/joystick_view.dart';
import 'package:trac_ai/view/error_page.dart';

class StreamPageView extends StatefulWidget {
  const StreamPageView({super.key});

  @override
  State<StreamPageView> createState() => _StreamPageViewState();
}

class _StreamPageViewState extends State<StreamPageView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trac AI"),
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
                padding: const EdgeInsets.all(12.0),
                child: Mjpeg(
                  isLive: true,
                  timeout: const Duration(seconds: 2),
                  stream: 'http://192.168.137.58:81/stream',
                  error: (context, error, stack) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(error.toString()),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              ArrowPad(
                height: 200,
                width: 200,
                onPressedUp: () {
                  print("Up");
                },
                onPressedDown: () {
                  print("Down");
                },
                onPressedLeft: () {
                  print("Left");
                },
                onPressedRight: () {
                  print("Right");
                },
              )
            ]));
  }
}

// Center(
              //   child: Text("X : $x"),
              // ),
              // Center(
              //   child: Text("Y : $y"),
              // ),
              // Joystick(
              //   listener: (StickDragDetails details) {
              //     print(details.x);
              //     y = details.y;
              //     // details.x <=
              //   },
              // ),

              // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //   Container(
              //     decoration: BoxDecoration(
              //       shape: BoxShape.rectangle,
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //     child: JoystickView(

              //       innerCircleColor: Colors.grey,
              //       backgroundColor: Colors.grey.shade400,
              //       iconsColor: Colors.white,
              //       showArrows: true,
              //       size: 200.0,
              //       onDirectionChanged: (degrees, dis) {
              //         setState(() {
              //           degree = degrees;
              //           dis = distance;
              //         });
              //       },
              //     ),
              //   ),
              // ])