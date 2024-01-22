import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String getMapUrl(LatLng? location) {
  return 'https://www.google.com/maps/search/?api=1&'
      'query=${location!.latitude},${location!.longitude}';
}

String getAverageRating(List<CommentsRecord>? comments) {
  if (comments!.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final comment in comments) {
    ratingsSum += comment.courtQualityRating;
  }
  return '${(ratingsSum / comments.length).toStringAsFixed(1)}';
}

LatLng getInitialMapLocation(List<LatLng>? userLocation) {
  if (userLocation == null || userLocation.isEmpty) {
    // If the list is null or empty, return the default location.
    return LatLng(40.8295538, -73.9386429);
  } else if (userLocation.length == 1) {
    // If there is only one location in the list, return that location.
    return userLocation[0];
  } else {
    // Calculate the average of all the locations in the list.
    double sumLat = 0;
    double sumLng = 0;

    for (LatLng location in userLocation) {
      sumLat += location.latitude;
      sumLng += location.longitude;
    }

    double averageLat = sumLat / userLocation.length;
    double averageLng = sumLng / userLocation.length;

    return LatLng(averageLat, averageLng);
  }

  // if (userLocation == null ||
  //     (userLocation.latitude == 0 && userLocation.longitude == 0)) {
  //   return LatLng(40.8295538, -73.9386429);
  // }
  // return userLocation;
}

bool showErrorForPasswordConfimation(
  String p1,
  String p2,
) {
  return p2.isEmpty && p1 != p2;
}

List<DocumentReference> getUsersOfTheChat(
  DocumentReference user1,
  DocumentReference user2,
) {
  return [user1, user2];
}

List<LatLng>? getLocationsFromCourts(List<CourtsRecord>? documents) {
  if (documents == null) {
    return null; // Handle the case where documents is null
  }

  List<LatLng> latLngList = [];

  for (CourtsRecord document in documents) {
    LatLng? location =
        document.location; // Assuming the field name is 'location'
    if (location != null) {
      latLngList.add(location);
    }
  }

  return latLngList;
}
