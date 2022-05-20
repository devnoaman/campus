import 'package:campus/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:extended_image/extended_image.dart';

class ImageView extends HookConsumerWidget {
  final String? img;
  const ImageView({Key? key, this.img}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Stack(
        children: [
          ExtendedImage.network(
            img.toString(),
            width: getSize(context).width,
            height: getSize(context).height,
            fit: BoxFit.cover,
            cache: true,
            // border: Border.all(color: Colors.red, width: 1.0),
            // shape: boxShape,
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            //cancelToken: cancellationToken,
          ),
          const SafeArea(child: BackButton()),
        ],
      ),
    );
  }
}
