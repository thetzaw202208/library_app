import 'package:flutter/material.dart';
import 'package:library_app/blocs/search_page_bloc.dart';
import 'package:provider/provider.dart';

import '../constant/dimens.dart';
import '../data/vos/search_api_vos/items_vo/items_vo.dart';
import '../view_items/search_page_view_items.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPageBloc(),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kSBoxH40,
            const SearchItemView(),
            Selector<SearchPageBloc, List<ItemsVO>?>(
              selector: (_, selector) => selector.getItemList,
              builder: (_, itemList, __) =>
                  Expanded(child: SearchListView(items: itemList ?? [])),
            ),
          ],
        ),
      ),
    );
  }
}
