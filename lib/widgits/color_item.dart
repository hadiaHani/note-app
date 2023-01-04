import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({Key? key, required this.isActive, required this.color})
      : super(key: key);

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;

                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                setState(() {});
              },
              child: ColorsItem(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 6,
            );
          },
          itemCount: kColors.length),
    );
  }
}
