import 'package:flutter/material.dart';
import 'package:library_app/utils/extension.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/img_constant.dart';
import '../pages/search_page.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key? key, required this.icon, required this.text})
      : super(key: key);
  Icon icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        context.navigateToNextScreen(context, const SearchPage());
      },
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Container(
          padding: const EdgeInsets.only(right: kSP10x),
          width: kCircularImageWidth60x,
          height: kCircularImageHeight60x,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: kCircularImageRadius45x,
            backgroundImage: AssetImage(kProfileIMG),
          ),
        ),
        prefixIcon: icon,
        hintText: text,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: kTabBarBlackColor),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: kTabBarBlackColor)),
      ),
    );
  }
}
