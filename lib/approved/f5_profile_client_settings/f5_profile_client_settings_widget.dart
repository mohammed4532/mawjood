import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'f5_profile_client_settings_model.dart';
export 'f5_profile_client_settings_model.dart';

class F5ProfileClientSettingsWidget extends StatefulWidget {
  const F5ProfileClientSettingsWidget({
    super.key,
    required this.uid,
  });

  final String? uid;

  @override
  _F5ProfileClientSettingsWidgetState createState() =>
      _F5ProfileClientSettingsWidgetState();
}

class _F5ProfileClientSettingsWidgetState
    extends State<F5ProfileClientSettingsWidget> {
  late F5ProfileClientSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => F5ProfileClientSettingsModel());

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

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.uid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFF1F4F8),
            body: Center(
              child: LinearProgressIndicator(
                color: Color(0xFF14668B),
              ),
            ),
          );
        }
        List<UsersRecord> f5ProfileClientSettingsUsersRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final f5ProfileClientSettingsUsersRecord =
            f5ProfileClientSettingsUsersRecordList.isNotEmpty
                ? f5ProfileClientSettingsUsersRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFF1F4F8),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 220.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.network(
                      'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAM4AAAB0CAMAAAD6kP3lAAAAA1BMVEWiz/5r4aBOAAAALklEQVR4nO3BMQEAAADCoPVP7W8GoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAeANdzAABA/erPwAAAABJRU5ErkJggg==',
                    ).image,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('Icon_navigate_back');
                              context.pop();
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context).white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 76.0,
                                      height: 76.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          f5ProfileClientSettingsUsersRecord
                                              ?.photoUrl,
                                          'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIUAAACFCAMAAABCBMsOAAAAYFBMVEX///8AAAD8/PyDg4MEBAT5+fkICAj09PTq6uoVFRVdXV3m5uY3NzfCwsK3t7eKiopvb28/Pz8QEBCjo6PQ0NAfHx9UVFRmZmaZmZnb29swMDB9fX1JSUkpKSl3d3fKysqS0q6fAAADaUlEQVR4nO2Zi3KqMBCGk0hIQAW5eaPK+7/l2U3EcpRyxIZt58z+nbZORs3HXrKbRAgWi8VisVgsFovFYrFYrP9RSiiFv/Dic8CPUZPAhMpuq7zNq61VfoAaQSths0MivZJDZgWMkYIooYXJUpw/cj+gNDMwSokBEWByeYOIbxgyN4rUGACxk8/aGTIKnEcjRPTAECGGvr1jeQgIzGMk4ydTxDI6EmUKBKYWNUz4aAqJQ3EtSBYNlx47mPEJww3taBIFHd8lT0HRh0bS3d6zsMAY+SiCV06zZihhigmKwtCYQthygkJaokztpiBktzyDq5zbSYotkS2ySYqMZPEUv8EWoNMkxYkCAXPkPAFxtkQU+jBBcSBYLXwdqbB+jtVUGKsESQsMU6yLsZLqimphFcXaiSUVjFGO2qIEU2jsP5aW23mY9LnVciOpUSQecXOoejMamptakdR1Ly22zUjf2Ww9AlELjMWk6ANS9qFabGn3Z+iWeucC0u+KMFR3NU2SDiggD3S2T+7uSPYZNFm0ezPhtmdC18e0aMqmSI+1FrQbsx5Du5y16/XaGnxJsEz8dv2IIx4JwA94bvHTJL9A6had9KbQftXStq7a9GNzvpw3H2lb1Vb7VYuijii3OAmbXR8L2uaaWXesQJCyeIKmT6vzrYhEcrh5P69OuIosbw2AOLW4RYziz2rmmxz8V7YnkpJmjpe7GT77rdibBV5djmZZAAy+bi+HTWc0+NvbZt8tWVzB5aZqxhtfOeRoKrNgD6xNHn9xivMXh4xzsxSEUqb1fc0/IaRsFzv6NFdn8GjKJ1GfuteFYhSPswaJ+bUp/Nvy4D7BdUhXr8TEwC2VP6ANSAFOdseLr2JE/tAxcMXXwqZyMiAeKBAjtWHTFZ4p7x/xVVOA8rC2UKpuZvjDg0jZ1IE9cp2F0INcw+ZJfXmL4lIHpVjJ5zuAVzBWISFM47uHmRBQ10KuoJl/srmWkO4MNogg29TYVd1r2qkwrRd8ybqYb4mbNYq1CNGG4oN0pV8M38AoOxHibAe/oeqfbCYDfqIKQoFf0c63wl1tmMDQQu/fRcBWWIegwCZh424p3xLeowVJEm2bb3gkCdIH403ENyDwNi9IdCqbr95XHuZOUX9z1SE/fWSxWCwWi8VisVgsFovFWkB/AGgTHnB/EyHbAAAAAElFTkSuQmCC',
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    currentUserDisplayName,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    currentPhoneNumber,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: const Color(0xFFEE8B60),
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 0.0, 12.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gct132x6' /* Account Settings */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: const Color(0xFF090F13),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed('f6_editProfile');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).grayLines,
                                  width: 2.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'obddrghy' /* Edit Profile */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: const Color(0xFF090F13),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.9, 0.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF95A1AC),
                                        size: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('Button_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamedAuth(
                                    'a1_first-page', context.mounted);
                              },
                              text: FFLocalizations.of(context).getText(
                                'gasnfn2q' /* Log out */,
                              ),
                              options: FFButtonOptions(
                                width: 188.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).error,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
