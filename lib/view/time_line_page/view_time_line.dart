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
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = BottomSheetBloc();
    return Scaffold(
      appBar: const _AppBar(),
      backgroundColor: ColorConst.backgroundColor,
      body: BlocBuilder<BottomSheetBloc, BottomSheetState>(
        bloc: bloc,
        builder: (context, state) {
          return Center(
            child: _widgetOptions.elementAt(state.currentIndex),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomSheetBloc, BottomSheetState>(
        bloc: bloc,
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            currentIndex: state.currentIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) {
              bloc.add(OnTapButton(index));
            },
          );
        },
      ),
    );
  }
}
