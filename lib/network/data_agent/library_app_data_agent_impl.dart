import 'package:dio/dio.dart';
import 'package:library_app/data/vos/home_screen_api_vos/lists_vo/lists_vo.dart';
import 'package:library_app/data/vos/search_api_vos/items_vo/items_vo.dart';
import 'package:library_app/network/api/home_screen_api/home_screen_api.dart';
import 'package:library_app/network/api/search_api/search_api.dart';
import 'package:library_app/network/data_agent/library_app_data_agent.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/home_screen_api_vos/results_vo/results_vo.dart';

class LibraryAppDataAgentImpl extends LibraryAppDataAgent {
  late HomeScreenAPI _homeScreenAPI;

  late SearchAPI _searchAPI;

  LibraryAppDataAgentImpl._() {
    _homeScreenAPI = HomeScreenAPI(Dio());
    _searchAPI = SearchAPI(Dio());
  }

  static final LibraryAppDataAgentImpl _singleton = LibraryAppDataAgentImpl._();

  factory LibraryAppDataAgentImpl() => _singleton;

  // final ListsDAO _listsDAO=ListsDAOImpl();

  // @override
  // Future<List<BooksVO>?> getBooksVO(String publishedDate) async{
  //   List<BooksVO> result=[];
  //   final temp= await getListsVO(publishedDate);
  //   temp?.forEach((element) {
  //     result=element.books ?? [];
  //   });
  //   return result;
  // }

  @override
  Future<ResultsVO?> getResultsVO(String publishedDate) => _homeScreenAPI
          .getHomeScreenApiResponse(kPublishedDate, kApiKey)
          .asStream()
          .map((event) {
        return event.results;
      }).first;

  @override
  Future<List<ListsVO>?> getListsVO(String publishedDate) {
    return getResultsVO(publishedDate).then((value) {
      // var temp= value?.lists ?? [];
      // _listsDAO.save(temp);
      return value?.lists ?? [];
    });
  }

  @override
  Future<List<ItemsVO>?> getItemsVO(String search) {
    return _searchAPI
        .getSearchResponse(search)
        .asStream()
        .map((event) => event.items)
        .first;
  }
}
