import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// ================= POSITION =================
class PositionModel {
  late LatLng position;

  PositionModel({required double latitude, required double longitude})
    : position = LatLng(latitude, longitude);
  PositionModel.fromJson(LatLng latLng) {
    position = latLng;
  }
}

/// ================= MARKER =================
class MarkerModel {
  final Marker marker;

  const MarkerModel._(this.marker);

  factory MarkerModel({
    required String markerId,
    required PositionModel position,
    BitmapDescriptorModel? icon,
  }) {
    return MarkerModel._(
      Marker(
        markerId: MarkerId(markerId),
        position: position.position,
        icon: icon == null
            ? BitmapDescriptor.defaultMarker
            : icon.bitmapDescriptor,
      ),
    );
  }

  MarkerId get markerId => marker.markerId;
  LatLng get position => marker.position;
}

/// ================= POLYLINE =================
class PolylineModel {
  late Polyline polyline;

  PolylineModel({required Polyline polylineValue}) : polyline = polylineValue;
  PolylineModel.fromPolyline({
    required String path,
    required Color color,
    required List<PointLatLng> polylinePoints,
  }) {
    polyline = Polyline(
      startCap: Cap.roundCap,
      polylineId: PolylineId(path),
      color: color,
      width: 6,
      points: polylinePoints
          .map((val) => LatLng(val.latitude, val.longitude))
          .toList(),
    );
  }
}

/// ================= BITMAP DESCRIPTOR =================
class BitmapDescriptorModel {
  final BitmapDescriptor bitmapDescriptor;

  const BitmapDescriptorModel(this.bitmapDescriptor);
  static Future<AssetMapBitmap> updateImage({
    required String icon,
    Size? size,
  }) async {
    return await BitmapDescriptor.asset(ImageConfiguration(size: size), icon);
  }
}

/// ================= LAT LNG BOUNDS =================

class LatLngBoundsModel {
  final PositionModel northEast;
  final PositionModel southWest;

  const LatLngBoundsModel({required this.northEast, required this.southWest});

  LatLngBounds toGoogle() => LatLngBounds(
    northeast: LatLng(
      northEast.position.latitude,
      northEast.position.longitude,
    ),
    southwest: LatLng(
      southWest.position.latitude,
      southWest.position.longitude,
    ),
  );
}
