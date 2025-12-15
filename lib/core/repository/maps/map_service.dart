import 'package:flutter/material.dart';
 
import '../../models/google_map_model.dart';

abstract class MapService {
  Widget buildMap({
    required Function(PositionModel) onTap,
     Set<MarkerModel> markers = const {},
    Set<PolylineModel> polylines = const {},
  });

  void moveTo(PositionModel position);
}
