part of 'package_history_details_bloc.dart';

sealed class PackageHistoryDetailsState extends Equatable {
  const PackageHistoryDetailsState();
  
  @override
  List<Object> get props => [];
}

final class PackageHistoryDetailsInitial extends PackageHistoryDetailsState {}
