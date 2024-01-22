import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const LayerWidget() : const A1FirstPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const LayerWidget() : const A1FirstPageWidget(),
        ),
        FFRoute(
          name: 'ZZZa444phone_login',
          path: '/zZZa444phoneLogin',
          builder: (context, params) => const ZZZa444phoneLoginWidget(),
        ),
        FFRoute(
          name: 'zzzzcreateAccount',
          path: '/zzzzcreateAccount',
          builder: (context, params) => const ZzzzcreateAccountWidget(),
        ),
        FFRoute(
          name: 'court_addCourt',
          path: '/courtAddCourt',
          builder: (context, params) => const CourtAddCourtWidget(),
        ),
        FFRoute(
          name: 'court_AddedSuccess',
          path: '/courtAddedSuccess',
          builder: (context, params) => const CourtAddedSuccessWidget(),
        ),
        FFRoute(
          name: 'court_Details',
          path: '/courtDetails',
          asyncParams: {
            'court': getDoc(['courts'], CourtsRecord.fromSnapshot),
          },
          builder: (context, params) => CourtDetailsWidget(
            court: params.getParam('court', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'f6_editProfile',
          path: '/f6EditProfile',
          builder: (context, params) => const F6EditProfileWidget(),
        ),
        FFRoute(
          name: 'zzzzzc7_changePassword',
          path: '/zzzzzc7ChangePassword',
          builder: (context, params) => const Zzzzzc7ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'zzzregisterPage',
          path: '/zzzregisterPage',
          builder: (context, params) => const ZzzregisterPageWidget(),
        ),
        FFRoute(
          name: 'zzzzverifyPhone',
          path: '/zzzzverifyPhone',
          builder: (context, params) => const ZzzzverifyPhoneWidget(),
        ),
        FFRoute(
          name: 'd1_home-client',
          path: '/d1HomeClient',
          builder: (context, params) => D1HomeClientWidget(
            vendorFlag: params.getParam('vendorFlag', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'a1_first-page',
          path: '/a1FirstPage',
          builder: (context, params) => const A1FirstPageWidget(),
        ),
        FFRoute(
          name: 'a2phone_OTP-code',
          path: '/a2phoneOTPCode',
          builder: (context, params) => A2phoneOTPCodeWidget(
            phonenumber: params.getParam('phonenumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Loading',
          path: '/loading',
          builder: (context, params) => const LoadingWidget(),
        ),
        FFRoute(
          name: 'zzzzsignup-aftersignupwithemail',
          path: '/zzzzsignupAftersignupwithemail',
          builder: (context, params) => const ZzzzsignupAftersignupwithemailWidget(),
        ),
        FFRoute(
          name: 'a3Confirm-your-info',
          path: '/a3ConfirmYourInfo',
          builder: (context, params) => A3ConfirmYourInfoWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            email: params.getParam('email', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ZZZa4_fp_OTP-2-email',
          path: '/zZZa4FpOTP2Email',
          builder: (context, params) => const ZZZa4FpOTP2EmailWidget(),
        ),
        FFRoute(
          name: 'c3_email-OTP-2-email',
          path: '/c3EmailOTP2Email',
          builder: (context, params) => const C3EmailOTP2EmailWidget(),
        ),
        FFRoute(
          name: 'c3_email-enter-your-phone',
          path: '/c3EmailEnterYourPhone',
          builder: (context, params) => const C3EmailEnterYourPhoneWidget(),
        ),
        FFRoute(
          name: 'ZZZc5email_account-password',
          path: '/zZZc5emailAccountPassword',
          builder: (context, params) => const ZZZc5emailAccountPasswordWidget(),
        ),
        FFRoute(
          name: 'c1email_Enter-your-email',
          path: '/c1emailEnterYourEmail',
          builder: (context, params) => const C1emailEnterYourEmailWidget(),
        ),
        FFRoute(
          name: 'a4Accept-terms',
          path: '/a4AcceptTerms',
          builder: (context, params) => A4AcceptTermsWidget(
            phone: params.getParam('phone', ParamType.String),
            email: params.getParam('email', ParamType.String),
            name: params.getParam('name', ParamType.String),
            type: params.getParam('type', ParamType.String),
            location: params.getParam('location', ParamType.LatLng),
            locationAddress:
                params.getParam('locationAddress', ParamType.String),
            locationCity: params.getParam('locationCity', ParamType.String),
            locationCountry:
                params.getParam('locationCountry', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Post',
          path: '/post',
          builder: (context, params) => const PostWidget(),
        ),
        FFRoute(
          name: 'ZZZ_dffdfd',
          path: '/zZZDffdfd',
          builder: (context, params) => const ZZZDffdfdWidget(),
        ),
        FFRoute(
          name: 'e1_home-vendor',
          path: '/e1HomeVendor',
          builder: (context, params) => const E1HomeVendorWidget(),
        ),
        FFRoute(
          name: 'd3_applications',
          path: '/d3Applications',
          builder: (context, params) => const D3ApplicationsWidget(),
        ),
        FFRoute(
          name: 'f1_ccountSettings',
          path: '/f1CcountSettings',
          builder: (context, params) => const F1CcountSettingsWidget(),
        ),
        FFRoute(
          name: 'f3_TermsAndService',
          path: '/f3TermsAndService',
          builder: (context, params) => const F3TermsAndServiceWidget(),
        ),
        FFRoute(
          name: 'f2_Help_Center',
          path: '/f2HelpCenter',
          builder: (context, params) => const F2HelpCenterWidget(),
        ),
        FFRoute(
          name: 'c4_phone_OTP-code',
          path: '/c4PhoneOTPCode',
          builder: (context, params) => C4PhoneOTPCodeWidget(
            phonenumber: params.getParam('phonenumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ZZZ_Card',
          path: '/zZZCard',
          builder: (context, params) => const ZZZCardWidget(),
        ),
        FFRoute(
          name: 'f4_EarnbyProvidingservices',
          path: '/f4EarnbyProvidingservices',
          builder: (context, params) => const F4EarnbyProvidingservicesWidget(),
        ),
        FFRoute(
          name: 'chattttttt',
          path: '/chattttttt',
          builder: (context, params) => const ChatttttttWidget(),
        ),
        FFRoute(
          name: 'respon',
          path: '/respon',
          builder: (context, params) => const ResponWidget(),
        ),
        FFRoute(
          name: 'f5_profile-client-settings',
          path: '/f5ProfileClientSettings',
          builder: (context, params) => F5ProfileClientSettingsWidget(
            uid: params.getParam('uid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'c2emailEnterYourPassword',
          path: '/c2emailEnterYourPassword',
          builder: (context, params) => C2emailEnterYourPasswordWidget(
            email: params.getParam('email', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'a_Navigate_To_Confirm',
          path: '/aNavigateToConfirm',
          builder: (context, params) => ANavigateToConfirmWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
            email: params.getParam('email', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'd3_applicationsCopy',
          path: '/d3ApplicationsCopy',
          builder: (context, params) => const D3ApplicationsCopyWidget(),
        ),
        FFRoute(
          name: 'e1_home-vendorCopy',
          path: '/e1HomeVendorCopy',
          builder: (context, params) => const E1HomeVendorCopyWidget(),
        ),
        FFRoute(
          name: 'e3_Applytojobdetails',
          path: '/e3Applytojobdetails',
          asyncParams: {
            'jobDoc': getDoc(['jobs'], JobsRecord.fromSnapshot),
          },
          builder: (context, params) => E3ApplytojobdetailsWidget(
            jobDoc: params.getParam('jobDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'e3_Applytojobdetails2',
          path: '/e3_Applytojobdetails2',
          builder: (context, params) => const E3Applytojobdetails2Widget(),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          asyncParams: {
            'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
          ),
        ),
        FFRoute(
          name: 'AllChatsPage',
          path: '/allChatsPage',
          builder: (context, params) => const AllChatsPageWidget(),
        ),
        FFRoute(
          name: 'Intro',
          path: '/intro',
          builder: (context, params) => const IntroWidget(),
        ),
        FFRoute(
          name: 'd5_vendorActivity',
          path: '/d5VendorActivity',
          builder: (context, params) => const D5VendorActivityWidget(),
        ),
        FFRoute(
          name: 'layer',
          path: '/layer',
          builder: (context, params) => const LayerWidget(),
        ),
        FFRoute(
          name: 'f1_ccountSettingsCopy',
          path: '/f1CcountSettingsCopy',
          builder: (context, params) => const F1CcountSettingsCopyWidget(),
        ),
        FFRoute(
          name: 'community',
          path: '/community',
          builder: (context, params) => const CommunityWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/a1FirstPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Colorful-Thunder-Tech-Mobile-Free-Logo-1.svg',
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
