import 'package:flutter/material.dart';

import 'default_error_widget.dart';

class DefaultErrorScreen extends StatelessWidget {
  final void Function()? onRefresh;

  const DefaultErrorScreen({
    Key? key,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DefaultErrorWidget(
          onRefresh: onRefresh,
        ),
      ),
    );
  }
}
