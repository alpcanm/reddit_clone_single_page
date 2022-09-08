import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_sheet_event.dart';
part 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(const BottomSheetState()) {
    on<OnTapButton>(_onOntapButton);
  }

  _onOntapButton(OnTapButton event, Emitter<BottomSheetState> emit) {
    return emit(BottomSheetState(currentIndex: event.index));
  }
}
