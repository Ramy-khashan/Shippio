import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trip_process_event.dart';
part 'trip_process_state.dart';

class TripProcessBloc extends Bloc<TripProcessEvent, TripProcessState> {
  TripProcessBloc() : super(TripProcessInitial()) {
    on<TripProcessEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
