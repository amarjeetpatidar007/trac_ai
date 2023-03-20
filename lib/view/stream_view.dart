import 'package:arrow_pad/arrow_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:trac_ai/packages/joystick_view.dart';

class StreamPageView extends StatelessWidget {
  const StreamPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trac AI"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Mjpeg(
                isLive: true,
                timeout: Duration(seconds: 10),
                stream: 'http://192.168.137.58:81/stream',
              ),
              // Container(
              //   color: Colors.black,
              //   height: 200,
              // ),
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