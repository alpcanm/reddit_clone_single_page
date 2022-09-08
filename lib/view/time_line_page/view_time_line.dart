library view_time_line;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone_single_page/feature/controller/controller_post_list.dart';
import '../../core/consts/color_const.dart';
import '../../core/consts/size_const.dart';
import '../../feature/bloc/pagination_bloc.dart';
import '../components/c_card.dart';
import 'bloc/bottom_sheet_bloc.dart';

part '_time_line_body.dart';
part '_appbar.dart';

class _TimeLinePage extends StatelessWidget {
  const _TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginationBloc(),
      child: const _TimeLineBody(),
    );
  }
}

class ViewTimeLine extends StatelessWidget {
  const ViewTimeLine({super.key});

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    _TimeLinePage(),
    Text(
      'Second page',
      style: optionStyle,
    ),
    Text(
      'Message page',
      style: optionStyle,
    ),
    Text(
      'Profile page',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomSheetBloc = BottomSheetBloc();
    return Scaffold(
      appBar: const _AppBar(),
      backgroundColor: ColorConst.backgroundColor,
      body: BlocBuilder<BottomSheetBloc, BottomSheetState>(
        buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
        bloc: bottomSheetBloc,
        builder: (context, state) {
          return _widgetOptions.elementAt(state.currentIndex);
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomSheetBloc, BottomSheetState>(
        buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
        bloc: bottomSheetBloc,
        builder: (context, state) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "1",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.amp_stories,
                ),
                label: "2",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: "3",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "4",
              ),
            ],
            currentIndex: state.currentIndex,
            unselectedItemColor: ColorConst.backgroundColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorConst.activeBottomColor,
            onTap: (int index) {
              bottomSheetBloc.add(OnTapButton(index));
            },
          );
        },
      ),
    );
  }
}
