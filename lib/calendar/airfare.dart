///Dart imports
import 'dart:math';

///Package imports
import 'package:flutter/material.dart';
import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:mohamed_yahia_task/model/sample_view.dart';
import 'package:mohamed_yahia_task/screens/Details.dart';
import 'package:provider/provider.dart';

///calendar import
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// core import
import 'package:syncfusion_flutter_core/core.dart';

/// Smallest fare value
const String _kBestPrice = r'$100.17';

/// Widget of air fare calendar
class AirFareCalendar extends SampleView {

  @override
  _AirFareCalendarCalendarState createState() =>
      _AirFareCalendarCalendarState();
}

class _AirFareCalendarCalendarState extends SampleViewState {

  final VoidCallback onPressed;

  _AirFareCalendarCalendarState({
     this.onPressed,
   });

  HomeMobx con;

   CalendarController _controller2;

  final DateTime _minDate = DateTime(2021,10,1);
  final DateTime _maxDate=DateTime(2021,11,30);

  /// Global key used to maintain the state, when we change the parent of the
  /// widget
  final GlobalKey _globalKey = GlobalKey();
    double _screenHeight;
    Orientation _deviceOrientation;

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      con.controller2 = CalendarController();

       con.addFareDataDetails();
       con.addAirFareData();
       setState(() {

       });
    });
     super.initState();
  }






  @override
  @override
  void didChangeDependencies() {
    _deviceOrientation = MediaQuery.of(context).orientation;
    _screenHeight = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    con=Provider.of<HomeMobx>(context);

    final Widget calendar = Theme(

        /// The key set here to maintain the state,
        ///  when we change the parent of the widget
        key: _globalKey,
        data: ThemeData.light(),
        child: _getAirFareCalendar());

    return Scaffold(
      body:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Expanded(
          child: Container(color: model.cardThemeColor, child: calendar),
        )
      ]),
    );
  }

  /// Returns the calendar widget based on the properties passed.
  SfCalendar _getAirFareCalendar() {
    return SfCalendar(
      showNavigationArrow: model.isWebFullView,
      view: CalendarView.month,
      controller: con.controller2 ,
      monthCellBuilder: _monthCellBuilder,
      showDatePickerButton: false,
      minDate: _minDate,
      maxDate: _maxDate,
     onTap: (CalendarTapDetails details){

         DateTime date = details.date;
         if(con.checkInTapped){

             con.startDate=date;
             print('start date  ${date.toString()}');
             con.checkInTapped=false;
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                     builder: (BuildContext context) => Details()));

         }else if(con.checkOutTapped){

             con.endDate=date;
             print('start date  ${date.toString()}');
             con.amount=0;
             con.calcAmount();
             con.checkOutTapped=false;
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                     builder: (BuildContext context) => Details()));

         }


       },
    );
  }

  /// Returns the builder for month cell.
  Widget _monthCellBuilder(
      BuildContext buildContext, MonthCellDetails details) {


    final bool isToday = isSameDate(details.date, DateTime.now());

    final bool isStartDay = isSameDate(details.date, con.startDate);
    final bool isEndDay = isSameDate(details.date, con.endDate);

     final AirFare airFare = con.airFareDataCollection!=null&&con.airFareDataCollection.isNotEmpty?
    details.date==_minDate?con.airFareDataCollection[1]:
        details.date==_maxDate?con.airFareDataCollection[60  ]:
            details.date.isAfter(_minDate)&& details.date.isBefore(_maxDate)?
            con.airFareDataCollection[details.date.difference(_minDate).inDays]:
            AirFare(''):AirFare('');
    final Color defaultColor =
        model.themeData != null && model.themeData.brightness == Brightness.dark
            ? Colors.white
            : Colors.black54;
     final bool isDisabledDate =
        details.date.isBefore(_minDate) || details.date.isAfter(_maxDate)&& !isSameDate(details.date, _minDate);

    final bool isInPeriod =con.endDate!=null? details.date.isBefore(con.endDate) && details.date.isAfter(con.startDate)&& !con.isStartDay && !con.isEndDay:false;

    return Container(
      decoration:  isStartDay?BoxDecoration(
        borderRadius:  isStartDay? BorderRadius.only(topLeft: Radius.circular(25),bottomLeft:  Radius.circular(25) )
            : null,
          border: ! isStartDay? Border(
            top: BorderSide(width: 0.1, color: defaultColor),
            left: BorderSide(width: 0.1, color: defaultColor),
          ):null,
          color: isDisabledDate
              ? Colors.grey.withOpacity(0.1)
                  :  isStartDay|| isEndDay&&!isInPeriod?Colors.green: isInPeriod?Colors.green.withOpacity(.4):null):
      BoxDecoration(
          borderRadius: isEndDay? BorderRadius.only(topRight: Radius.circular(25),bottomRight:  Radius.circular(25) ) :null,
          border: ! isEndDay? Border(
            top: BorderSide(width: 0.1, color: defaultColor),
            left: BorderSide(width: 0.1, color: defaultColor),
          ):null,
          color: isDisabledDate
              ? Colors.grey.withOpacity(0.1)
              :  isStartDay|| isEndDay?Colors.green: isInPeriod?Colors.green.withOpacity(.4):null),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  details.date.day.toString(),
                  style: TextStyle(
                      color: isToday
                          ? model.backgroundColor
                          : isDisabledDate
                              ? Colors.grey
                              : null,
                      fontWeight: isToday ? FontWeight.bold : null),
                ),
                if (!model.isMobileResolution && airFare.fare == _kBestPrice)
                  Text(
                    'Best Price',
                    style: TextStyle(
                        color: isDisabledDate ? Colors.grey : Colors.green),
                  )
                else
                  const Text('')
              ],
            ),
          ),
          Text(
            airFare.fare,
            style: TextStyle(
                fontSize: model.isMobileResolution ? 9 : 15,
                color: const Color.fromRGBO(42, 138, 148, 1),
                fontWeight: FontWeight.bold),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,
          //   children: <Widget>[
          //     Transform.rotate(
          //       angle: -pi / 4,
          //       child: Text(
          //         '\u2708',
          //         style: TextStyle(
          //             color: airFare.color,
          //             fontFamily: 'Roboto',
          //             fontSize: !model.isMobileResolution ? 20 : 14),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //     if (!model.isMobileResolution)
          //       Text(airFare.airline)
          //     else
          //       const Text('')
          //   ],
          // )
        ],
      ),
    );
  }
}

/// Object to hold the air fare data.
class AirFare {
  /// Holds the data of air fares
  const AirFare(this.fare,    );

  /// holds the string fare data
  final String fare;


}
