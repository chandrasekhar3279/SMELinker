import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SME Group Code

class SmeGroup {
  static String baseUrl =
      'http://smelinker.southafricanorth.cloudapp.azure.com/api';
  static Map<String, String> headers = {};
  static LoginAuthenticationCall loginAuthenticationCall =
      LoginAuthenticationCall();
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static GetIndustriesCall getIndustriesCall = GetIndustriesCall();
  static GetFeedCall getFeedCall = GetFeedCall();
  static GetRegisterReasonsCall getRegisterReasonsCall =
      GetRegisterReasonsCall();
  static GetAllGrowthCardsCall getAllGrowthCardsCall = GetAllGrowthCardsCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static UploadFileCall uploadFileCall = UploadFileCall();
  static RegisterSmeCall registerSmeCall = RegisterSmeCall();
  static ForcedPasswordResetCall forcedPasswordResetCall =
      ForcedPasswordResetCall();
  static GetCaptchaCall getCaptchaCall = GetCaptchaCall();
  static RefreshAuthCall refreshAuthCall = RefreshAuthCall();
  static RegisterGrowthPartnerCall registerGrowthPartnerCall =
      RegisterGrowthPartnerCall();
  static RegisterSMECall registerSMECall = RegisterSMECall();
  static ConfirmRegistrationCall confirmRegistrationCall =
      ConfirmRegistrationCall();
  static ResendRegistrationTokenCall resendRegistrationTokenCall =
      ResendRegistrationTokenCall();
  static ResendRegistrationTokenExistingCall
      resendRegistrationTokenExistingCall =
      ResendRegistrationTokenExistingCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static SavePasswordCall savePasswordCall = SavePasswordCall();
  static ShowCaptchaCall showCaptchaCall = ShowCaptchaCall();
  static AuthenticateUserCall authenticateUserCall = AuthenticateUserCall();
  static SignupGPCall signupGPCall = SignupGPCall();
  static VerifyGPRegisterCall verifyGPRegisterCall = VerifyGPRegisterCall();
  static CreateContainerCall createContainerCall = CreateContainerCall();
  static DeleteContainerCall deleteContainerCall = DeleteContainerCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static AddBookmarkCall addBookmarkCall = AddBookmarkCall();
  static GetBookmarksCall getBookmarksCall = GetBookmarksCall();
  static UpdateGrowthCardApprovalStatusCall updateGrowthCardApprovalStatusCall =
      UpdateGrowthCardApprovalStatusCall();
  static ApproveUserCall approveUserCall = ApproveUserCall();
  static GetUserQuestionsCall getUserQuestionsCall = GetUserQuestionsCall();
  static GetUsersCall getUsersCall = GetUsersCall();
  static GetGrowthCardsPendingForApprovalCall
      getGrowthCardsPendingForApprovalCall =
      GetGrowthCardsPendingForApprovalCall();
  static DeleteAnswerCall deleteAnswerCall = DeleteAnswerCall();
  static DeleteQuestionCall deleteQuestionCall = DeleteQuestionCall();
  static GetAnswersCall getAnswersCall = GetAnswersCall();
  static GetQuestionsCall getQuestionsCall = GetQuestionsCall();
  static MarkBestAnswerCall markBestAnswerCall = MarkBestAnswerCall();
  static SubmitAnswersCall submitAnswersCall = SubmitAnswersCall();
  static SubmitQuestionCall submitQuestionCall = SubmitQuestionCall();
  static UpdateAnswerCall updateAnswerCall = UpdateAnswerCall();
  static UpdateAnswerStatusCall updateAnswerStatusCall =
      UpdateAnswerStatusCall();
  static UpdateQuestionCall updateQuestionCall = UpdateQuestionCall();
  static UpdateQuestionStatusCall updateQuestionStatusCall =
      UpdateQuestionStatusCall();
  static SubmitCustomQuestionCall submitCustomQuestionCall =
      SubmitCustomQuestionCall();
  static GetFaqContentCall getFaqContentCall = GetFaqContentCall();
  static GetCommentsCall getCommentsCall = GetCommentsCall();
  static DeleteFeedCommentCall deleteFeedCommentCall = DeleteFeedCommentCall();
  static GetFeedCommentsCall getFeedCommentsCall = GetFeedCommentsCall();
  static GetFeedCommentsCountCall getFeedCommentsCountCall =
      GetFeedCommentsCountCall();
  static GetFeedFavoriteCall getFeedFavoriteCall = GetFeedFavoriteCall();
  static GetFeedForApprovalCall getFeedForApprovalCall =
      GetFeedForApprovalCall();
  static GetFeedForManagerViewCall getFeedForManagerViewCall =
      GetFeedForManagerViewCall();
  static GetMostTrendingCall getMostTrendingCall = GetMostTrendingCall();
  static GetMyContentCall getMyContentCall = GetMyContentCall();
  static GetRejectedFeedListCall getRejectedFeedListCall =
      GetRejectedFeedListCall();
  static GetTopArticlesCall getTopArticlesCall = GetTopArticlesCall();
  static ShareFeedCall shareFeedCall = ShareFeedCall();
  static SubmitFeedCommentCall submitFeedCommentCall = SubmitFeedCommentCall();
  static SubmitReviewCall submitReviewCall = SubmitReviewCall();
  static UpdateFeedCall updateFeedCall = UpdateFeedCall();
  static UpdateFeedCommentCall updateFeedCommentCall = UpdateFeedCommentCall();
  static SaveCategoryGrowthCardMappingCall saveCategoryGrowthCardMappingCall =
      SaveCategoryGrowthCardMappingCall();
  static UpdateGrowthCardFeaturedStatusCall updateGrowthCardFeaturedStatusCall =
      UpdateGrowthCardFeaturedStatusCall();
  static DeleteGrowthCardCall deleteGrowthCardCall = DeleteGrowthCardCall();
  static CreateGrowthCardCall createGrowthCardCall = CreateGrowthCardCall();
  static GetAllGrowthCardstwoCall getAllGrowthCardstwoCall =
      GetAllGrowthCardstwoCall();
  static GetPublishedUtilityCategoriesCall getPublishedUtilityCategoriesCall =
      GetPublishedUtilityCategoriesCall();
  static GetFeaturedGrowthCardsCall getFeaturedGrowthCardsCall =
      GetFeaturedGrowthCardsCall();
  static GetGCByIdCall getGCByIdCall = GetGCByIdCall();
  static UpdateGrowthCardCall updateGrowthCardCall = UpdateGrowthCardCall();
  static ViewGCAsPDFCall viewGCAsPDFCall = ViewGCAsPDFCall();
  static AddCustomGrowthPlansCall addCustomGrowthPlansCall =
      AddCustomGrowthPlansCall();
  static ApplyForGrowthPlanCall applyForGrowthPlanCall =
      ApplyForGrowthPlanCall();
  static GetCheckListCall getCheckListCall = GetCheckListCall();
  static SearchGrowthPlansCall searchGrowthPlansCall = SearchGrowthPlansCall();
  static SearchGrowthPackagesCall searchGrowthPackagesCall =
      SearchGrowthPackagesCall();
  static GetHealthCheckContentCall getHealthCheckContentCall =
      GetHealthCheckContentCall();
  static GetHealthChecksCall getHealthChecksCall = GetHealthChecksCall();
  static GetSavedUserResponsesCall getSavedUserResponsesCall =
      GetSavedUserResponsesCall();
  static SaveUserResponsesCall saveUserResponsesCall = SaveUserResponsesCall();
  static SubmitAnswerssCall submitAnswerssCall = SubmitAnswerssCall();
  static SubmitAnswersViewReportCall submitAnswersViewReportCall =
      SubmitAnswersViewReportCall();
  static GetUserPortfolioCall getUserPortfolioCall = GetUserPortfolioCall();
  static GetContactDetailCall getContactDetailCall = GetContactDetailCall();
  static EditContactDetailCall editContactDetailCall = EditContactDetailCall();
  static GetContactDetailPubicCall getContactDetailPubicCall =
      GetContactDetailPubicCall();
  static GetProductsCall getProductsCall = GetProductsCall();
  static CreateProductCall createProductCall = CreateProductCall();
  static UpdateProductCall updateProductCall = UpdateProductCall();
  static BookProductCall bookProductCall = BookProductCall();
  static DeleteProductCall deleteProductCall = DeleteProductCall();
  static GetBookingsCall getBookingsCall = GetBookingsCall();
  static GetProductCategoriesCall getProductCategoriesCall =
      GetProductCategoriesCall();
  static GetLatestProductsCall getLatestProductsCall = GetLatestProductsCall();
  static GetLatestProductUserIdCall getLatestProductUserIdCall =
      GetLatestProductUserIdCall();
  static ReplyToBookingCall replyToBookingCall = ReplyToBookingCall();
  static AddResourceCall addResourceCall = AddResourceCall();
  static GetViewCall getViewCall = GetViewCall();
  static SearchResourcesCall searchResourcesCall = SearchResourcesCall();
  static SearchByCategoryCall searchByCategoryCall = SearchByCategoryCall();
  static SearchProductsCall searchProductsCall = SearchProductsCall();
  static SearchServicesCall searchServicesCall = SearchServicesCall();
  static SearchUsersCall searchUsersCall = SearchUsersCall();
  static GetServiceCardListCall getServiceCardListCall =
      GetServiceCardListCall();
  static CreateServiceCardCall createServiceCardCall = CreateServiceCardCall();
  static UpdateServiceCardCall updateServiceCardCall = UpdateServiceCardCall();
  static BookServiceCall bookServiceCall = BookServiceCall();
  static DeleteProductServiceCardCall deleteProductServiceCardCall =
      DeleteProductServiceCardCall();
  static GetAllBookingsCall getAllBookingsCall = GetAllBookingsCall();
  static GetBookingsServiceCardCall getBookingsServiceCardCall =
      GetBookingsServiceCardCall();
  static GetServiceCategoriesCall getServiceCategoriesCall =
      GetServiceCategoriesCall();
  static GetLatestServiceCardsCall getLatestServiceCardsCall =
      GetLatestServiceCardsCall();
  static GetLatestServiceCardsUserIdCall getLatestServiceCardsUserIdCall =
      GetLatestServiceCardsUserIdCall();
  static ReplyToBookingServiceCardCall replyToBookingServiceCardCall =
      ReplyToBookingServiceCardCall();
  static AddServiceProviderCall addServiceProviderCall =
      AddServiceProviderCall();
  static AddSmeProfileCall addSmeProfileCall = AddSmeProfileCall();
  static GetSmeProfileCall getSmeProfileCall = GetSmeProfileCall();
  static GetSmeStatsCall getSmeStatsCall = GetSmeStatsCall();
  static SearchSmeProfilesCall searchSmeProfilesCall = SearchSmeProfilesCall();
  static UpdateAboutCall updateAboutCall = UpdateAboutCall();
  static AddAboutCall addAboutCall = AddAboutCall();
  static AddFollowerCall addFollowerCall = AddFollowerCall();
  static AddStoryCall addStoryCall = AddStoryCall();
  static ContactSmeCall contactSmeCall = ContactSmeCall();
  static ExportContactsCall exportContactsCall = ExportContactsCall();
  static GetAboutCall getAboutCall = GetAboutCall();
  static GetFolloweesCall getFolloweesCall = GetFolloweesCall();
  static GetFollowersCall getFollowersCall = GetFollowersCall();
  static GetHeaderBannerInfoCall getHeaderBannerInfoCall =
      GetHeaderBannerInfoCall();
  static GetHeaderBannerInfoUserIdCall getHeaderBannerInfoUserIdCall =
      GetHeaderBannerInfoUserIdCall();
  static GetOrgDetailsCall getOrgDetailsCall = GetOrgDetailsCall();
  static GetPasswordLastUpdatedDateCall getPasswordLastUpdatedDateCall =
      GetPasswordLastUpdatedDateCall();
  static GetProfileDetailsCall getProfileDetailsCall = GetProfileDetailsCall();
  static GetTaggableUsersCall getTaggableUsersCall = GetTaggableUsersCall();
  static GetUserStoryCall getUserStoryCall = GetUserStoryCall();
  static GetUserStoryUserIdCall getUserStoryUserIdCall =
      GetUserStoryUserIdCall();
  static GetUserInfoCall getUserInfoCall = GetUserInfoCall();
  static BrnNumberCheckCall brnNumberCheckCall = BrnNumberCheckCall();
  static IsFollowingCall isFollowingCall = IsFollowingCall();
  static UnFollowCall unFollowCall = UnFollowCall();
  static UpdateBRNNumberCall updateBRNNumberCall = UpdateBRNNumberCall();
  static UpdateOrgDetailsCall updateOrgDetailsCall = UpdateOrgDetailsCall();
  static ChangeUserPasswordCall changeUserPasswordCall =
      ChangeUserPasswordCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static GetTeamMemberListCall getTeamMemberListCall = GetTeamMemberListCall();
  static CreateTeamMemberCall createTeamMemberCall = CreateTeamMemberCall();
  static DeleteTeamMemberCall deleteTeamMemberCall = DeleteTeamMemberCall();
  static GetTeamMemberListPublicCall getTeamMemberListPublicCall =
      GetTeamMemberListPublicCall();
  static GetAllUtilityCategoriesCall getAllUtilityCategoriesCall =
      GetAllUtilityCategoriesCall();
  static CreateUtilityCategoryCall createUtilityCategoryCall =
      CreateUtilityCategoryCall();
  static UpdateUtilityCategoryCall updateUtilityCategoryCall =
      UpdateUtilityCategoryCall();
  static DeleteUtilityCategoryCall deleteUtilityCategoryCall =
      DeleteUtilityCategoryCall();
  static GetAllUtilityCategoriestwoCall getAllUtilityCategoriestwoCall =
      GetAllUtilityCategoriestwoCall();
  static GetCategoryWiseGrowthCardsCall getCategoryWiseGrowthCardsCall =
      GetCategoryWiseGrowthCardsCall();
  static GetCategoryWiseGrowthPartnersCall getCategoryWiseGrowthPartnersCall =
      GetCategoryWiseGrowthPartnersCall();
  static GetAllGrowthPatnersCall getAllGrowthPatnersCall =
      GetAllGrowthPatnersCall();
  static UpdatePriorityOrderCall updatePriorityOrderCall =
      UpdatePriorityOrderCall();
  static UpdateStatusCall updateStatusCall = UpdateStatusCall();
  static SetHelpfulnessCall setHelpfulnessCall = SetHelpfulnessCall();
  static SetUnHelpfulnessCall setUnHelpfulnessCall = SetUnHelpfulnessCall();
  static SetForumHelpfulnessCall setForumHelpfulnessCall =
      SetForumHelpfulnessCall();
  static SetForumUnHelpfulnessCall setForumUnHelpfulnessCall =
      SetForumUnHelpfulnessCall();
  static GetTopActiveCall getTopActiveCall = GetTopActiveCall();
  static GetMoreDetailsCall getMoreDetailsCall = GetMoreDetailsCall();
  static RegisterUqudoSMECall registerUqudoSMECall = RegisterUqudoSMECall();
  static GetBannerUserIdCall getBannerUserIdCall = GetBannerUserIdCall();
  static GenerateAiResponseCall generateAiResponseCall =
      GenerateAiResponseCall();
  static UpdateBannerCall updateBannerCall = UpdateBannerCall();
  static EkybverifycompanyCall ekybverifycompanyCall = EkybverifycompanyCall();
  static SetVerifiedCompanyCall setVerifiedCompanyCall =
      SetVerifiedCompanyCall();
  static GetAllServiceProvidersCall getAllServiceProvidersCall =
      GetAllServiceProvidersCall();
  static SearchServiceProvidersCall searchServiceProvidersCall =
      SearchServiceProvidersCall();
  static GetMessagingUsersCall getMessagingUsersCall = GetMessagingUsersCall();
  static GetMessagesForUserCall getMessagesForUserCall =
      GetMessagesForUserCall();
  static SendMessageCall sendMessageCall = SendMessageCall();
  static GetGroupsCall getGroupsCall = GetGroupsCall();
  static GetAllJoinedGroupsCall getAllJoinedGroupsCall =
      GetAllJoinedGroupsCall();
  static GetMyGroupsCall getMyGroupsCall = GetMyGroupsCall();
  static GetReqJoinedGroupsCall getReqJoinedGroupsCall =
      GetReqJoinedGroupsCall();
  static JoinGroupsCall joinGroupsCall = JoinGroupsCall();
  static GetGroupBannerCall getGroupBannerCall = GetGroupBannerCall();
  static GetGroupDetailsCall getGroupDetailsCall = GetGroupDetailsCall();
  static LeaveGroupCall leaveGroupCall = LeaveGroupCall();
}

class LoginAuthenticationCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginAuthentication',
      apiUrl: '${SmeGroup.baseUrl}/auth/signin',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? brnNumber = '',
    String? companyName = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? industry = '',
    String? name = '',
    String? password = '',
    String? position = '',
    String? role = 'entrepreneur',
    List<bool>? smeconnectCustomerList,
    String? authToken = '',
    String? companyRegion = '',
    String? tradeLicense = '',
    String? heardFrom = '',
    List<String>? interestsList,
  }) async {
    final smeconnectCustomer = _serializeList(smeconnectCustomerList);
    final interests = _serializeList(interestsList);

    final ffApiRequestBody = '''
{
 "areaOfInterest":${interests},
  "brnNumber": "${brnNumber}",
  "companyName": "${companyName}",
  "email": "${email}",
  "firstName": "${firstName}",
  "industry": "${industry}",
  "lastName": "${lastName}",
  "name": "${name}",
  "password": "${password}",
  "position": "${position}",
  "tradeLicense": "${tradeLicense}",
  "companyRegion": "${companyRegion}",
  "heardFrom": "${heardFrom}",
  "role": [
    "SME"
  ],
  "smeconnectCustomer": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterUser',
      apiUrl: '${SmeGroup.baseUrl}/auth/register-sme',
      callType: ApiCallType.POST,
      headers: {
        'x-base-href': 'http://smeconnect-dev.southindia.cloudapp.azure.com',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetIndustriesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIndustries',
      apiUrl: '${SmeGroup.baseUrl}/auth/getIndustries',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? industryName(dynamic response) => (getJsonField(
        response,
        r'''$[:].industryName''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

class GetFeedCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeed',
      apiUrl: '${SmeGroup.baseUrl}/feed/getFeed',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? feed(dynamic response) => getJsonField(
        response,
        r'''$.feed''',
        true,
      ) as List?;
  List? latestFeedComment(dynamic response) => getJsonField(
        response,
        r'''$.feed[:]..latestFeedComment.feedId''',
        true,
      ) as List?;
  List? feedComment(dynamic response) => getJsonField(
        response,
        r'''$.feed[:].latestFeedComment.feedId''',
        true,
      ) as List?;
  List? commentList(dynamic response) => getJsonField(
        response,
        r'''$.feed[:].latestFeedComment..commentText''',
        true,
      ) as List?;
  List? groupsData(dynamic response) => getJsonField(
        response,
        r'''$.feed[:].groupsData''',
        true,
      ) as List?;
}

class GetRegisterReasonsCall {
  Future<ApiCallResponse> call({
    String? reason = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRegisterReasons',
      apiUrl: '${SmeGroup.baseUrl}/auth/getRegisterReasons',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllGrowthCardsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllGrowthCards',
      apiUrl:
          '${SmeGroup.baseUrl}/growth-cards?category_id=0&pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadFile',
      apiUrl: '${SmeGroup.baseUrl}/file/download/${fileId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'fileId': fileId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadFileCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadFile',
      apiUrl: '${SmeGroup.baseUrl}/file/upload',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterSmeCall {
  Future<ApiCallResponse> call({
    String? brnNumber = '',
    String? companyName = '',
    String? email = '',
    String? firstName = '',
    String? heardFrom = '',
    String? industry = '',
    String? lastName = '',
    String? name = '',
    String? password = '',
    String? position = '',
    bool? smeconnectCustomer,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'registerSme',
      apiUrl: '${SmeGroup.baseUrl}/auth/register-sme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ForcedPasswordResetCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'forcedPasswordReset',
      apiUrl: '${SmeGroup.baseUrl}/auth/forcedPasswordReset',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCaptchaCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCaptcha',
      apiUrl: '${SmeGroup.baseUrl}/auth/getCaptcha',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshAuthCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'refreshAuth',
      apiUrl: '${SmeGroup.baseUrl}/auth/refresh',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterGrowthPartnerCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'registerGrowthPartner',
      apiUrl: '${SmeGroup.baseUrl}/auth/register-growth-partner',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterSMECall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'registerSME',
      apiUrl: '${SmeGroup.baseUrl}/auth/register-sme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmRegistrationCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'confirmRegistration',
      apiUrl: '${SmeGroup.baseUrl}/auth/registrationConfirm',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ResendRegistrationTokenCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' resendRegistrationToken',
      apiUrl:
          '${SmeGroup.baseUrl}/auth/resendRegistrationToken?email=cs%40gmail.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ResendRegistrationTokenExistingCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'resendRegistrationTokenExisting',
      apiUrl: '${SmeGroup.baseUrl}/auth/resendTokenForExistingToken?token=q',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${SmeGroup.baseUrl}/auth/resetPassword',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SavePasswordCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'savePassword',
      apiUrl: '${SmeGroup.baseUrl}/auth/savePassword',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ShowCaptchaCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'showCaptcha',
      apiUrl: '${SmeGroup.baseUrl}/auth/showCaptcha',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AuthenticateUserCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'authenticateUser',
      apiUrl: '${SmeGroup.baseUrl}/auth/signin',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SignupGPCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'signupGP',
      apiUrl: '${SmeGroup.baseUrl}/auth/signup-gp?data=q',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyGPRegisterCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'verifyGPRegister',
      apiUrl: '${SmeGroup.baseUrl}/auth/verify-gp-register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateContainerCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' createContainer',
      apiUrl: '${SmeGroup.baseUrl}/container/{name}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteContainerCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteContainer',
      apiUrl: '${SmeGroup.baseUrl}/container/{name}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFile',
      apiUrl: '${SmeGroup.baseUrl}/file/delete/{fileId}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddBookmarkCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'addBookmark',
      apiUrl: '${SmeGroup.baseUrl}/bookmarks/addBookmark?resourceId',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookmarksCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBookmarks',
      apiUrl: '${SmeGroup.baseUrl}/bookmarks/getBookmarks',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateGrowthCardApprovalStatusCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateGrowthCardApprovalStatus',
      apiUrl:
          '${SmeGroup.baseUrl}/community-manager/approveOrRejectGC?approveOrReject=approve&gcId=1',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApproveUserCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'approveUser',
      apiUrl: '${SmeGroup.baseUrl}/community-manager/approveOrRejectUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserQuestionsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserQuestions',
      apiUrl:
          '${SmeGroup.baseUrl}/community-manager/getUserQuestions?pageNumber=1&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUsersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUsers',
      apiUrl:
          '${SmeGroup.baseUrl}/community-manager/getUsers?pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGrowthCardsPendingForApprovalCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGrowthCardsPendingForApproval',
      apiUrl: '${SmeGroup.baseUrl}/community-manager/pendingForApprovalGCs',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAnswerCall {
  Future<ApiCallResponse> call({
    int? answerId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAnswer',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/deleteAnswer',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'answerId': answerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteQuestionCall {
  Future<ApiCallResponse> call({
    int? questionId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteQuestion',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/deleteQuestion',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'questionId': questionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAnswersCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? pageNumber,
    int? pageSize,
    int? questionId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAnswers',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/getAnswers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'questionId': questionId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuestionsCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getQuestions',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/getQuestions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? content(dynamic response) => getJsonField(
        response,
        r'''$.content[:]''',
        true,
      ) as List?;
  List? answerList(dynamic response) => getJsonField(
        response,
        r'''$.content[:].answerList''',
        true,
      ) as List?;
  List? answerContentList(dynamic response) => getJsonField(
        response,
        r'''$.content[:].answerList.content''',
        true,
      ) as List?;
}

class MarkBestAnswerCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'markBestAnswer',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/markBestAnswer?answerId=3',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitAnswersCall {
  Future<ApiCallResponse> call({
    String? answer = '',
    int? questionId,
    dynamic? mentionsJson,
    String? accessToken = '',
  }) async {
    final mentions = _serializeJson(mentionsJson);
    final ffApiRequestBody = '''
{
  "answer": "${answer}",
  "mentions": [${mentions}],
  "questionId": ${questionId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitAnswers',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/submitAnswer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitQuestionCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? questionRequestJson,
    String? question = '',
  }) async {
    final questionRequest = _serializeJson(questionRequestJson);
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitQuestion',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/submitQuestion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAnswerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? answerId,
    String? answer = '',
    int? questionId,
  }) async {
    final ffApiRequestBody = '''
{
  "answer": "${answer}",
  "answerId": ${answerId},
  "questionId": ${questionId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateAnswer',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/updateAnswer',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAnswerStatusCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateAnswerStatus',
      apiUrl:
          '${SmeGroup.baseUrl}/discussion-board/updateAnswerStatus?answerId=3&status=w',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateQuestionCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? questionId,
    String? question = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}",
  "questionId": ${questionId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateQuestion',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/updateQuestion',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateQuestionStatusCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateQuestionStatus',
      apiUrl:
          '${SmeGroup.baseUrl}/discussion-board/updateQuestionStatus?questionId=3&status=d',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitCustomQuestionCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'submitCustomQuestion',
      apiUrl: '${SmeGroup.baseUrl}/faq/askCustomQuestion',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFaqContentCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFaqContent',
      apiUrl: '${SmeGroup.baseUrl}/faq/getFaqContent?pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCommentsCall {
  Future<ApiCallResponse> call({
    int? feedId,
    int? size,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getComments',
      apiUrl: '${SmeGroup.baseUrl}/feed/comments',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {
        'feedId': feedId,
        'size': size,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? comments(dynamic response) => getJsonField(
        response,
        r'''$.comments''',
        true,
      ) as List?;
}

class DeleteFeedCommentCall {
  Future<ApiCallResponse> call({
    int? commentId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFeedComment',
      apiUrl: '${SmeGroup.baseUrl}/feed/deleteFeedComment',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'commentId': commentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeedCommentsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeedComments',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getFeedComments?feedId=3&pageNumber=2&pageSize=2',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeedCommentsCountCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeedCommentsCount',
      apiUrl: '${SmeGroup.baseUrl}/feed/getFeedCommentsCount?feedId',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeedFavoriteCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeedFavorite',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getFeedFavorite?pageNumber=3&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeedForApprovalCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeedForApproval',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getFeedForApproval?pageNumber=3&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeedForManagerViewCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeedForManagerView',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getFeedForManagerView?pageNumber=3&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMostTrendingCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMostTrending',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getMostTrending?pageNumber=3&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyContentCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyContent',
      apiUrl: '${SmeGroup.baseUrl}/feed/getMyFeedContent',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? myContent(dynamic response) => getJsonField(
        response,
        r'''$.myContent''',
        true,
      ) as List?;
  List? description(dynamic response) => getJsonField(
        response,
        r'''$.myContent[:].description''',
        true,
      ) as List?;
}

class GetRejectedFeedListCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRejectedFeedList',
      apiUrl:
          '${SmeGroup.baseUrl}/feed/getRejectedFeedList?pageNumber=3&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTopArticlesCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTopArticles',
      apiUrl: '${SmeGroup.baseUrl}/feed/getTopArticles',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? feedTopActive(dynamic response) => getJsonField(
        response,
        r'''$.feed[:]''',
        true,
      ) as List?;
}

class ShareFeedCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    FFUploadedFile? featuredImage,
    FFUploadedFile? document,
    String? accessToken = '',
    List<int>? selectedGroupsList,
  }) async {
    final selectedGroups = _serializeList(selectedGroupsList);
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'shareFeed',
      apiUrl: '${SmeGroup.baseUrl}/feed/shareFeed',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': '*/*',
        'Content-Type': 'application/msword',
        'Content-Type': 'image/jpeg',
        'Content-Disposition': 'form-data;',
      },
      params: {
        'data': data,
        'featuredImage': featuredImage,
        'document': document,
        'selectedGroups': selectedGroups,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitFeedCommentCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? comment = '',
    int? feedId,
    List<int>? mentionsList,
  }) async {
    final mentions = _serializeList(mentionsList);

    final ffApiRequestBody = '''
{
  "feedId": ${feedId},
  "comment": "${comment}",
  "mentions": ${mentions}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitFeedComment',
      apiUrl: '${SmeGroup.baseUrl}/feed/submitFeedComment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitReviewCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'submitReview',
      apiUrl: '${SmeGroup.baseUrl}/feed/submitReviewStatus',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateFeedCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateFeed',
      apiUrl: '${SmeGroup.baseUrl}/feed/updateFeed',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateFeedCommentCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? comment = '',
    int? commentId,
    dynamic? mentionsJson,
  }) async {
    final mentions = _serializeJson(mentionsJson);
    final ffApiRequestBody = '''
{
  "comment": "${comment}",
  "commentId": ${commentId},
  "mentions": [${mentions}]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateFeedComment',
      apiUrl: '${SmeGroup.baseUrl}/feed/updateFeedComment',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveCategoryGrowthCardMappingCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'saveCategoryGrowthCardMapping',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateGrowthCardFeaturedStatusCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateGrowthCardFeaturedStatus',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteGrowthCardCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteGrowthCard',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards?gcId=3',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateGrowthCardCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'createGrowthCard',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards/createGrowthCard',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllGrowthCardstwoCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllGrowthCardstwo',
      apiUrl:
          '${SmeGroup.baseUrl}/growth-cards/getAllGrowthCards?category_id=0&pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPublishedUtilityCategoriesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPublishedUtilityCategories',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards/getAllUtilityCategories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFeaturedGrowthCardsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFeaturedGrowthCards',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards/getFeaturedGrowthCards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? featuredGrowthCards(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetGCByIdCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGCById',
      apiUrl:
          '${SmeGroup.baseUrl}/growth-cards/getGCById?gcId=3 Server response',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateGrowthCardCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateGrowthCard',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards/updateGrowthCard?data=ok',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ViewGCAsPDFCall {
  Future<ApiCallResponse> call({
    int? gcId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'viewGCAsPDF',
      apiUrl: '${SmeGroup.baseUrl}/growth-cards/viewGCAsPDF',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': '*/*',
      },
      params: {
        'gcId': gcId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCustomGrowthPlansCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'addCustomGrowthPlans',
      apiUrl: '${SmeGroup.baseUrl}/growth-plans/addCustomGrowthPlan?data=ok',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApplyForGrowthPlanCall {
  Future<ApiCallResponse> call({
    int? growthPlanId,
    String? criteriaSelected = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "growthPlanId": ${growthPlanId},
  "criteriaSelected": "${criteriaSelected}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'applyForGrowthPlan',
      apiUrl: '${SmeGroup.baseUrl}/growth-plans/applyForGrowthPlan',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCheckListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? growthPlanId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getCheckList',
      apiUrl: '${SmeGroup.baseUrl}/growth-plans/getCheckList',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'growthPlanId': growthPlanId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
        true,
      ) as List?;
}

class SearchGrowthPlansCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? pageNumber,
    int? pageSize,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchGrowthPlans',
      apiUrl:
          '${SmeGroup.baseUrl}/growth-plans/searchGrowthPlans?pageNumber=0&pageSize=10',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.content[:]''',
        true,
      ) as List?;
}

class SearchGrowthPackagesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchGrowthPackages',
      apiUrl:
          '${SmeGroup.baseUrl}/growth-plans/searchGrowthPlans?pageNumber=0&pageSize=10',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetHealthCheckContentCall {
  Future<ApiCallResponse> call({
    int? healthCheckId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getHealthCheckContent',
      apiUrl: '${SmeGroup.baseUrl}/health-check/getHealthCheckContent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'healthCheckId': healthCheckId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? question(dynamic response) => getJsonField(
        response,
        r'''$.topic[:].questions[:]''',
        true,
      ) as List?;
  List? topic(dynamic response) => getJsonField(
        response,
        r'''$.topic[:]''',
        true,
      ) as List?;
}

class GetHealthChecksCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getHealthChecks',
      apiUrl: '${SmeGroup.baseUrl}/health-check/getHealthChecks',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? content(dynamic response) => getJsonField(
        response,
        r'''$.content[:]''',
        true,
      ) as List?;
}

class GetSavedUserResponsesCall {
  Future<ApiCallResponse> call({
    int? healthCheckId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSavedUserResponses',
      apiUrl: '${SmeGroup.baseUrl}/health-check/getSavedUserResponses',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'healthCheckId': healthCheckId,
        'accessToken': accessToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveUserResponsesCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? healthCheckAnswersJson,
  }) async {
    final healthCheckAnswers = _serializeJson(healthCheckAnswersJson);
    final ffApiRequestBody = '''
${healthCheckAnswers}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveUserResponses',
      apiUrl: '${SmeGroup.baseUrl}/health-check/saveUserResponses',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitAnswerssCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? healthCheckAnswersJson,
  }) async {
    final healthCheckAnswers = _serializeJson(healthCheckAnswersJson);
    final ffApiRequestBody = '''
${healthCheckAnswers}''';
    return ApiManager.instance.makeApiCall(
      callName: 'submitAnswerss',
      apiUrl: '${SmeGroup.baseUrl}/health-check/submitAnswers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SubmitAnswersViewReportCall {
  Future<ApiCallResponse> call({
    int? healthCheckId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'submitAnswersViewReport',
      apiUrl: '${SmeGroup.baseUrl}/health-check/viewReport',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'healthCheckId': healthCheckId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? moredetials(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetUserPortfolioCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserPortfolio',
      apiUrl: '${SmeGroup.baseUrl}/investor/getPortfolio',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetContactDetailCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getContactDetail',
      apiUrl: '${SmeGroup.baseUrl}/contact-detail',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': "1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EditContactDetailCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    String? accessToken = '',
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'editContactDetail',
      apiUrl: '${SmeGroup.baseUrl}/contact-detail',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'data': data,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetContactDetailPubicCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getContactDetailPubic',
      apiUrl: '${SmeGroup.baseUrl}/contact-detail/getContactDetails',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic getContactDetails(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetProductsCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
    int? userId = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getProducts',
      apiUrl: '${SmeGroup.baseUrl}/product',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? content(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
  List<String>? featuredImage(dynamic response) => (getJsonField(
        response,
        r'''$.content[:].featuredImage''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

class CreateProductCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    dynamic? dataJson,
    String? accessToken = '',
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'createProduct',
      apiUrl: '${SmeGroup.baseUrl}/product',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'file': file,
        'data': data,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProductCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? dataJson,
    FFUploadedFile? file,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'updateProduct',
      apiUrl: '${SmeGroup.baseUrl}/product',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'data': data,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BookProductCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? productId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bookProduct',
      apiUrl: '${SmeGroup.baseUrl}/product/bookProduct?productId=3',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'productId': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProductCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? productId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteProduct',
      apiUrl: '${SmeGroup.baseUrl}/product/deleteProduct',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'productId': productId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBookingsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBookings',
      apiUrl:
          '${SmeGroup.baseUrl}/product/getBookings?pageNumber=0&pageSize=10',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductCategoriesCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductCategories',
      apiUrl: '${SmeGroup.baseUrl}/product/getProductCategories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLatestProductsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatestProducts',
      apiUrl: '${SmeGroup.baseUrl}/product/latest?userId=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLatestProductUserIdCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatestProductUserId',
      apiUrl: '${SmeGroup.baseUrl}/product/latest/{userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ReplyToBookingCall {
  Future<ApiCallResponse> call({
    int? bookingId,
    String? accessToken = '',
    dynamic? messageJson,
  }) async {
    final message = _serializeJson(messageJson);
    final ffApiRequestBody = '''
{
  "bookingId": ${bookingId},
  "message": ${message}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'replyToBooking',
      apiUrl: '${SmeGroup.baseUrl}/product/replyToBooking',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddResourceCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' addResource',
      apiUrl: '${SmeGroup.baseUrl}/resource/addResource?data=a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetViewCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' getView',
      apiUrl: '${SmeGroup.baseUrl}/resource/getView?resourceId=3',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchResourcesCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pageNumber": ${pageNumber},
  "pageSize": ${pageSize}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchResources',
      apiUrl: '${SmeGroup.baseUrl}/resource/searchResources',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? content(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class SearchByCategoryCall {
  Future<ApiCallResponse> call({
    String? term = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' searchByCategory',
      apiUrl: '${SmeGroup.baseUrl}/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'term': term,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? companies(dynamic response) => getJsonField(
        response,
        r'''$.companies''',
        true,
      ) as List?;
  List? services(dynamic response) => getJsonField(
        response,
        r'''$.service_cards''',
        true,
      ) as List?;
  List? growthPartners(dynamic response) => getJsonField(
        response,
        r'''$.growth_partners''',
        true,
      ) as List?;
  List? feeds(dynamic response) => getJsonField(
        response,
        r'''$.feeds''',
        true,
      ) as List?;
  List? growthcards(dynamic response) => getJsonField(
        response,
        r'''$.growth_cards''',
        true,
      ) as List?;
  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
}

class SearchProductsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchProducts',
      apiUrl:
          '${SmeGroup.baseUrl}/search/SearchProducts?categories=ok&pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchServicesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchServices',
      apiUrl:
          '${SmeGroup.baseUrl}/search/SearchServices?categories=&pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchUsersCall {
  Future<ApiCallResponse> call({
    String? categories = '',
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchUsers',
      apiUrl: '${SmeGroup.baseUrl}/search/SearchUsers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'categories': categories,
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? searchedUsers(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class GetServiceCardListCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId = 0,
    int? pageNumber = 0,
    int? pageSize = 100,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getServiceCardList',
      apiUrl: '${SmeGroup.baseUrl}/service-card',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? content(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class CreateServiceCardCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    FFUploadedFile? file,
    String? accessToken = '',
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'createServiceCard',
      apiUrl: '${SmeGroup.baseUrl}/service-card',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'data': data,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateServiceCardCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? dataJson,
    FFUploadedFile? file,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'updateServiceCard',
      apiUrl: '${SmeGroup.baseUrl}/service-card',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'data': data,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BookServiceCall {
  Future<ApiCallResponse> call({
    int? serviceId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bookService',
      apiUrl: '${SmeGroup.baseUrl}/service-card/bookService',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'serviceId': serviceId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProductServiceCardCall {
  Future<ApiCallResponse> call({
    int? serviceId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteProductServiceCard',
      apiUrl: '${SmeGroup.baseUrl}/service-card/deleteService',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'serviceId': serviceId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllBookingsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    bool? myBookings,
    String? startDate = '',
    int? pageNumber,
    int? pageSize,
    String? sortBy = '',
    String? sortOrder = '',
  }) async {
    final ffApiRequestBody = '''
{
  "myBookings": ${myBookings},
  "startDate": "${startDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAllBookings',
      apiUrl:
          '${SmeGroup.baseUrl}/service-card/getAllBookings?pageNumber=${pageNumber}&pageSize=${pageSize}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'x-base-href': 'http://smeconnect.cloudseed.io',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? bookings(dynamic response) => getJsonField(
        response,
        r'''$.bookings''',
        true,
      ) as List?;
}

class GetBookingsServiceCardCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBookingsServiceCard',
      apiUrl:
          '${SmeGroup.baseUrl}/service-card/getBookings?pageNumber=0&pageSize=10',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetServiceCategoriesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' getServiceCategories',
      apiUrl: '${SmeGroup.baseUrl}/service-card/getServiceCategories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? category(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetLatestServiceCardsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatestServiceCards',
      apiUrl: '${SmeGroup.baseUrl}/service-card/latest?userId=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLatestServiceCardsUserIdCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatestServiceCardsUserId',
      apiUrl: '${SmeGroup.baseUrl}/service-card/latest/{userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ReplyToBookingServiceCardCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'replyToBookingServiceCard',
      apiUrl: '${SmeGroup.baseUrl}/service-card/replyToBooking',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddServiceProviderCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'addServiceProvider',
      apiUrl: '${SmeGroup.baseUrl}/service-provider/addServiceProvider?data=a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddSmeProfileCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'addSmeProfile',
      apiUrl: '${SmeGroup.baseUrl}/sme/addSmeProfile?data=a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSmeProfileCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSmeProfile',
      apiUrl: '${SmeGroup.baseUrl}/sme/getSmeProfile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSmeStatsCall {
  Future<ApiCallResponse> call({
    String? filter = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getSmeStats',
      apiUrl: '${SmeGroup.baseUrl}/sme/getSmeStats',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'filter': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchSmeProfilesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchSmeProfiles',
      apiUrl:
          '${SmeGroup.baseUrl}/sme/searchSmeProfile?pageNumber=0&pageSize=10',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateAboutCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateAbout',
      apiUrl: '${SmeGroup.baseUrl}/sme/updateAbout',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddAboutCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: ' addAbout',
      apiUrl: '${SmeGroup.baseUrl}/user/addAbout?about=a',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddFollowerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? userId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addFollower',
      apiUrl: '${SmeGroup.baseUrl}/user/addFollower',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class AddStoryCall {
  Future<ApiCallResponse> call({
    String? future = '',
    String? futureTitle = '',
    String? now = '',
    String? nowTitle = '',
    String? past = '',
    String? pastTitle = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
"future": "${future}",
  "futureTitle": "${futureTitle}",
  "now": "${now}",
  "nowTitle": "${nowTitle}",
  "past": "${past}",
  "pastTitle": "${pastTitle}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'addStory',
      apiUrl: '${SmeGroup.baseUrl}/user/addStory',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ContactSmeCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'contactSme',
      apiUrl: '${SmeGroup.baseUrl}/user/contactSme',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ExportContactsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'exportContacts',
      apiUrl: '${SmeGroup.baseUrl}/user/exportContacts?fileType=a',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAboutCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAbout',
      apiUrl: '${SmeGroup.baseUrl}/user/getAbout?userId=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetFolloweesCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    int? userId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getFollowees',
      apiUrl: '${SmeGroup.baseUrl}/user/getFollowees',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? followingList(dynamic response) => getJsonField(
        response,
        r'''$.followList''',
        true,
      ) as List?;
}

class GetFollowersCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? sortBy = '',
    String? accessToken = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getFollowers',
      apiUrl: '${SmeGroup.baseUrl}/user/getFollowers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'sortBy': sortBy,
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic totalFollowers(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List? followList(dynamic response) => getJsonField(
        response,
        r'''$.followList''',
        true,
      ) as List?;
}

class GetHeaderBannerInfoCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getHeaderBannerInfo',
      apiUrl: '${SmeGroup.baseUrl}/user/getHeaderBanner',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? healthCheckContent(dynamic response) => getJsonField(
        response,
        r'''$.healthChecks''',
        true,
      ) as List?;
}

class GetHeaderBannerInfoUserIdCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getHeaderBannerInfoUserId',
      apiUrl: '${SmeGroup.baseUrl}/user/getHeaderBanner/{userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrgDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getOrgDetails',
      apiUrl: '${SmeGroup.baseUrl}/user/getOrgDetails',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPasswordLastUpdatedDateCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getPasswordLastUpdatedDate',
      apiUrl: '${SmeGroup.baseUrl}/user/getPasswordLastUpdated',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProfileDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProfileDetails',
      apiUrl: '${SmeGroup.baseUrl}/user/getProfileDetails',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-base-href': 'http://52.172.93.14',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTaggableUsersCall {
  Future<ApiCallResponse> call({
    String? companyNameWithChars = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTaggableUsers',
      apiUrl: '${SmeGroup.baseUrl}/user/getTaggableUsers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'companyNameWithChars': companyNameWithChars,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? taggableList(dynamic response) => getJsonField(
        response,
        r'''$[:].companyName''',
        true,
      ) as List?;
  dynamic taggableUesr(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserStoryCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserStory',
      apiUrl: '${SmeGroup.baseUrl}/user/getUserStory',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserStoryUserIdCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserStoryUserId',
      apiUrl: '${SmeGroup.baseUrl}/user/getUserStory/{userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserInfoCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserInfo',
      apiUrl: '${SmeGroup.baseUrl}/user/info',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BrnNumberCheckCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'brnNumberCheck',
      apiUrl: '${SmeGroup.baseUrl}/user/isBRNExist',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class IsFollowingCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? userId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' isFollowing',
      apiUrl: '${SmeGroup.baseUrl}/user/isFollowing',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UnFollowCall {
  Future<ApiCallResponse> call({
    int? followeeId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'unFollow',
      apiUrl: '${SmeGroup.baseUrl}/user/unFollow',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'followeeId': followeeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateBRNNumberCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateBRNNumber',
      apiUrl: '${SmeGroup.baseUrl}/user/updateBRN',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOrgDetailsCall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    String? accessToken = '',
    FFUploadedFile? file,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'updateOrgDetails',
      apiUrl: '${SmeGroup.baseUrl}/user/updateOrgDetails',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'data': data,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangeUserPasswordCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? newPassword = '',
    String? oldPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "newPassword": "${newPassword}",
  "oldPassword": "${oldPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'changeUserPassword',
      apiUrl: '${SmeGroup.baseUrl}/user/updatePassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? dataJson,
    FFUploadedFile? file,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'updateProfile',
      apiUrl: '${SmeGroup.baseUrl}/user/updateProfile',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'data': data,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTeamMemberListCall {
  Future<ApiCallResponse> call({
    int? userId = 0,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTeamMemberList',
      apiUrl: '${SmeGroup.baseUrl}/team-member/getTeamMemberList',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? teamList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class CreateTeamMemberCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    dynamic? dataJson,
    String? accessToken = '',
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'createTeamMember',
      apiUrl: '${SmeGroup.baseUrl}/team-member',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'file': file,
        'data': data,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTeamMemberCall {
  Future<ApiCallResponse> call({
    String? teamMemberId = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteTeamMember',
      apiUrl: '${SmeGroup.baseUrl}/team-member',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {
        'teamMemberId': teamMemberId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTeamMemberListPublicCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTeamMemberListPublic',
      apiUrl: '${SmeGroup.baseUrl}/team-member/getTeamMemberList?userId=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllUtilityCategoriesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllUtilityCategories',
      apiUrl: '${SmeGroup.baseUrl}/utility-category',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateUtilityCategoryCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'createUtilityCategory',
      apiUrl: '${SmeGroup.baseUrl}/utility-category',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUtilityCategoryCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateUtilityCategory',
      apiUrl: '${SmeGroup.baseUrl}/utility-category',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUtilityCategoryCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUtilityCategory',
      apiUrl: '${SmeGroup.baseUrl}/utility-category?utilityCategoryId=2',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllUtilityCategoriestwoCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllUtilityCategoriestwo',
      apiUrl: '${SmeGroup.baseUrl}/utility-category/getAllUtilityCategories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoryWiseGrowthCardsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryWiseGrowthCards',
      apiUrl: '${SmeGroup.baseUrl}/utility-category/getCategoryWiseGrowthCards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? growthCardViewList(dynamic response) => getJsonField(
        response,
        r'''$[:].growthCardViewList[:]''',
        true,
      ) as List?;
  List? categoryTitle(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List? groupList(dynamic response) => getJsonField(
        response,
        r'''$[:].growthCardViewList[:].groupsData[:]''',
        true,
      ) as List?;
}

class GetCategoryWiseGrowthPartnersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategoryWiseGrowthPartners',
      apiUrl: '${SmeGroup.baseUrl}/getCategoryWiseGrowthPartners',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllGrowthPatnersCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllGrowthPatners',
      apiUrl:
          '${SmeGroup.baseUrl}/utility-category/getFilteredUCGrowthPatners?category_ids=0&pageNumber=0&pageSize=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatePriorityOrderCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updatePriorityOrder',
      apiUrl: '${SmeGroup.baseUrl}/utility-category/updatePriorityOrder',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStatusCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateStatus',
      apiUrl: '${SmeGroup.baseUrl}/utility-category/updateStatus',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SetHelpfulnessCall {
  Future<ApiCallResponse> call({
    int? feedId,
    bool? helpful = true,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'setHelpfulness',
      apiUrl: '${SmeGroup.baseUrl}/feed/setHelpfulness',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'feedId': feedId,
        'helpful': helpful,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SetUnHelpfulnessCall {
  Future<ApiCallResponse> call({
    int? feedId,
    bool? unHelpful = true,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'setUnHelpfulness',
      apiUrl: '${SmeGroup.baseUrl}/feed/setUnHelpfulness',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {
        'feedId': feedId,
        'unHelpful': unHelpful,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SetForumHelpfulnessCall {
  Future<ApiCallResponse> call({
    bool? forumHelpful,
    int? forumId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'setForumHelpfulness',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/setForumHelpfulness',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'forumId': forumId,
        'forumHelpful': forumHelpful,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SetForumUnHelpfulnessCall {
  Future<ApiCallResponse> call({
    int? forumId,
    bool? forumUnHelpful,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'setForumUnHelpfulness',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/setForumUnHelpfulness',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {
        'forumId': forumId,
        'forumUnHelpful': forumUnHelpful,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTopActiveCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getTopActive',
      apiUrl: '${SmeGroup.baseUrl}/discussion-board/getTopActive',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? topActiveContent(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class GetMoreDetailsCall {
  Future<ApiCallResponse> call({
    int? growthPlanId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMoreDetails',
      apiUrl: '${SmeGroup.baseUrl}/growth-plans/getMoreDetails',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'growthPlanId': growthPlanId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? milestones(dynamic response) => getJsonField(
        response,
        r'''$.milestones''',
        true,
      ) as List?;
  List? milestoneDesc(dynamic response) => getJsonField(
        response,
        r'''$.milestones[:].milestoneDescription''',
        true,
      ) as List?;
  List? milestoneTasks(dynamic response) => getJsonField(
        response,
        r'''$.milestones[:].tasks''',
        true,
      ) as List?;
}

class RegisterUqudoSMECall {
  Future<ApiCallResponse> call({
    dynamic? dataJson,
    FFUploadedFile? faceImg,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: ' registerUqudoSME',
      apiUrl: '${SmeGroup.baseUrl}/auth/register-uq-sme',
      callType: ApiCallType.POST,
      headers: {
        'x-base-href': 'http://smeconnect-dev.southindia.cloudapp.azure.com',
      },
      params: {
        'data': data,
        'faceImg': faceImg,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBannerUserIdCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getBannerUserId',
      apiUrl: '${SmeGroup.baseUrl}/user/getBanner/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'text/plain',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateAiResponseCall {
  Future<ApiCallResponse> call({
    String? question = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "question": "${question}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'generateAiResponse',
      apiUrl: '${SmeGroup.baseUrl}/open-ai/generate-ai-response',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class UpdateBannerCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? accessToken = '',
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'updateBanner',
      apiUrl: '${SmeGroup.baseUrl}/user/updateBanner',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'userId': userId,
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EkybverifycompanyCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? companyName = '',
    String? companyRegion = '',
    String? tradeLicense = '',
  }) async {
    final ffApiRequestBody = '''
{
  "companyName": "${companyName}",
  "companyRegion": "${companyRegion}",
  "tradeLicense": "${tradeLicense}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ekybverifycompany',
      apiUrl: '${SmeGroup.baseUrl}/ekyb/verify-company',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.content.basic.companyStatus''',
      );
}

class SetVerifiedCompanyCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? companyName = '',
    String? companyStatus = '',
  }) async {
    final ffApiRequestBody = '''
{
  "companyName": "${companyName}",
  "companyStatus": "${companyStatus}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' setVerifiedCompany',
      apiUrl: '${SmeGroup.baseUrl}/user/verifiedCompanyStatus',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllServiceProvidersCall {
  Future<ApiCallResponse> call({
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllServiceProviders',
      apiUrl: '${SmeGroup.baseUrl}/service-provider/getAllServiceProviders',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? allServiceProvide(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class SearchServiceProvidersCall {
  Future<ApiCallResponse> call({
    String? categories = '',
    int? pageNumber,
    int? pageSize,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' SearchServiceProviders',
      apiUrl: '${SmeGroup.baseUrl}/search/SearchServiceProviders',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'categories': categories,
        'pageNumber': pageNumber,
        'pageSize': pageSize,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? serviceProvider(dynamic response) => getJsonField(
        response,
        r'''$.content''',
        true,
      ) as List?;
}

class GetMessagingUsersCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getMessagingUsers',
      apiUrl: '${SmeGroup.baseUrl}/messages/getMessagingUsers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic users(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetMessagesForUserCall {
  Future<ApiCallResponse> call({
    int? receiverId,
    int? senderId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getMessagesForUser',
      apiUrl: '${SmeGroup.baseUrl}/messages/getMessages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'receiverId': receiverId,
        'senderId': senderId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? chatList(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
}

class SendMessageCall {
  Future<ApiCallResponse> call({
    String? content = '',
    int? receiverId,
    int? senderId,
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "content": "${content}",
  "receiverId": ${receiverId},
  "senderId": ${senderId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: ' sendMessage',
      apiUrl: '${SmeGroup.baseUrl}/messages/saveMessage',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGroupsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGroups',
      apiUrl: '${SmeGroup.baseUrl}/getGroups',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? groups(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetAllJoinedGroupsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllJoinedGroups',
      apiUrl: '${SmeGroup.baseUrl}/getAllJoinedGroups',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? requestedgroups(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetMyGroupsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getMyGroups',
      apiUrl: '${SmeGroup.baseUrl}/getMyGroups',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReqJoinedGroupsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getReqJoinedGroups',
      apiUrl: '${SmeGroup.baseUrl}/getReqJoinedGroups',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class JoinGroupsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    dynamic? dataJson,
  }) async {
    final data = _serializeJson(dataJson);

    return ApiManager.instance.makeApiCall(
      callName: ' joinGroups',
      apiUrl: '${SmeGroup.baseUrl}/joinGroups',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Accept': '*/*',
      },
      params: {
        'data': data,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGroupBannerCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? groupId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getGroupBanner',
      apiUrl: '${SmeGroup.baseUrl}/getGroupBanner/${groupId}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetGroupDetailsCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    int? groupId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' getGroupDetails',
      apiUrl: '${SmeGroup.baseUrl}/getGroupDetails/${groupId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? membersList(dynamic response) => getJsonField(
        response,
        r'''$.groupMemberViews''',
        true,
      ) as List?;
}

class LeaveGroupCall {
  Future<ApiCallResponse> call({
    int? groupId,
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' leaveGroup',
      apiUrl: '${SmeGroup.baseUrl}/leaveGroup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      params: {
        'groupId': groupId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SME Group Code

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "text-davinci-003",
  "prompt": ["${prompt}"],
  "max_tokens" : 260,
  "temperature" : 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic createdTimestamp(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
  List<String>? receivedText(dynamic response) => (getJsonField(
        response,
        r'''$.choices[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

/// End OpenAI ChatGPT Group Code

/// Start uqudoVerifyAPI Group Code

class UqudoVerifyAPIGroup {
  static String baseUrl = 'https://auth.dev.uqudo.io';
  static Map<String, String> headers = {};
  static AuthApiCall authApiCall = AuthApiCall();
}

class AuthApiCall {
  Future<ApiCallResponse> call({
    String? grantType = 'client_credentials',
    String? clientId = 'e5b85ad8-f23e-4423-a0ca-f0bd14ea6f39',
    String? clientSecret = 'itebLa8FrRdHOguH1ocNUn88',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AUTH API',
      apiUrl: '${UqudoVerifyAPIGroup.baseUrl}/api/oauth/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'grant_type': grantType,
        'client_id': clientId,
        'client_secret': clientSecret,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic uqudoAccessToken(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
}

/// End uqudoVerifyAPI Group Code

/// Start Companyverification Group Code

class CompanyverificationGroup {
  static String baseUrl = 'https://kyb.dev.uqudo.io';
  static Map<String, String> headers = {};
  static KybApiCall kybApiCall = KybApiCall();
}

class KybApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    int? governmentId,
    String? countryOfRegistration = '',
    String? dataGroups = '',
    String? uqudoAccessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'KYB API',
      apiUrl: '${CompanyverificationGroup.baseUrl}/api/v1/companies',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${uqudoAccessToken}',
      },
      params: {
        'name': name,
        'governmentId': governmentId,
        'countryOfRegistration': countryOfRegistration,
        'dataGroups': dataGroups,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Companyverification Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
