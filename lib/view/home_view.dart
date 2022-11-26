import 'package:flutter/material.dart';
import 'package:sample_project/util/system.dart';

class HomePresenter extends StatefulWidget {
  final VoidCallback onTapCounter;

  const HomePresenter({
    super.key,
    required this.onTapCounter,
  });

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePresenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: System.data.color!.myColor,
      body: Stack(
        children: [
          SafeArea(
            child: speedTest(),
          ),
          buttonCenter(),
        ],
      ),
    );
  }

  Widget speedTest() {
    return Align(
      alignment: Alignment.topCenter,
      child: StreamBuilder(
        initialData: System.data.global.downloadSpeed,
        stream: System.data.global.downloadSpeedStream.stream,
        builder: (ctx, ss) {
          return Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: (ss.data ?? 0) > 30
                          ? Colors.green
                          : (ss.data ?? 0) > 20
                              ? Colors.yellow
                              : Colors.red,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  color: Colors.transparent,
                  child: Text(
                    "${ss.data} Kb/s",
                    style: System.data.textStyles!.boldTitleLightLabel.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buttonCenter() {
    return Center(
      child: Container(
        color: Colors.transparent,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            widget.onTapCounter();
          },
          child: Text(
            "Counter",
            style: System.data.textStyles!.boldTitleLabel.copyWith(
              color: System.data.color!.lightTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
