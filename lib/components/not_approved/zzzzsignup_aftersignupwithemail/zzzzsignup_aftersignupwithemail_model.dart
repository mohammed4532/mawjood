import '/flutter_flow/flutter_flow_util.dart';
import 'zzzzsignup_aftersignupwithemail_widget.dart'
    show ZzzzsignupAftersignupwithemailWidget;
import 'package:flutter/material.dart';

class ZzzzsignupAftersignupwithemailModel
    extends FlutterFlowModel<ZzzzsignupAftersignupwithemailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phonenumber-signup widget.
  FocusNode? phonenumberSignupFocusNode;
  TextEditingController? phonenumberSignupController;
  String? Function(BuildContext, String?)? phonenumberSignupControllerValidator;
  // State field(s) for password-signup widget.
  FocusNode? passwordSignupFocusNode;
  TextEditingController? passwordSignupController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)? passwordSignupControllerValidator;
  // State field(s) for passwordConfirm-signup widget.
  FocusNode? passwordConfirmSignupFocusNode;
  TextEditingController? passwordConfirmSignupController;
  late bool passwordConfirmSignupVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmSignupControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordSignupVisibility = false;
    passwordConfirmSignupVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    phonenumberSignupFocusNode?.dispose();
    phonenumberSignupController?.dispose();

    passwordSignupFocusNode?.dispose();
    passwordSignupController?.dispose();

    passwordConfirmSignupFocusNode?.dispose();
    passwordConfirmSignupController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
