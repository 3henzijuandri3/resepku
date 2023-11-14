import 'package:flutter/material.dart';

import '../../shared/app_theme.dart';

class filledButtonCustom extends StatelessWidget{
  final double width;
  final double height;
  final String label;
  final Function onTap;

  const filledButtonCustom({
    Key? key,
    required this.width,
    required this.height,
    required this.label,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: TextButton(
        onPressed: () => onTap(),

        style: TextButton.styleFrom(
          backgroundColor: yellowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),

        child: Text(
          label,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }

}