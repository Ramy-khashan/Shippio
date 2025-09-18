import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_colors.dart';

class ViewFile extends StatelessWidget {
  const ViewFile({super.key, required this.file, this.fileName});
  final String file;
  final String? fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.close, color: AppColors.redColor),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          child: file.contains("assets/")
              ? Image.asset(
                  file,
                  width: double.infinity,
                  height: double.infinity,
                )
              : file.contains("https:") || file.contains("http:")
              ? CachedNetworkImage(
                  imageUrl: file,
                  imageBuilder: (context, imageProvider) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,

                        colorFilter: ColorFilter.mode(
                          Colors.red,
                          BlendMode.colorBurn,
                        ),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : file.length > 200
              ? Image.memory(
                  base64.decode(file),
                  width: double.infinity,
                  height: double.infinity,
                )
              : Center(
                  child: Text(
                    "Can't Define This Image",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
