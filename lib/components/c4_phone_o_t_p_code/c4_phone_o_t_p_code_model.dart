import '/flutter_flow/flutter_flow_util.dart';
import 'c4_phone_o_t_p_code_widget.dart' show C4PhoneOTPCodeWidget;
import 'package:flutter/material.dart';

class C4PhoneOTPCodeModel extends FlutterFlowModel<C4PhoneOTPCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
