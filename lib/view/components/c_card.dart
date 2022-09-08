// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reddit_clone_single_page/feature/model/post_model.dart';

import '../../core/consts/color_const.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorConst.cardColor,
      child: Column(
        children: [
          Text(postModel.data!.title!),
          Text(postModel.data!.selftext!),
        ],
      ),
    );
  }
}
