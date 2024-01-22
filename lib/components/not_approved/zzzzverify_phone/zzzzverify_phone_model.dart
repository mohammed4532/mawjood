import '/flutter_flow/flutter_flow_util.dart';
import 'zzzzverify_phone_widget.dart' show ZzzzverifyPhoneWidget;
import 'package:flutter/material.dart';

class ZzzzverifyPhoneModel extends FlutterFlowModel<ZzzzverifyPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SmsCodeTextField widget.
  FocusNode? smsCodeTextFieldFocusNode;
  TextEditingController? smsCodeTextFieldController;
  String? Function(BuildContext, String?)? smsCodeTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    smsCodeTextFieldFocusNode?.dispose();
    smsCodeTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
