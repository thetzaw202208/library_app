import 'package:hive/hive.dart';
import 'package:library_app/data/vos/home_screen_api_vos/lists_vo/lists_vo.dart';
import 'package:library_app/network/data_agent/library_app_data_agent_impl.dart';

import '../../constant/api_constant.dart';
import '../../constant/hive_constant.dart';
import '../../network/data_agent/library_app_data_agent.dart';
import 'lists_dao.dart';

class ListsDAOImpl extends ListsDAO {
  ListsDAOImpl._();
  static final ListsDAOImpl _singleton = ListsDAOImpl._();
  factory ListsDAOImpl() => _singleton;

  final LibraryAppDataAgent _homePageDataAgent = LibraryAppDataAgentImpl();

  Box<ListsVO> _getListOfListsBox() => Hive.box<ListsVO>(kListOfListsBoxName);

  @override
  void save(List<ListsVO> listOfLists) {
    _homePageDataAgent.getListsVO(kPublishedDate);
    for (ListsVO lists in listOfLists) {
      _getListOfListsBox().put(lists.listName, lists);
    }
    print(
        "Your ListsVo are saved Successfully in DataBase------------------------------------------------->");
  }

  @override
  Stream watchListsBox() => _getListOfListsBox().watch();

  @override
  List<ListsVO>? getListOfListsFromDataBase(String publishedDate) =>
      _getListOfListsBox().values.toList();

  @override
  Stream<List<ListsVO>?> getListOfListsFromDataBaseStream(
          String publishedDate) =>
      Stream.value(getListOfListsFromDataBase(publishedDate));
}
