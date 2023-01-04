import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(
              8,
            )),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}

Widget customAppBar(
    {required String title, icon, required void Function()? onPressed}) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 28),
      ),
      const Spacer(),
      customIcon(icon: icon, onPressed: onPressed),
    ],
  );
}

Widget customIcon(
    {required IconData icon, required void Function()? onPressed}) {
  return Container(
    height: 46,
    width: 46,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16)),
    child: Center(
      child: IconButton(
          icon: Icon(
            icon,
            size: 28,
          ),
          onPressed: onPressed),
    ),
  );
}
