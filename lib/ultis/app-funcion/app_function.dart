import 'dart:io';
import 'package:bai_9a/ultis/app_logger.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppFunction {
  static Future<void> checkPermissionPhoto(BuildContext context, {VoidCallback? callback}) async {
    try {
      late PermissionStatus status;

      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.sdkInt;

        if (release > 32) {
          await Permission.photos.request();
          status = await Permission.photos.status;
        } else {
          await Permission.storage.request();
          status = await Permission.storage.status;
        }
      } else {
        await Permission.photos.request();
        status = await Permission.photos.status;
      }
      if (status.isGranted) {
        callback?.call();
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Yêu cầu quyền truy cập ảnh!'),
              content: Text('Bạn có chắc chắn muốn thực hiện hành động này?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    openAppSettings();
                  },
                  child: Text('Open Setting'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Hành động đã được thực hiện!')),
                    );
                  },
                  child: Text('Có'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
