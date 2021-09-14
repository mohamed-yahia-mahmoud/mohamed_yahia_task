
import 'package:json_annotation/json_annotation.dart';
import 'package:mohamed_yahia_task/network/model/PropertyModel.dart';
part 'GetAllProperitiesResponse.g.dart';


@JsonSerializable()
class GetAllProperitiesResponse{

   List<ProperityModel> data ;


   GetAllProperitiesResponse({
     this.data,
   });


  factory GetAllProperitiesResponse.fromJson(var json) => _$GetAllProperitiesResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetAllProperitiesResponseToJson(this);

}