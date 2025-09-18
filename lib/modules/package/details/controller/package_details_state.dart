part of 'package_details_bloc.dart';

class PackageDetailsState extends Equatable {
  const PackageDetailsState({
    this.heightMeasureType = "Inches",
    this.widthtMeasureType = "Inches",
    this.weightMeasureType = "Inches",
  });
  final String heightMeasureType;
  final String widthtMeasureType;
  final String weightMeasureType;

  @override
  List<Object> get props => [
    heightMeasureType,
    widthtMeasureType,
    weightMeasureType,
  ];
  PackageDetailsState copyWith({
    String? heightMeasureType,
    String? widthtMeasureType,
    String? weightMeasureType,
  }) => PackageDetailsState(
    heightMeasureType: heightMeasureType ?? this.heightMeasureType,
    widthtMeasureType: widthtMeasureType ?? this.widthtMeasureType,
    weightMeasureType: weightMeasureType ?? this.weightMeasureType,
  );
}
