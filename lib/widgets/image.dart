import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MAvatar extends StatelessWidget {
  final String image;
  final double radius;
  final double size;

  const MAvatar({
    required this.image,
    this.radius = 0,
    this.size = 35,
  });

  @override
  Widget build(BuildContext context) {
    return MImage(
      image: image,
      width: size,
      height: size,
      radius: radius > 0 ? radius : size / 2,
    );
  }
}

class MImage extends StatelessWidget {
  final String image;
  final double radius;
  final double height;
  final double width;
  final BoxFit? boxFit;

  final Widget? placeholder;
  final Widget? errorWidget;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  const MImage(
      {required this.image,
      this.radius = 0,
      this.height = 0,
      this.width = 0,
      this.placeholder,
      this.errorWidget,
      this.progressIndicatorBuilder,
      this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        child: SizedBox(
          child: buildCachedNetworkImage(),
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  Widget buildCachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: image,
      fit: boxFit,
      progressIndicatorBuilder: progressIndicatorBuilder,
      placeholder: progressIndicatorBuilder == null
          ? (context, url) {
              return placeholder ??
                  const Center(
                    child: Icon(
                      Icons.image,
                      color: Colors.transparent,
                    ),
                  );
            }
          : null,
      errorWidget: (context, url, error) {
        return errorWidget ??
            Center(
              child: Icon(
                Icons.image_not_supported,
                color: Colors.grey[200],
              ),
            );
      },
    );
  }
}
