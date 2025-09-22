import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/app_button.dart';
import '../../../shippio_app.dart';
import 'dart:convert';

import '../../components/glassy_pop_up.dart';
import '../../components/loading_item.dart';
import '../../models/file_process_model.dart';
import '../../utils/functions/app_toast.dart';
 import '../../utils/functions/validate.dart';
part 'file_process_impl.dart';

abstract class FileProcess {
  // Future<File?> pickFile();
  Future<File?> pickImage({required bool isCamera});
  Future<List<File>> pickMultiImage();
  File resizeImage({required File file});
  Future<File> compressImage({required File file});
  Future<String> convertFileToBase64({required File file});
  Future<FileProcessModel?> allDocumentProcess();
  Future<FileProcessModel?> allImageProcess({bool isCamera});
  // Future<FileProcessModel?> allFileProcess();
}
