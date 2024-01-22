import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future<int?> back(BuildContext context) async {
  logFirebaseEvent('Back_navigate_back');
  context.safePop();

  return null;
}
