

import 'package:flutter/material.dart';

import 'calendar/airfare.dart';
import 'calendar/heatmap.dart';

/// Contains the output widget of sample
/// appropriate key and output widget mapped
Map<String, Function> getSampleWidget() {
  return <String, Function>{

    // Calendar Samples

    'heat_map_calendar': (Key key) => HeatMapCalendar(key),
    'air_fare_calendar': (Key key) => AirFareCalendar(),



  };
}
