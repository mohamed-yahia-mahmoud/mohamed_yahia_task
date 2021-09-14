//

import 'dart:collection';
import 'dart:convert';
import 'dart:io';


 import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';
import 'package:mohamed_yahia_task/components/MyPropertyItem.dart';
import 'package:mohamed_yahia_task/network/model/PropertyModel.dart';
import 'package:mohamed_yahia_task/network/response/GetAllProperitiesResponse.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:toast/toast.dart';

part 'HomeMobx.g.dart';


class HomeController = HomeMobx with _$HomeController;

abstract class HomeMobx with Store {

  final url = "https://staging28.justpack.app/justpack-rest-api/public/properties/list";
  final client = http.Client();
  final encoder = JsonEncoder.withIndent("  ");



  @observable
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  @observable
  int current = 0;

  @observable
  int index=0;

  @observable
  String name;

  @observable
  List<Widget> imageSliders =new List();


  @observable
  GetAllProperitiesResponse getAllProperitiesResponse;

  @observable
  var myProperties = ObservableList<ProperityModel>();

  @observable
  List<String> myImgs = new List();

  @action
  Future<GetAllProperitiesResponse> newRequestsMethod(
      {  Function() doAfterSuccess, BuildContext context}) {

    return client.get(url).then((http.Response response) {
      try{
        final data = json.decode(response.body);
        getAllProperitiesResponse = GetAllProperitiesResponse.fromJson(data);

          debugPrintSynchronously(encoder.convert(data));
          myProperties.clear();
          myProperties.addAll(getAllProperitiesResponse.data);
        print('${myProperties}');

        for(int i=0;i<myProperties.length;i++){
          myImgs.add(myProperties[i].image);
          print('${myProperties[i].image}');
        }
        imageSliders=myImgs.map((element) => MyPropertyItem).cast<Widget>().toList();



      } on Exception catch (exception) {
        print("my exception $exception");
      } catch (error) {

      }

      return getAllProperitiesResponse;
    });




  }


  @action
  void getNewRequests({BuildContext context}) {

    newRequestsMethod(
        context: context,
        doAfterSuccess: () {
          myProperties.clear();
          myProperties.addAll(getAllProperitiesResponse.data);
        });

  }


  void dioGetNewProperties( BuildContext context)async{
    try {
      Dio dio = new Dio();
      print("Get " + url );
      var response = await dio.get(url);

      if (response!=null&&response.statusCode==200)   {

       print("my data  ${response.data}");
       getAllProperitiesResponse = GetAllProperitiesResponse.fromJson(response.data);
       print("my data  ${getAllProperitiesResponse.data}");
       myProperties.clear();
       myProperties.addAll(getAllProperitiesResponse.data);
       for(int i=0;i<myProperties.length;i++){
         myImgs.add(myProperties[i].image);
       }
       imageSliders=myImgs.map((element) => MyPropertyItem).cast<Widget>().toList();

      }else {
        Toast.show("there is no new surveys", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
        print("fom else not 200");
      }

    }on DioError catch (e) {
        myProperties.clear();
        Toast.show(e.message, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
    }
  }







}