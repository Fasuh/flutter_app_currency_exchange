import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  final void Function()? onRefresh;

  const DefaultErrorWidget({
    Key? key,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("ERROR"),
      ],
    );
  }
}
