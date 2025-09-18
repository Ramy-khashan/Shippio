import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'package_history_details_event.dart';
part 'package_history_details_state.dart';

class PackageHistoryDetailsBloc extends Bloc<PackageHistoryDetailsEvent, PackageHistoryDetailsState> {
  PackageHistoryDetailsBloc() : super(PackageHistoryDetailsInitial()) {
    on<PackageHistoryDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
