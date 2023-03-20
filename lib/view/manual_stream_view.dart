import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:trac_ai/controller/controller.dart';
import 'package:trac_ai/model/api_service.dart';
import 'package:trac_ai/packages/arrow/arrow_pad_component.dart';
import 'package:trac_ai/view/error_page.dart';
import 'package:get/get.dart';

class StreamPageView extends StatefulWidget {
  const StreamPageView({super.key});

  @override
  State<StreamPageView> createState() => _StreamPageViewState();
}

class _StreamPageViewState extends State<StreamPageView> {
  // bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final AppController controller = Get.put(AppController());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Trac AI"),
          centerTitle: true,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                      // alignment: AlignmentDirectional.topStart,

                      children: [
                        CupertinoButton.filled(
                            disabledColor: Colors.red,
                            child: const Text("End Stream"),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Mjpeg(
                          fit: BoxFit.cover,
                          loading: (context) {
                            controller.isLoading.value = true;
                            return const Padding(
                              padding: EdgeInsets.all(8),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                          isLive: true,
                          timeout: const Duration(seconds: 3),
                          stream: 'http://192.168.137.102:81/stream',
                          error: (context, error, stack) {
                            controller.isLoading.value = true;
                            return Container(
                              padding: const EdgeInsets.all(12),
                              child: Text(error.toString()),
                            );
                          },
                        ),
                        Obx(() => controller.isLoading.value
                            ? Container()
                            : const Card(
                                color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.video_camera_back_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text('LIVE',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 16.0,
                                left: 0.0,
                                right: 0.0,
                                child: GestureDetector(
                                  onTapDown: (details) {
                                    print("ONTAP");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.forwardEndPoint);
                                  },
                                  onTapUp: (details) {
                                    print("ONTAP CANCEL");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  onLongPressStart: (detail) {
                                    print("ONLONG PRESS START");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.forwardEndPoint);
                                  },
                                  onLongPressEnd: (details) {
                                    print("ONLONG PRESS END");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: 16.0,
                                child: GestureDetector(
                                  onTapDown: (details) {
                                    print("ONTAP LEFT");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.leftEndPoint);
                                  },
                                  onTapUp: (details) {
                                    print("LEFT ONTAP CANCEL");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  onLongPressStart: (detail) {
                                    print("LEFT ONLONG PRESS START");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.leftEndPoint);
                                  },
                                  onLongPressEnd: (details) {
                                    print("LEFT ONLONG PRESS END");
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                right: 16.0,
                                child: GestureDetector(
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onTapDown: (details) {
                                    print("ONTAP RIGHT");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.rightEndPoint);
                                  },
                                  onTapUp: (details) {
                                    print("RIGHT ONTAP CANCEL");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  onLongPressStart: (detail) {
                                    print("RIGHT ONLONG PRESS START");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.rightEndPoint);
                                  },
                                  onLongPressEnd: (details) {
                                    print("RIGHT ONLONG PRESS END");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 16.0,
                                left: 0.0,
                                right: 0.0,
                                child: GestureDetector(
                                  onTapDown: (details) {
                                    print("ONTAP BACK");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.backwardEndPoint);
                                  },
                                  onTapUp: (details) {
                                    print("BACK ONTAP CANCEL");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  onLongPressStart: (detail) {
                                    print("BACK ONLONG PRESS START");

                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.backwardEndPoint);
                                  },
                                  onLongPressEnd: (details) {
                                    print("BACK ONLONG PRESS END");
                                    // APIService()
                                    //     .fetchApi(endpoint: APIService.stopBackWheels);
                                  },
                                  child: const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoButton.filled(
                            child: const Text('Brake / Stop '),
                            onPressed: () {
                              APIService().fetchApi(
                                  endpoint: APIService.stopBackWheels);
                            }),
                      ]))
            ]));
  }
}
