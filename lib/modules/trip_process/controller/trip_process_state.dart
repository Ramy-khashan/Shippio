part of 'trip_process_bloc.dart';

sealed class TripProcessState extends Equatable {
  const TripProcessState();
  
  @override
  List<Object> get props => [];
}

final class TripProcessInitial extends TripProcessState {}
