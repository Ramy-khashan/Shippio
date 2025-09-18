part of 'navigation_bar_bloc.dart';

sealed class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends NavigationBarEvent {
  final int selectedPageIndex;

  const ChangePageEvent({required this.selectedPageIndex});
}
