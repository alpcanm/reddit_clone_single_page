// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:reddit_clone_single_page/feature/model/post_model.dart';

import '../../core/consts/color_const.dart';
import '../../core/consts/padding_const.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    Key? key,
    required this.postModel,
  }) : super(key: key);
  final PostModel postModel;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int _numLines;

  @override
  void initState() {
    _numLines = '\n'.allMatches(widget.postModel.data.selftext).length + 1;
    super.initState();
  }

  final int maxLines = 3;
  bool _seeMoreActive = false;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorConst.cardColor,
      child: Column(
        children: [
          PaddingConst.paddingAll8(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.postModel.data.title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          _urlCheck(widget.postModel.data.thumbnail)
              ? Image.network(
                  widget.postModel.data.thumbnail,
                  fit: BoxFit.cover,
                )
              : const SizedBox(),
          Column(
            children: [
              PaddingConst.paddingAll8(
                child: Text(
                  widget.postModel.data.selftext,
                  overflow: _numLines > 8 ? TextOverflow.fade : TextOverflow.visible,
                  maxLines: !_seeMoreActive ? maxLines : null,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              _numLines >= 8
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _seeMoreActive = !_seeMoreActive;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaddingConst.paddingAll8(
                              child: const Text(
                            "See More",
                            style: TextStyle(color: ColorConst.seeMore, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }

  bool _urlCheck(url) {
    if (url.startsWith("https")) {
      return true;
    }
    return false;
  }
}
