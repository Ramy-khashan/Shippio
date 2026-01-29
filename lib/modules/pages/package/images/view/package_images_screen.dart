import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/app_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../widgets/app_bar.dart';

import '../controller/package_images_bloc.dart';
import 'widget/uploaded_image.dart';

class PackageImagesScreen extends StatelessWidget {
  const PackageImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PackageImagesBloc controller = PackageImagesBloc.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Take a picture of the item",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Please note: ",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text:
                                  "Take picture of your parcel close to a recognisable object such as a chair, pen , etc.",
                            ),
                          ],
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    UploadedImage(),
                  ],
                ),
              ),
            ),
            BlocBuilder<PackageImagesBloc, PackageImagesState>(
              builder: (context, state) {
                return AppButton(
                  title: state.imagesList.isEmpty ? "Take a Picture" : "Submit",
                  onPressed: () {
                    state.imagesList.isNotEmpty
                        ? controller.add(OnSubmitEvent(context: context))
                        : controller.add(PickImageEvent());
                  },
                  icon: state.imagesList.isEmpty
                      ? Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.whiteColor,
                        )
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
