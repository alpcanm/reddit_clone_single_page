library view_time_line;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/consts/color_const.dart';
import '../../core/consts/size_const.dart';
import '../feature/bloc/pagination_bloc.dart';

part '_time_line_body.dart';
part '_appbar.dart';

class ViewTimeLine extends StatelessWidget {
  const ViewTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: BlocProvider(
        create: (context) => PaginationBloc(),
        child: const _TimeLineBody(),
      ),
    );
  }
}
