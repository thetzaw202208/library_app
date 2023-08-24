import 'package:flutter/material.dart';
import 'package:library_app/data/vos/home_screen_api_vos/books_vo/books_vo.dart';
import 'package:library_app/persistent/lists_dao/lists_dao_impl.dart';
import 'package:library_app/widgets/easy_Text_widget.dart';
import 'package:provider/provider.dart';

import '../blocs/library_page_bloc.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/img_constant.dart';
import '../constant/strings.dart';
import '../persistent/lists_dao/lists_dao.dart';
import '../widgets/easy_asset_img_widget.dart';
import '../widgets/text_field_widget.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListsDAO _listDAO = ListsDAOImpl();
    var temp =
        _listDAO.getListOfListsFromDataBase(kPublishedDate)?.where((event) {
      var temp = event.books;
      temp?.map((e) => e.isSelected);
      return false;
    }).toList();

    return ChangeNotifierProvider<LibraryPageBloc>(
      create: (context) => LibraryPageBloc(),
      child: Selector<LibraryPageBloc, List<BooksVO>>(
        selector: (_, bloc) => bloc.getFavoriteBooksList,
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            height: 600,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                kSBoxH40,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSP15x),
                  child: SizedBox(
                      //width: kTextFieldWidth350x,
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
                      tabs: [
                        EasyTextWidget(text: kYourBooksText),
                        EasyTextWidget(text: kYourShelvesText)
                      ],
                      isScrollable: true,
                      labelColor: kTabBarBlackColor,
                      indicatorColor: kIndicatorColor,
                    )),
                (value.isEmpty)
                    ? Center(
                        child: Column(
                          children: const [
                            EasyAssetIMGWidget(imgUrl: kNoDataIMG),
                            EasyTextWidget(text: kLibraryNoBooksText)
                          ],
                        ),
                      )
                    :
                    // SingleChildScrollView(child: BooksSessionItemView(value: temp ?? [],))
                    Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
