

import 'package:flutter/material.dart';

import 'calendar/RentingCalendar.dart';

/// Contains the output widget of sample
/// appropriate key and output widget mapped
Map<String, Function> getSampleWidget() {
  return <String, Function>{

    // Calendar Samples

     'air_fare_calendar': (Key key) => RentingCalendar(),



  };
}
