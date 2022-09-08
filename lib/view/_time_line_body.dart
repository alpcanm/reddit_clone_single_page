part of view_time_line;

class _TimeLineBody extends StatelessWidget {
  const _TimeLineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc, PaginationState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.posts.length,
          itemBuilder: (context, index) => const Card(),
        );
      },
    );
  }
}
