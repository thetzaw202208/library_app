import 'package:flutter/material.dart';
import 'package:library_app/blocs/home_page_bloc.dart';
import 'package:library_app/data/vos/home_screen_api_vos/lists_vo/lists_vo.dart';
import 'package:library_app/widgets/easy_asset_img_widget.dart';
import 'package:library_app/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/img_constant.dart';
import '../constant/strings.dart';
import '../view_items/home_page_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: Selector<HomePageBloc, List<ListsVO>>(
        selector: (_, bloc) => bloc.getListsList,
        builder: (context, value, child) => Scaffold(
          backgroundColor: kColorWhite,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kSBoxH40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSP15x),
                child: SizedBox(
                    // width: kTextFieldWidth350x,
                    height: kTextFieldHeight80x,
                    child: TextFieldWidget(
                      icon: const Icon(Icons.search),
                      text: kSearchHintText,
                    )),
              ),
              const SizedBox(
                height: kSP30x,
              ),
              const DefaultTabController(
                  length: 2,
                  child: TabBar(
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: kIndicatorLabelPadding),
                    //indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                    tabs: [Text(kEbooksText), Text(kAudioBooksText)],
                    isScrollable: true,
                    labelColor: kTabBarBlackColor,
                    indicatorColor: kIndicatorColor,
                  )),
              (value.isEmpty)
                  ? const Center(
                      child: EasyAssetIMGWidget(imgUrl: kNoDataIMG),
                    )
                  : BooksSessionItemView(
                      listsList: value,
                    ),
            ],
          ),
          //]
          // ),
        ),
      ),
    );
    //);
  }
}
