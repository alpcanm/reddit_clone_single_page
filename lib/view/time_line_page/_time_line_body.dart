part of view_time_line;

class _TimeLineBody extends StatelessWidget {
  const _TimeLineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc, PaginationState>(
      buildWhen: (previous, current) => previous.posts != current.posts,
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: SizeConst.size8),
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final result = PostCard(postModel: state.posts[index]);
              if (index == 0) {
                return Column(
                  children: [const _ClearButton(), result],
                );
              } else if (index == state.posts.length - 1) {
                return Column(
                  children: [result, const _MoreButton()],
                );
              } else {
                return result;
              }
            });
      },
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<PaginationBloc>().add(PaginationFetch(status: PaginationStatus.success));
        },
        child: const Text(
          "Daha Fazla",
          style: TextStyle(color: Colors.red),
        ));
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final controllerPostList = ControllerPostList.instance;
        context.read<PaginationBloc>().add(PaginationFetch(status: PaginationStatus.initial));
        controllerPostList.zeroCurrentIndex();
        controllerPostList.piece = 2;
      },
      child: const Text(
        "Sıfırlar",
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
