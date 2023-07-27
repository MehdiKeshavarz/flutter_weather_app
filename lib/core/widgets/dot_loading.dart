import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DotLoadingWidget extends StatelessWidget {
  const DotLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        size: 40,
        color: Colors.res,
      ),
    );
  }
}
