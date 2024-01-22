import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'a_navigate_to_confirm_model.dart';
export 'a_navigate_to_confirm_model.dart';

class ANavigateToConfirmWidget extends StatefulWidget {
  const ANavigateToConfirmWidget({
    super.key,
    this.phoneNumber,
    this.email,
  });

  final String? phoneNumber;
  final String? email;

  @override
  _ANavigateToConfirmWidgetState createState() =>
      _ANavigateToConfirmWidgetState();
}

class _ANavigateToConfirmWidgetState extends State<ANavigateToConfirmWidget> {
  late ANavigateToConfirmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ANavigateToConfirmModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(currentUserDocument?.accpetedToTerms, false)) {
        logFirebaseEvent('a_Navigate_To_Confirm_navigate_to');

        context.pushNamed('Intro');
      } else {
        logFirebaseEvent('a_Navigate_To_Confirm_navigate_to');

        context.pushNamed(
          'a3Confirm-your-info',
          queryParameters: {
            'phoneNumber': serializeParam(
              widget.phoneNumber,
              ParamType.String,
            ),
            'email': serializeParam(
              widget.email,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (valueOrDefault<bool>(
                    currentUserDocument?.accpetedToTerms, false)) {
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed('Intro');
                } else {
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    'a3Confirm-your-info',
                    queryParameters: {
                      'phoneNumber': serializeParam(
                        widget.phoneNumber,
                        ParamType.String,
                      ),
                      'email': serializeParam(
                        widget.email,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }
              },
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minWidth: MediaQuery.sizeOf(context).width * 1.0,
                  minHeight: MediaQuery.sizeOf(context).height * 10.0,
                  maxWidth: 670.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
