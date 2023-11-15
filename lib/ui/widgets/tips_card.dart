import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/app_theme.dart';

class CookingTipsCardCustom extends StatelessWidget {

  final String tips;
  final String imgUrl;
  final String urlWeb;

  const CookingTipsCardCustom({Key? key, required this.tips, required this.imgUrl, required this.urlWeb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        launch(urlWeb);
      },

      child: Container(
        width: 155,
        height: 176,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),

        child: Column(
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                imgUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),


            const SizedBox(
              height: 12,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                tips,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
