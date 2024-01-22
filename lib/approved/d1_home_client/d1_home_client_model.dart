import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'd1_home_client_widget.dart' show D1HomeClientWidget;
import 'package:flutter/material.dart';

class D1HomeClientModel extends FlutterFlowModel<D1HomeClientWidget> {
  ///  Local state fields for this page.

  String? currentDocName = 'court';

  bool vendorState = false;

  String text = '';

  LatLng? mapCenter;

  List<CourtsRecord> kjhkj = [];
  void addToKjhkj(CourtsRecord item) => kjhkj.add(item);
  void removeFromKjhkj(CourtsRecord item) => kjhkj.remove(item);
  void removeAtIndexFromKjhkj(int index) => kjhkj.removeAt(index);
  void insertAtIndexInKjhkj(int index, CourtsRecord item) =>
      kjhkj.insert(index, item);
  void updateKjhkjAtIndex(int index, Function(CourtsRecord) updateFn) =>
      kjhkj[index] = updateFn(kjhkj[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for courtSearchField widget.
  FocusNode? courtSearchFieldFocusNode;
  TextEditingController? courtSearchFieldController;
  String? Function(BuildContext, String?)? courtSearchFieldControllerValidator;
  List<CourtsRecord> simpleSearchResults = [];
  // Algolia Search Results from action on IconButton
  List<CourtsRecord>? algoliaSearchResults = [];
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // Stores action output result for [Custom Action - testAction] action in Column widget.
  List<LatLng>? loc1;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // Stores action output result for [Custom Action - testAction] action in Column widget.
  List<LatLng>? loc2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered3 = false;
  // Stores action output result for [Custom Action - testAction] action in Column widget.
  List<LatLng>? loc3;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered4 = false;
  // Stores action output result for [Custom Action - testAction] action in Column widget.
  List<LatLng>? loc4;
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    courtSearchFieldFocusNode?.dispose();
    courtSearchFieldController?.dispose();

    navbarModel.dispose();
  }

  /// Action blocks are added here.

  Future conditinalPage(BuildContext context) async {
    if (vendorState == true) {
      logFirebaseEvent('conditinalPage_navigate_to');

      context.pushNamed('d1_home-client');
    }
  }

  /// Additional helper methods are added here.
}
