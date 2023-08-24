import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constant/hive_constant.dart';

part 'buy_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeForBuyLinkTypeId)
class BuyLinksVO {
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "url")
  @HiveField(1)
  String? url;

  BuyLinksVO({this.name, this.url});

  factory BuyLinksVO.fromJson(Map<String, dynamic> json) =>
      _$BuyLinksVOFromJson(json);

  Map<String, dynamic> toJson() => _$BuyLinksVOToJson(this);
}
