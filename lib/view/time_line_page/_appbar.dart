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
      backgroundColor: ColorConst.cardColor,
      centerTitle: true,
      leading: const Icon(
        Icons.edit,
        color: ColorConst.backgroundColor,
      ),
      actions: const [
        Icon(
          Icons.menu,
          color: ColorConst.backgroundColor,
        ),
        SizedBox(
          width: 16,
        )
      ],
      title: const Text(
        "reddit",
        style: TextStyle(
          fontSize: SizeConst.size24,
          color: Colors.black,
        ),
      ),
    );
  }
}
