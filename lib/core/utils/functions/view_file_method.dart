import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/router/router_keys.dart';
import '../../models/file_process_model.dart';

viewFileMethod({
  required BuildContext context,
  required FileProcessModel file,
}) {
  context.pushNamed(
    RouterKeys.viewFile,
    extra: {"file": file.file, "name": file.fileName},
  );
}
