part of 'file_process.dart';

class FileProcessImpl extends FileProcess {
  //MARK: Pick File
  // @override
  // Future<File?> pickFile() async {
  //   try {
  //     // FilePickerResult? file = await FilePicker.platform.pickFiles(
  //     //   type: FileType.any,
  //     // );
  //     // if (file == null) {
  //     //   AppToast("no_file_picked".tr());
  //     //   return null;
  //     // }
  //     // if (!Validate.fileExtensionRegExp.hasMatch((file.files.single.path!))) {
  //     //   AppToast("invalid_file".tr(), isError: true);
  //     //   return null;
  //     // }
  //     // return File(file.files.single.path!);
  //   } catch (e) {
  //     AppToast("no_file_picked".tr());
  //     return null;
  //   }
  // }

  // @override
  // Future<FileProcessModel?> allFileProcess() async {
  //   File? pickedFile = await pickFile();

  //   if (pickedFile != null) {
  //     String fileBase64 = await convertFileToBase64(file: pickedFile);
  //     return FileProcessModel(
  //       file: fileBase64,
  //       fileName: (pickedFile.path).toString().split("/").last,
  //     );
  //   } else {
  //     return null;
  //   }
  // }

  //MARK: Pick Image Process

  //   Future<File?> pickImage() async {
  //     //ByFile
  //   try {
  //     FilePickerResult? file = await FilePicker.platform.pickFiles(
  //       type: FileType.image,
  //     );
  //         if (file == null) {
  //       AppToast("no_file_picked".tr());
  //       return null;
  //     }
  //     if (kReleaseMode) {
  //       if (!Validate.fileExtensionRegExp.hasMatch((file.files.single.path!))) {
  //         AppToast("invalid_file".tr(), isError: true);
  //         return null;
  //       }
  //     }
  //     return File(file.files.single.path!);
  //   } catch (e) {
  //     AppToast("no_file_picked".tr());
  //  }
  @override
  Future<File?> pickImage({required bool isCamera}) async {
    try {
      XFile? xFile = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );

      if (xFile == null) {
        AppToast("No image picked");

        return null;
      }
      if (kReleaseMode) {
        if (!Validate.fileExtensionRegExp.hasMatch((xFile.path))) {
          AppToast("InValid Image", isError: true);
          return null;
        }
      }

      return File(xFile.path);
    } catch (e) {
      AppToast("No image picked");

      return null;
    }
  }

  @override
  File resizeImage({required File file}) {
    final rawImage = image.decodeImage(file.readAsBytesSync());
    final resized = image.copyResize(rawImage!, width: 1080);
    final resizedImage = File("${file.absolute.path}.jpg");
    resizedImage.writeAsBytesSync(image.encodeJpg(resized));
    return resizedImage;
  }

  @override
  Future<File> compressImage({required File file}) async {
    XFile? compressed = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      "${file.absolute.path}comperssed.jpg",
      quality: 80,
    );
    return File(compressed!.path);
  }

  @override
  Future<FileProcessModel?> allImageProcess({bool isCamera = false}) async {
    File? imageXFile = await pickImage(isCamera: isCamera);

    if (imageXFile != null) {
      File resizedImage = resizeImage(file: File(imageXFile.path));
      File compressedImage = await compressImage(file: resizedImage);
      String imageBase64 = await convertFileToBase64(file: compressedImage);
      return FileProcessModel(
        file: imageBase64,
        fileName: (imageXFile.path).toString().split("/").last,
      );
    } else {
      return null;
    }
  }

  //MARK: Use Multiple pick process

  @override
  Future<List<File>> pickMultiImage({bool isCamera = false}) async {
    try {
      List<XFile> file = await ImagePicker().pickMultiImage();

      if (file.isEmpty) {
        AppToast("No image picked");

        return [];
      }
      return [...file.map((e) => File(e.path))];
    } catch (e) {
      AppToast("No image picked");

      return [];
    }
  }
  //Write Down

  //MARK: Comman Process

  @override
  Future<String> convertFileToBase64({required File file}) async {
    Uint8List bytes = await file.readAsBytes();
    return base64.encode(bytes);
  }

  // Future<FileProcessModel?> pickUpDialog() async {
  //   bool isLoading = false;
  //   FileProcessModel? file;
  //   await appDialog(
  //       isWithImage: false,
  //       title: "upload_your_document".tr(),
  //       height: 50,
  //       actions: [
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //           child: AppButton(
  //             onPressed: () async {
  //               file = await imagePickDialog();
  //               Navigator.pop(DawanaApp.navigatorKey.currentContext!);
  //             },
  //             title: "image".tr(),
  //             textColor: Colors.white,
  //            ),
  //         ),
  //         StatefulBuilder(builder: (context, setState) {
  //           return isLoading
  //               ? const LoadingItem()
  //               : Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                   child: ButtonItem(
  //                     onPressed: () async {
  //                       setState(() {
  //                         isLoading = true;
  //                       });
  //                       file = await allFileProcess();
  //                       setState(() {
  //                         isLoading = false;
  //                       });
  //                       Navigator.pop(DawanaApp.navigatorKey.currentContext!);
  //                     },
  //                     buttonText: "file".tr(),
  //                     textColor: Colors.white,
  //                     isSemiBold: true,
  //                   ),
  //                 );
  //         })
  //       ]);
  //   return file;
  // }

  Future<FileProcessModel?> imagePickDialog() async {
    bool isLoading = false;
    FileProcessModel? file;
    await showDialog(
      context: ShippioApp.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text("Picture"),
        content: Text("Upload your images"),
        actions: [
          StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: isLoading
                    ? const LoadingItem()
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: AppButton(
                              horizontalPadding: 15,
                              height: 40,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                file = await allImageProcess(isCamera: true);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(
                                  ShippioApp.navigatorKey.currentContext!,
                                );
                              },
                              title: "Camera",
                              textColor: Colors.white,
                            ),
                          ),
                          AppButton(
                            height: 40,

                            horizontalPadding: 15,
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              file = await allImageProcess(isCamera: false);
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.pop(
                                ShippioApp.navigatorKey.currentContext!,
                              );
                            },
                            title: "Gallery",
                            textColor: Colors.white,
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
    return file;
  }

  @override
  Future<FileProcessModel?> allDocumentProcess() async {
    return await imagePickDialog();
  }
}
