import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'd3_applications_widget.dart' show D3ApplicationsWidget;
import 'package:flutter/material.dart';

class D3ApplicationsModel extends FlutterFlowModel<D3ApplicationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
