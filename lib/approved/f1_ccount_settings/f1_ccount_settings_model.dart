import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f1_ccount_settings_widget.dart' show F1CcountSettingsWidget;
import 'package:flutter/material.dart';

class F1CcountSettingsModel extends FlutterFlowModel<F1CcountSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
