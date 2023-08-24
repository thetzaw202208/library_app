import 'package:flutter/material.dart';
import 'package:library_app/utils/extension.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';

class SearchMovieWidget extends StatelessWidget {
  const SearchMovieWidget(
      {super.key,
      this.isEnable = false,
      this.isAutoFocus = false,
      this.onChange,
      required this.controller});

  final bool isEnable;
  final bool isAutoFocus;
  final Function(String)? onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
      child: TextField(
        onChanged: (text) => onChange!(text),
        autofocus: isAutoFocus,
        enabled: isEnable,
        controller: controller,
        onSubmitted: (text) =>
            context.getSearchPageBlocInstance().saveHistory(text),
        decoration: const InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          hintText: kSearchHintText,
          hintStyle: TextStyle(color: kTabBarBlackColor),
          // suffixIcon: Icon(Icons.keyboard_voice),
        ),
      ),
    );
  }
}
