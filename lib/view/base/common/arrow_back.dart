import 'package:flutter/material.dart';
import 'package:startup_repo/helper/navigation.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).disabledColor,
        ));
  }
}
