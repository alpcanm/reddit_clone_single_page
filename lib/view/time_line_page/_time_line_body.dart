part of view_time_line;

class _TimeLineBody extends StatelessWidget {
  const _TimeLineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationBloc, PaginationState>(
      builder: (context, state) {
        return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            shrinkWrap: true,
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final result = Column(
                children: [Text(index.toString()), PostCard(postModel: state.posts[index])],
              );

              if (index == state.posts.length - 1) {
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
          context.read<PaginationBloc>().add(PaginationFetch());
        },
        child: const Text(
          "Daha Fazla",
          style: TextStyle(color: Colors.red),
        ));
  }
}
