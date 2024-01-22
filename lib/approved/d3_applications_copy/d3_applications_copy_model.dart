import '/flutter_flow/flutter_flow_util.dart';
import 'd3_applications_copy_widget.dart' show D3ApplicationsCopyWidget;
import 'package:flutter/material.dart';

class D3ApplicationsCopyModel
    extends FlutterFlowModel<D3ApplicationsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
