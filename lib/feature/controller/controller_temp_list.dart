import 'package:reddit_clone_single_page/feature/model/post_model.dart';

class ControllerTempList {
  static ControllerTempList? _instance;
  ControllerTempList._();
  static ControllerTempList get instance => _instance ??= ControllerTempList._();

  final List<PostModel> _tempList = [];

  List<PostModel> get allPosts => _tempList;

  addAll(List<PostModel> iterable) {
    _tempList.addAll(iterable);
  }
}
