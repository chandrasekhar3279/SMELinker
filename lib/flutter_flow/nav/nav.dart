import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => WelcomeWidget(),
        ),
        FFRoute(
          name: 'SignUpSelection',
          path: '/signUpSelection',
          builder: (context, params) => SignUpSelectionWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Feed',
          path: '/feed',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Feed')
              : FeedWidget(
                  userId: params.getParam('userId', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: 'Forum',
          path: '/forum',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Forum')
              : ForumWidget(
                  questionId: params.getParam('questionId', ParamType.String),
                ),
        ),
        FFRoute(
          name: 'Resources',
          path: '/resources',
          builder: (context, params) => ResourcesWidget(),
        ),
        FFRoute(
          name: 'Stats',
          path: '/stats',
          builder: (context, params) => StatsWidget(
            profileName: params.getParam('profileName', ParamType.String),
            getOrgCompanyLogo:
                params.getParam('getOrgCompanyLogo', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'Bookings',
          path: '/bookings',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Bookings')
              : BookingsWidget(
                  userId: params.getParam('userId', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'MyGrowth',
          path: '/myGrowth',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MyGrowth')
              : MyGrowthWidget(
                  userId: params.getParam('userId', ParamType.int),
                ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'FeedDetail',
          path: '/feedDetail',
          builder: (context, params) => FeedDetailWidget(
            feedDetail: params.getParam('feedDetail', ParamType.JSON),
            feedId: params.getParam('feedId', ParamType.int),
            userId: params.getParam('userId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'SharePost',
          path: '/sharePost',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'SharePost')
              : SharePostWidget(),
        ),
        FFRoute(
          name: 'ProductDetail',
          path: '/productDetail',
          builder: (context, params) => ProductDetailWidget(
            productinfo: params.getParam('productinfo', ParamType.JSON),
            userId: params.getParam('userId', ParamType.int),
            orgDeatils: params.getParam('orgDeatils', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'ServiceDetail',
          path: '/serviceDetail',
          builder: (context, params) => ServiceDetailWidget(
            servicecardInfo: params.getParam('servicecardInfo', ParamType.JSON),
            userId: params.getParam('userId', ParamType.int),
            orgDetail: params.getParam('orgDetail', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'GrowthCardDetail',
          path: '/growthCardDetail',
          builder: (context, params) => GrowthCardDetailWidget(
            growthCardInfo: params.getParam('growthCardInfo', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          builder: (context, params) => SearchWidget(
            orgeDetails: params.getParam('orgeDetails', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'OnboardingGetstarted',
          path: '/onboardingGetstarted',
          builder: (context, params) => OnboardingGetstartedWidget(),
        ),
        FFRoute(
          name: 'ScanADocument',
          path: '/scanADocument',
          builder: (context, params) => ScanADocumentWidget(),
        ),
        FFRoute(
          name: 'GrowthPlanDetailApply',
          path: '/growthPlanDetailApply',
          builder: (context, params) => GrowthPlanDetailApplyWidget(
            growthPlanId: params.getParam('growthPlanId', ParamType.int),
            growthPlanInfo: params.getParam('growthPlanInfo', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'GrowthPlansDetail',
          path: '/growthPlansDetail',
          builder: (context, params) => GrowthPlansDetailWidget(
            growthPlanDetail:
                params.getParam('growthPlanDetail', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'AIBussinessAdviser',
          path: '/aIBussinessAdviser',
          builder: (context, params) => AIBussinessAdviserWidget(),
        ),
        FFRoute(
          name: 'LoadingPage',
          path: '/loadingPage',
          builder: (context, params) => LoadingPageWidget(),
        ),
        FFRoute(
          name: 'EKYBVerificationPage',
          path: '/eKYBVerificationPage',
          builder: (context, params) => EKYBVerificationPageWidget(),
        ),
        FFRoute(
          name: 'VerifiedSuccessfully',
          path: '/verifiedSuccessfully',
          builder: (context, params) => VerifiedSuccessfullyWidget(),
        ),
        FFRoute(
          name: 'VerificationFailed',
          path: '/verificationFailed',
          builder: (context, params) => VerificationFailedWidget(),
        ),
        FFRoute(
          name: 'GetVerified',
          path: '/getVerified',
          builder: (context, params) => GetVerifiedWidget(),
        ),
        FFRoute(
          name: 'ForumViewAllAnswers',
          path: '/forumViewAllAnswers',
          builder: (context, params) => ForumViewAllAnswersWidget(
            questionItemContent:
                params.getParam('questionItemContent', ParamType.JSON),
            orgDetails: params.getParam('orgDetails', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'CompanyDetailsPage',
          path: '/companyDetailsPage',
          builder: (context, params) => CompanyDetailsPageWidget(
            userId: params.getParam('userId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'HealthCheckQuiz',
          path: '/healthCheckQuiz',
          builder: (context, params) => HealthCheckQuizWidget(
            healthCheckContent:
                params.getParam('healthCheckContent', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'CommunityGuidelines',
          path: '/communityGuidelines',
          builder: (context, params) => CommunityGuidelinesWidget(),
        ),
        FFRoute(
          name: 'BrowseEnterprenurs',
          path: '/browseEnterprenurs',
          builder: (context, params) => BrowseEnterprenursWidget(),
        ),
        FFRoute(
          name: 'BrowseServiceProviders',
          path: '/browseServiceProviders',
          builder: (context, params) => BrowseServiceProvidersWidget(),
        ),
        FFRoute(
          name: 'BrowseIndustrieFilter',
          path: '/browseIndustrieFilter',
          builder: (context, params) => BrowseIndustrieFilterWidget(),
        ),
        FFRoute(
          name: 'ChatUserSelect',
          path: '/chatUserSelect',
          builder: (context, params) => ChatUserSelectWidget(
            users: params.getParam('users', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'ChatDetailPage',
          path: '/chatDetailPage',
          builder: (context, params) => ChatDetailPageWidget(
            selecteduser: params.getParam('selecteduser', ParamType.JSON),
            userchat:
                params.getParam<dynamic>('userchat', ParamType.JSON, true),
          ),
        ),
        FFRoute(
          name: 'Groups',
          path: '/groups',
          builder: (context, params) => GroupsWidget(),
        ),
        FFRoute(
          name: 'GroupDetailpage',
          path: '/groupDetailpage',
          builder: (context, params) => GroupDetailpageWidget(
            groupId: params.getParam('groupId', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'SubscribePlans',
          path: '/subscribePlans',
          builder: (context, params) => SubscribePlansWidget(),
        ),
        FFRoute(
          name: 'MyContentDetail',
          path: '/myContentDetail',
          builder: (context, params) => MyContentDetailWidget(
            myContent: params.getParam('myContent', ParamType.JSON),
            pendingStatus: params.getParam('pendingStatus', ParamType.String),
            rejectedStatus: params.getParam('rejectedStatus', ParamType.String),
            approvedStatus: params.getParam('approvedStatus', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'PlanDetails',
          path: '/planDetails',
          builder: (context, params) => PlanDetailsWidget(
            planDetails: params.getParam('planDetails', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SubscribedDetails',
          path: '/subscribedDetails',
          builder: (context, params) => SubscribedDetailsWidget(),
        ),
        FFRoute(
          name: 'LMSPage',
          path: '/lMSPage',
          builder: (context, params) => LMSPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
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
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
