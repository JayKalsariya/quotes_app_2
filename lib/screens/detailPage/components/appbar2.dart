import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:quotes_app_2/headers.dart';
import 'package:share_extend/share_extend.dart';

import '../../../utils/fonts_enum.dart';
import '../../../utils/global.dart';

AppBar myAppBar2({
  required Quote quote,
  required void Function() onReset,
  required BuildContext context,
  required Function<File>() getFileFromWidget,
}) {
  return AppBar(
    title: const Text(
      'Detail Page',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      // IconButton(
      //   onPressed: onReset,
      //   icon: const Icon(Icons.refresh),
      // ),
      IconButton(
        onPressed: () {
          Clipboard.setData(
            ClipboardData(
              text: "${quote.quote}\n\n\n\t- ${quote.author}",
            ),
          );
        },
        icon: const Icon(Icons.copy),
      ),
      IconButton(
        onPressed: () async {
          ImageGallerySaver.saveFile(
            (await getFileFromWidget()).path,
            isReturnPathOfIOS: true,
          ).then(
            (value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Saved to gallery !!"),
              ),
            ),
          );
        },
        icon: const Icon(Icons.save),
      ),
      IconButton(
        onPressed: () async {
          ShareExtend.share(
            (await getFileFromWidget()).path,
            "image",
          );
        },
        icon: const Icon(Icons.share),
      ),
    ],
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff93A5CF),
            Color(0xffE4EfE9),
          ],
        ),
      ),
    ),
  );
}
