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
      body: Center(
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
      ),
    );
  }
}
