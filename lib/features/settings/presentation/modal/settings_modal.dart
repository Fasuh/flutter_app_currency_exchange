import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zal/features/settings/presentation/widgets/settings.dart';

Future openSettingsModal({
  required BuildContext context,
}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsWidget();
      });
}
