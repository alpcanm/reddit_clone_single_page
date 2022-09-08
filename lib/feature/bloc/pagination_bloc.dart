import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit_clone_single_page/feature/controller/controller_post_list.dart';

import '../repository/repository_post_list.dart';
import '../model/post_model.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(const PaginationState()) {
    on<PaginationFetch>(_onPaginationFetch);
    RepositoryPostList.instance.fetchPosts().then((value) => add(PaginationFetch()));
  }
  final ControllerPostList controllerPostList = ControllerPostList.instance;
  _onPaginationFetch(PaginationFetch event, Emitter<PaginationState> emit) {
    if (event.status == PaginationStatus.initial) {
      emit(
        state.copyWith(
          hasReachedMax: false,
          posts: [],
          status: PaginationStatus.initial,
          lastProductIndex: controllerPostList.getCurrentIndex,
        ),
      );
    }

    if (state.hasReachedMax) return;

    if (state.status == PaginationStatus.initial) {
      final newPosts = getPostList();
      if (newPosts.isNotEmpty) {
        return emit(
          state.copyWith(
            hasReachedMax: false,
            status: PaginationStatus.success,
            lastProductIndex: controllerPostList.getCurrentIndex,
            posts: newPosts,
          ),
        );
      } else {
        return emit(
          state.copyWith(status: PaginationStatus.failure),
        );
      }
    }

    final newPosts = getPostList();

    if (newPosts.isEmpty) {
      return emit(state.copyWith(hasReachedMax: true));
    } else {
      return emit(
        state.copyWith(
          status: PaginationStatus.success,
          hasReachedMax: false,
          posts: List.of(state.posts)..addAll(newPosts),
          lastProductIndex: controllerPostList.getCurrentIndex,
        ),
      );
    }
  }

  getPostList() => controllerPostList.fetchProducts(state.lastProductIndex);
}
