import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'f6_edit_profile_model.dart';
export 'f6_edit_profile_model.dart';

class F6EditProfileWidget extends StatefulWidget {
  const F6EditProfileWidget({super.key});

  @override
  _F6EditProfileWidgetState createState() => _F6EditProfileWidgetState();
}

class _F6EditProfileWidgetState extends State<F6EditProfileWidget> {
  late F6EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => F6EditProfileModel());

    _model.textController1 ??=
        TextEditingController(text: currentUserDisplayName);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: currentPhoneNumber);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: currentUserEmail);
    _model.textFieldFocusNode3 ??= FocusNode();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('Icon_navigate_back');
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'at5tue2h' /* Edit Profile */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend Deca',
                color: const Color(0xFF14181B),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDBE2E7),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CircleImage_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            logFirebaseEvent('CircleImage_backend_call');

                            await currentUserReference!
                                .update(createUsersRecordData(
                              photoUrl: _model.uploadedFileUrl,
                            ));
                          },
                          child: Container(
                            width: 90.0,
                            height: 90.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIUAAACFCAMAAABCBMsOAAAAYFBMVEX///8AAAD8/PyDg4MEBAT5+fkICAj09PTq6uoVFRVdXV3m5uY3NzfCwsK3t7eKiopvb28/Pz8QEBCjo6PQ0NAfHx9UVFRmZmaZmZnb29swMDB9fX1JSUkpKSl3d3fKysqS0q6fAAADaUlEQVR4nO2Zi3KqMBCGk0hIQAW5eaPK+7/l2U3EcpRyxIZt58z+nbZORs3HXrKbRAgWi8VisVgsFovFYrFYrP9RSiiFv/Dic8CPUZPAhMpuq7zNq61VfoAaQSths0MivZJDZgWMkYIooYXJUpw/cj+gNDMwSokBEWByeYOIbxgyN4rUGACxk8/aGTIKnEcjRPTAECGGvr1jeQgIzGMk4ydTxDI6EmUKBKYWNUz4aAqJQ3EtSBYNlx47mPEJww3taBIFHd8lT0HRh0bS3d6zsMAY+SiCV06zZihhigmKwtCYQthygkJaokztpiBktzyDq5zbSYotkS2ySYqMZPEUv8EWoNMkxYkCAXPkPAFxtkQU+jBBcSBYLXwdqbB+jtVUGKsESQsMU6yLsZLqimphFcXaiSUVjFGO2qIEU2jsP5aW23mY9LnVciOpUSQecXOoejMamptakdR1Ly22zUjf2Ww9AlELjMWk6ANS9qFabGn3Z+iWeucC0u+KMFR3NU2SDiggD3S2T+7uSPYZNFm0ezPhtmdC18e0aMqmSI+1FrQbsx5Du5y16/XaGnxJsEz8dv2IIx4JwA94bvHTJL9A6had9KbQftXStq7a9GNzvpw3H2lb1Vb7VYuijii3OAmbXR8L2uaaWXesQJCyeIKmT6vzrYhEcrh5P69OuIosbw2AOLW4RYziz2rmmxz8V7YnkpJmjpe7GT77rdibBV5djmZZAAy+bi+HTWc0+NvbZt8tWVzB5aZqxhtfOeRoKrNgD6xNHn9xivMXh4xzsxSEUqb1fc0/IaRsFzv6NFdn8GjKJ1GfuteFYhSPswaJ+bUp/Nvy4D7BdUhXr8TEwC2VP6ANSAFOdseLr2JE/tAxcMXXwqZyMiAeKBAjtWHTFZ4p7x/xVVOA8rC2UKpuZvjDg0jZ1IE9cp2F0INcw+ZJfXmL4lIHpVjJ5zuAVzBWISFM47uHmRBQ10KuoJl/srmWkO4MNogg29TYVd1r2qkwrRd8ybqYb4mbNYq1CNGG4oN0pV8M38AoOxHibAe/oeqfbCYDfqIKQoFf0c63wl1tmMDQQu/fRcBWWIegwCZh424p3xLeowVJEm2bb3gkCdIH403ENyDwNi9IdCqbr95XHuZOUX9z1SE/fWSxWCwWi8VisVgsFovFWkB/AGgTHnB/EyHbAAAAAElFTkSuQmCC',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.99, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: FFLocalizations.of(context).getText(
                            'y4oko55l' /* First Name */,
                          ),
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'kbmg7iq9' /* Your first name... */,
                          ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF1F4F8),
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 24.0, 0.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend Deca',
                              color: const Color(0xFFB3B3B3),
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  autofocus: true,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  readOnly: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'jurwair8' /* Phone number */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'zksfccfp' /* Your phone number */,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 8.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFFB3B3B3),
                        lineHeight: 3.0,
                      ),
                  keyboardType: TextInputType.number,
                  validator:
                      _model.textController2Validator.asValidator(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 16.0),
              child: TextFormField(
                controller: _model.textController3,
                focusNode: _model.textFieldFocusNode3,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    '9ird2qij' /* Email */,
                  ),
                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'its69z02' /* Your Email... */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF1F4F8),
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 24.0, 0.0, 24.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend Deca',
                      color: const Color(0xFFB3B3B3),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                validator: _model.textController3Validator.asValidator(context),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
                        child: LinearProgressIndicator(
                          color: Color(0xFF14668B),
                        ),
                      );
                    }
                    List<UsersRecord> buttonUsersRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final buttonUsersRecord = buttonUsersRecordList.isNotEmpty
                        ? buttonUsersRecordList.first
                        : null;
                    return FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          displayName: _model.textController1.text,
                        ));
                        logFirebaseEvent('Button_navigate_back');
                        context.pop();
                      },
                      text: FFLocalizations.of(context).getText(
                        '0r4bn9b1' /* Save Changes */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(360.0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
