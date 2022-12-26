import 'package:flutter/material.dart';

Widget notesViewBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        customAppBar(),
        Expanded(child: notesListView())
      ],
    ),
  );
}

Widget customAppBar() {
  return Row(
    children: [
      const Text(
        "Notes",
        style: TextStyle(fontSize: 28),
      ),
      const Spacer(),
      customSearchIcon(),
    ],
  );
}

Widget customSearchIcon() {
  return Container(
    height: 46,
    width: 46,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16)),
    child: const Center(
      child: Icon(
        Icons.search,
        size: 28,
      ),
    ),
  );
}

Widget noteItem() {
  return Container(
    padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
    decoration: BoxDecoration(
        color: const Color(0xff537D8D),
        borderRadius: BorderRadius.circular(16)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          title: const Text(
            "Flutter tips",
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
            ),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              )),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Build your career with tharwat samy",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.4),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "May 22 , 2022",
            style: TextStyle(
              color: Colors.black.withOpacity(.4),
            ),
          ),
        )
      ],
    ),
  );
}

Widget notesListView() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: noteItem(),
            )),
  );
}
