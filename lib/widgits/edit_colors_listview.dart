import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgits/color_item.dart';

class EditColorsListView extends StatefulWidget {
  const EditColorsListView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditColorsListView> createState() => _EditColorsListView();
}

class _EditColorsListView extends State<EditColorsListView> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

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
                widget.note.color = kColors[index].value;
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
