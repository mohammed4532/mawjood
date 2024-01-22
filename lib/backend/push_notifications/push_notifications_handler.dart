import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/Colorful-Thunder-Tech-Mobile-Free-Logo-1.svg',
              width: MediaQuery.sizeOf(context).width * 0.8,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'ZZZa444phone_login': ParameterData.none(),
  'zzzzcreateAccount': ParameterData.none(),
  'court_addCourt': ParameterData.none(),
  'court_AddedSuccess': ParameterData.none(),
  'court_Details': (data) async => ParameterData(
        allParams: {
          'court': await getDocumentParameter<CourtsRecord>(
              data, 'court', CourtsRecord.fromSnapshot),
        },
      ),
  'f6_editProfile': ParameterData.none(),
  'zzzzzc7_changePassword': ParameterData.none(),
  'zzzregisterPage': ParameterData.none(),
  'zzzzverifyPhone': ParameterData.none(),
  'd1_home-client': (data) async => ParameterData(
        allParams: {
          'vendorFlag': getParameter<bool>(data, 'vendorFlag'),
        },
      ),
  'a1_first-page': ParameterData.none(),
  'a2phone_OTP-code': (data) async => ParameterData(
        allParams: {
          'phonenumber': getParameter<String>(data, 'phonenumber'),
        },
      ),
  'Loading': ParameterData.none(),
  'zzzzsignup-aftersignupwithemail': ParameterData.none(),
  'a3Confirm-your-info': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ZZZa4_fp_OTP-2-email': ParameterData.none(),
  'c3_email-OTP-2-email': ParameterData.none(),
  'c3_email-enter-your-phone': ParameterData.none(),
  'ZZZc5email_account-password': ParameterData.none(),
  'c1email_Enter-your-email': ParameterData.none(),
  'a4Accept-terms': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
          'email': getParameter<String>(data, 'email'),
          'name': getParameter<String>(data, 'name'),
          'type': getParameter<String>(data, 'type'),
          'location': getParameter<LatLng>(data, 'location'),
          'locationAddress': getParameter<String>(data, 'locationAddress'),
          'locationCity': getParameter<String>(data, 'locationCity'),
          'locationCountry': getParameter<String>(data, 'locationCountry'),
        },
      ),
  'Post': ParameterData.none(),
  'ZZZ_dffdfd': ParameterData.none(),
  'e1_home-vendor': ParameterData.none(),
  'd3_applications': ParameterData.none(),
  'f1_ccountSettings': ParameterData.none(),
  'f3_TermsAndService': ParameterData.none(),
  'f2_Help_Center': ParameterData.none(),
  'c4_phone_OTP-code': (data) async => ParameterData(
        allParams: {
          'phonenumber': getParameter<String>(data, 'phonenumber'),
        },
      ),
  'ZZZ_Card': ParameterData.none(),
  'f4_EarnbyProvidingservices': ParameterData.none(),
  'chattttttt': ParameterData.none(),
  'respon': ParameterData.none(),
  'f5_profile-client-settings': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'c2emailEnterYourPassword': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'a_Navigate_To_Confirm': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'd3_applicationsCopy': ParameterData.none(),
  'e1_home-vendorCopy': ParameterData.none(),
  'e3_Applytojobdetails': (data) async => ParameterData(
        allParams: {
          'jobDoc': await getDocumentParameter<JobsRecord>(
              data, 'jobDoc', JobsRecord.fromSnapshot),
        },
      ),
  'e3_Applytojobdetails2': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'AllChatsPage': ParameterData.none(),
  'Intro': ParameterData.none(),
  'd5_vendorActivity': ParameterData.none(),
  'layer': ParameterData.none(),
  'f1_ccountSettingsCopy': ParameterData.none(),
  'community': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
