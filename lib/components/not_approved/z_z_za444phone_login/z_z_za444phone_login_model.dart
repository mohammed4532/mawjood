import '/flutter_flow/flutter_flow_util.dart';
import 'z_z_za444phone_login_widget.dart' show ZZZa444phoneLoginWidget;
import 'package:flutter/material.dart';

class ZZZa444phoneLoginModel extends FlutterFlowModel<ZZZa444phoneLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
