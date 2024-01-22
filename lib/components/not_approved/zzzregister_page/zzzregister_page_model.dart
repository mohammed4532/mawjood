import '/flutter_flow/flutter_flow_util.dart';
import 'zzzregister_page_widget.dart' show ZzzregisterPageWidget;
import 'package:flutter/material.dart';

class ZzzregisterPageModel extends FlutterFlowModel<ZzzregisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputNormal widget.
  FocusNode? inputNormalFocusNode;
  TextEditingController? inputNormalController;
  String? Function(BuildContext, String?)? inputNormalControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    inputNormalFocusNode?.dispose();
    inputNormalController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
