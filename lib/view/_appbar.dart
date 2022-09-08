part of view_time_line;

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConst.transparent,
      centerTitle: true,
      title: const Text(
        "reddit",
        style: TextStyle(fontSize: SizeConst.size24),
      ),
    );
  }
}
