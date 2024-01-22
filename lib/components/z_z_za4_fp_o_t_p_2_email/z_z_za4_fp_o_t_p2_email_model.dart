import '/flutter_flow/flutter_flow_util.dart';
import 'z_z_za4_fp_o_t_p2_email_widget.dart' show ZZZa4FpOTP2EmailWidget;
import 'package:flutter/material.dart';

class ZZZa4FpOTP2EmailModel extends FlutterFlowModel<ZZZa4FpOTP2EmailWidget> {
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
