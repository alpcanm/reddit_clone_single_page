part of 'bottom_sheet_bloc.dart';

class BottomSheetState extends Equatable {
  const BottomSheetState({this.currentIndex = 0});
  final int currentIndex;
  @override
  List<Object> get props => [currentIndex];
}
