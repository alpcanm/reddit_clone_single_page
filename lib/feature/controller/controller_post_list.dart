import 'package:reddit_clone_single_page/feature/model/post_model.dart';

import '../repository/repository_post_list.dart';

class ControllerPostList {
  static ControllerPostList? _instance;
  ControllerPostList._();
  static ControllerPostList get instance => _instance ??= ControllerPostList._();
  final tempList = RepositoryPostList.instance;
  final List<PostModel> _postModelList = [];

  List<PostModel> fetchProducts(int index) {
    _postModelList.clear();

    if (tempList.allPosts.length == index) {
      return _postModelList;
    }

    for (int i = 0; i < piece; i++) {
      if (tempList.allPosts.length == _currentIndex) {
        return _postModelList;
      }
      add(tempList.allPosts[_currentIndex]);
    }

    return _postModelList;
  }

  int piece = 2;
  int _currentIndex = 0;

  void zeroCurrentIndex() {
    _currentIndex = 0;
  }

  int get getCurrentIndex => _currentIndex;

  void increaseIndex() {
    _currentIndex++;
  }

  add(PostModel value) {
    _postModelList.add(value);
    increaseIndex();
  }
}
