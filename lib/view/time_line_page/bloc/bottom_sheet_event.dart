// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_sheet_bloc.dart';

abstract class BottomSheetEvent extends Equatable {
  const BottomSheetEvent();

  @override
  List<Object> get props => [];
}

class OnTapButton extends BottomSheetEvent {
  final int index;
  const OnTapButton(this.index);
}
