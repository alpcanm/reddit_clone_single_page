part of 'pagination_bloc.dart';

enum PaginationStatus { initial, success, failure }

class PaginationState extends Equatable {
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.posts = const <PostModel>[],
    this.hasReachedMax = false,
    this.lastProductIndex = 0,
  });

  final PaginationStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;
  final int lastProductIndex;

  PaginationState copyWith({
    PaginationStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
    int? lastProductIndex,
  }) {
    return PaginationState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastProductIndex: lastProductIndex ?? this.lastProductIndex,
    );
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax, lastProductIndex];
}
