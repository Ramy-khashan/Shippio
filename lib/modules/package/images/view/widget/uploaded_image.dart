import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/loading_item.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_enums.dart';
import '../../../../../core/utils/functions/view_file_method.dart';

import '../../controller/package_images_bloc.dart';
import 'upload_images_instruction.dart';

class UploadedImage extends StatelessWidget {
  const UploadedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackageImagesBloc, PackageImagesState>(
      builder: (context, state) {
        return state.imagesList.isEmpty
            ? const UploadImagesInstruction()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(9),
                        onTap: () {
                          viewFileMethod(
                            context: context,
                            file: state.imagesList[index],
                          );
                        },
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,
                              surfaceTintColor: AppColors.whiteColor,
                              color: AppColors.whiteColor,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.memory(
                                base64.decode(state.imagesList[index].file),
                                fit: BoxFit.cover,
                                height: 300,
                                width: 150,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                PackageImagesBloc.get(context).add(
                                  DeleteImageEvent(selectedImageIndex: index),
                                );
                              },
                              icon: Icon(
                                CupertinoIcons.trash,
                                color: AppColors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: state.imagesList.length,
                    ),
                  ),
                  state.getImages == RequestStatus.loading
                      ? LoadingItem()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: AppColors.primaryColor,
                              ),
                              borderRadius: BorderRadiusGeometry.circular(9),
                            ),
                            backgroundColor: AppColors.whiteColor,
                          ),

                          onPressed: () {
                            PackageImagesBloc.get(
                              context,
                            ).add(PickImageEvent());
                          },
                          child: Text(
                            "Take another Picture",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                ],
              );
      },
    );
  }
}
