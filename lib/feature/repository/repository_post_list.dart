import 'package:reddit_clone_single_page/feature/model/post_model.dart';

import '../network/service.dart';

class RepositoryPostList {
  static RepositoryPostList? _instance;
  RepositoryPostList._();
  static RepositoryPostList get instance => _instance ??= RepositoryPostList._();

  final List<PostModel> _tempList = [];

  List<PostModel> get allPosts => _tempList;

  addAll(List<PostModel> iterable) {
    _tempList.addAll(iterable);
  }

  Future<void> fetchPosts() async {
    final data = await PostService.getPosts();

    if (data != null) {
      final result = Parent1.fromJson(data);
      addAll(result.data!.children!);
    }
  }
}
