import '/flutter_flow/flutter_flow_util.dart';
import 'c3_email_enter_your_phone_widget.dart' show C3EmailEnterYourPhoneWidget;
import 'package:flutter/material.dart';

class C3EmailEnterYourPhoneModel
    extends FlutterFlowModel<C3EmailEnterYourPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
