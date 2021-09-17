//

import 'dart:collection';
import 'dart:convert';
import 'dart:io';


 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:mobx/mobx.dart';
import 'package:mohamed_yahia_task/calendar/RentingCalendar.dart';
import 'package:mohamed_yahia_task/components/MyPropertyItem.dart';
import 'package:mohamed_yahia_task/network/model/PropertyModel.dart';
import 'package:mohamed_yahia_task/network/response/GetAllProperitiesResponse.dart';

 import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'HomeMobx.g.dart';


class HomeController = HomeMobx with _$HomeController;

abstract class HomeMobx with Store {

  final url = "https://staging28.justpack.app/justpack-rest-api/public/properties/list";
  final client = http.Client();
  final encoder = JsonEncoder.withIndent("  ");


  @observable
  int current = 0;

  @observable
  int index=0;

  @observable
  String name;

  @observable
  bool checkInTapped=false;

  @observable
  bool addCheckInDate=false;

  @observable
  bool sortingEnabled = false;

  @observable
  bool addCheckOutDate=false;

  @observable
  bool checkOutTapped=false;

  @observable
  bool isStartDay=false;

  @observable
  bool isEndDay=false;

  @observable
  DateTime startDate;

  @observable
  DateTime endDate;

  @observable
  int amount;

  @observable
  CalendarController controller2;

  @observable
  List<Widget> imageSliders;
  @observable
  DateTime minDate = DateTime(2021,10,1);
  @observable
  DateTime maxDate=DateTime(2021,11,30);

  @observable
   GetAllProperitiesResponse  getAllProperitiesResponse;

  @observable
  var myProperties = ObservableList<ProperityModel>();
  @observable
  var tempMyProperties = ObservableList<ProperityModel>();

  @observable
  List<String> myImgs = new List();
  @observable
  List<String> tempMyImgs = new List();
  @observable
  List<String> days = <String>[];
  @observable
  List<AirFare> airFareDataCollection = <AirFare>[];

  /// a fun to get remote data using http lib.
  @action
  Future<GetAllProperitiesResponse> newRequestsMethod(
      {  Function() doAfterSuccess, BuildContext context}) {

    return client.get(url).then((http.Response response) {
     try{
        final data = json.decode(response.body);
        getAllProperitiesResponse  = GetAllProperitiesResponse.fromJson(data);
          debugPrintSynchronously(encoder.convert(data));
          myProperties.clear();
          myProperties.addAll(getAllProperitiesResponse .data);
          tempMyProperties.addAll(getAllProperitiesResponse .data);


        for(int i=0;i<myProperties.length;i++){
          myImgs.add(myProperties[i].image);
          tempMyImgs.add(myProperties[i].image);
        }
        imageSliders=myImgs.map((element) => MyPropertyItem).cast<Widget>().toList();

      } on Exception catch (exception) {
        print("my exception $exception");
      } catch (error) {
      }
      return getAllProperitiesResponse ;
    });

  }



  /// Creates required prices data for each flat.
  @action
  void addFlatDataDetails() {
      days.clear();

      days.add( myProperties[current].prices.i10_01_2021.toString());
      days.add( myProperties[current].prices.i10022021.toString());
      days.add( myProperties[current].prices.i10032021.toString());
      days.add( myProperties[current].prices.i10042021.toString());
      days.add( myProperties[current].prices.i10052021.toString());
      days.add( myProperties[current].prices.i10062021.toString());
      days.add( myProperties[current].prices.i10072021.toString());
      days.add( myProperties[current].prices.i10082021.toString());
      days.add( myProperties[current].prices.i10092021.toString());
      days.add( myProperties[current].prices.i10102021.toString());
      days.add( myProperties[current].prices.i10112021.toString());
      days.add( myProperties[current].prices.i10122021.toString());
      days.add( myProperties[current].prices.i10132021.toString());
      days.add( myProperties[current].prices.i10142021.toString());
      days.add( myProperties[current].prices.i10152021.toString());
      days.add( myProperties[current].prices.i10162021.toString());
      days.add( myProperties[current].prices.i10172021.toString());
      days.add( myProperties[current].prices.i10182021.toString());
      days.add( myProperties[current].prices.i10192021.toString());
      days.add( myProperties[current].prices.i10202021.toString());
      days.add( myProperties[current].prices.i10212021.toString());
      days.add( myProperties[current].prices.i10222021.toString());
      days.add( myProperties[current].prices.i10232021.toString());
      days.add( myProperties[current].prices.i10242021.toString());
      days.add( myProperties[current].prices.i10252021.toString());
      days.add( myProperties[current].prices.i10262021.toString());
      days.add( myProperties[current].prices.i10272021.toString());
      days.add( myProperties[current].prices.i10282021.toString());
      days.add( myProperties[current].prices.i10292021.toString());
      days.add( myProperties[current].prices.i10302021.toString());
      days.add( myProperties[current].prices.i10312021.toString());

      days.add( myProperties[current].prices.i11022021.toString());
      days.add( myProperties[current].prices.i11022021.toString());
      days.add( myProperties[current].prices.i11032021.toString());
      days.add( myProperties[current].prices.i11042021.toString());
      days.add( myProperties[current].prices.i11052021.toString());
      days.add( myProperties[current].prices.i11062021.toString());
      days.add( myProperties[current].prices.i11072021.toString());
      days.add( myProperties[current].prices.i11082021.toString());
      days.add( myProperties[current].prices.i11092021.toString());
      days.add( myProperties[current].prices.i11102021.toString());
      days.add( myProperties[current].prices.i11112021.toString());
      days.add( myProperties[current].prices.i11122021.toString());
      days.add( myProperties[current].prices.i11132021.toString());
      days.add( myProperties[current].prices.i11142021.toString());
      days.add( myProperties[current].prices.i11152021.toString());
      days.add( myProperties[current].prices.i11162021.toString());
      days.add( myProperties[current].prices.i11172021.toString());
      days.add( myProperties[current].prices.i11182021.toString());
      days.add( myProperties[current].prices.i11192021.toString());
      days.add( myProperties[current].prices.i11202021.toString());
      days.add( myProperties[current].prices.i11212021.toString());
      days.add( myProperties[current].prices.i11222021.toString());
      days.add( myProperties[current].prices.i11232021.toString());
      days.add( myProperties[current].prices.i11242021.toString());
      days.add( myProperties[current].prices.i11252021.toString());
      days.add( myProperties[current].prices.i11262021.toString());
      days.add( myProperties[current].prices.i11272021.toString());
      days.add( myProperties[current].prices.i11282021.toString());
      days.add( myProperties[current].prices.i11292021.toString());
      days.add( myProperties[current].prices.i11302021.toString());

  }

  /// Creates the price of each day for a specific flat.
  @action
  void addDayFlatData() {
    airFareDataCollection = <AirFare>[];
    for (int i = 0; i < 61; i++) {
      String fare = days[i];
      airFareDataCollection.add(AirFare(fare));
    }
    startDate!=null&&endDate!=null?calcAmount():print("no selected ");
  }


  /// a fun for calculating the amount of many for a specific period.
  @action
  void calcAmount() {
      amount=0;
      int start= (61-(maxDate.difference(startDate).inDays.toInt())-1) ;
      int end = (61-(maxDate.difference(endDate).inDays.toInt()));

    for (int i = start; i < end; i++) {
       amount+=int.parse(days[i]);
       print(days[i]);
     }
  }

  /// a fun for converting a date time to a specific format.
  @action
  String formatter(DateTime date) {
    return  DateFormat('d/M/yyyy').format(date);
  }


  /// sorting function.
  @action
  void sortingDescinding() {

    /// for sorting descending.
    if(sortingEnabled){
      myProperties.sort((b, a) => a.nbBedrooms.compareTo(b.nbBedrooms));
      myImgs.clear();
      for(int i=0;i<myProperties.length;i++){
        myImgs.add(myProperties[i].image);
      }
      imageSliders=myImgs.map((element) => MyPropertyItem()).cast<Widget>().toList();
    }else{
      /// for removing the sorting filter.
      myProperties.clear();
      myProperties.addAll(tempMyProperties);
      myImgs=tempMyImgs;
     }

  }



}