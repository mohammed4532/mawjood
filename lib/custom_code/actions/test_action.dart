// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<LatLng>> testAction(List<CourtsRecord>? documents) async {
  List<LatLng> latLngList = [];

  if (documents == null) {
    return latLngList; // Handle the case where documents is null
  }

  for (CourtsRecord document in documents) {
    LatLng? location =
        document.location; // Assuming the field name is 'location'
    if (location != null) {
      latLngList.add(location);
    }
  }

  return latLngList;
}
