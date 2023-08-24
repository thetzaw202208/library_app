import 'package:hive/hive.dart';

import '../../../constant/hive_constant.dart';

@HiveType(typeId: kSearchHistoryTypeId)
class SearchHistoryVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? query;
}
