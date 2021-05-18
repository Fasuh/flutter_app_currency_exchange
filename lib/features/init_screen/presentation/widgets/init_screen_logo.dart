import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class InitialScreenLogoWidget extends StatelessWidget {
  static const imageUrl =
      'https://prowly-uploads.s3.eu-west-1.amazonaws.com/uploads/landing_page_image/image/80991/logotyp_wsb_chorzow_katowice_granat.jpg';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: FadeInImage.memoryNetwork(
              image: imageUrl,
              placeholder: kTransparentImage,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
