import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/post_model.dart';
part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(const PaginationState()) {
    on<PaginationFetch>(_onPaginationFetch);
  }

  _onPaginationFetch(PaginationFetch event, Emitter<PaginationState> emit) {}
}
