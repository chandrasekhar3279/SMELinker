import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _token = await secureStorage.getString('ff_token') ?? _token;
    });
    await _safeInitAsync(() async {
      _localFile = await secureStorage.getString('ff_localFile') ?? _localFile;
    });
    await _safeInitAsync(() async {
      _myFeedLike = await secureStorage.getBool('ff_myFeedLike') ?? _myFeedLike;
    });
    await _safeInitAsync(() async {
      _myFeedDisLike =
          await secureStorage.getBool('ff_myFeedDisLike') ?? _myFeedDisLike;
    });
    await _safeInitAsync(() async {
      _file = await secureStorage.getString('ff_file') ?? _file;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_myStory') != null) {
        try {
          _myStory =
              jsonDecode(await secureStorage.getString('ff_myStory') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _accessToken =
          await secureStorage.getString('ff_accessToken') ?? _accessToken;
    });
    await _safeInitAsync(() async {
      _searchCategoryItems =
          await secureStorage.getStringList('ff_searchCategoryItems') ??
              _searchCategoryItems;
    });
    await _safeInitAsync(() async {
      _dummyIndisties =
          await secureStorage.getStringList('ff_dummyIndisties') ??
              _dummyIndisties;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _feedLike = false;
  bool get feedLike => _feedLike;
  set feedLike(bool _value) {
    _feedLike = _value;
  }

  bool _feedUnlike = false;
  bool get feedUnlike => _feedUnlike;
  set feedUnlike(bool _value) {
    _feedUnlike = _value;
  }

  bool _forumLike = false;
  bool get forumLike => _forumLike;
  set forumLike(bool _value) {
    _forumLike = _value;
  }

  bool _forumUnlike = false;
  bool get forumUnlike => _forumUnlike;
  set forumUnlike(bool _value) {
    _forumUnlike = _value;
  }

  bool _favorite = false;
  bool get favorite => _favorite;
  set favorite(bool _value) {
    _favorite = _value;
  }

  String _signUpSuccess = '';
  String get signUpSuccess => _signUpSuccess;
  set signUpSuccess(String _value) {
    _signUpSuccess = _value;
  }

  dynamic _signUpResponse;
  dynamic get signUpResponse => _signUpResponse;
  set signUpResponse(dynamic _value) {
    _signUpResponse = _value;
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    secureStorage.setString('ff_token', _value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_token');
  }

  List<dynamic> _feed = [];
  List<dynamic> get feed => _feed;
  set feed(List<dynamic> _value) {
    _feed = _value;
  }

  void addToFeed(dynamic _value) {
    _feed.add(_value);
  }

  void removeFromFeed(dynamic _value) {
    _feed.remove(_value);
  }

  void removeAtIndexFromFeed(int _index) {
    _feed.removeAt(_index);
  }

  void updateFeedAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _feed[_index] = updateFn(_feed[_index]);
  }

  void insertAtIndexInFeed(int _index, dynamic _value) {
    _feed.insert(_index, _value);
  }

  List<dynamic> _onlyFeed = [];
  List<dynamic> get onlyFeed => _onlyFeed;
  set onlyFeed(List<dynamic> _value) {
    _onlyFeed = _value;
  }

  void addToOnlyFeed(dynamic _value) {
    _onlyFeed.add(_value);
  }

  void removeFromOnlyFeed(dynamic _value) {
    _onlyFeed.remove(_value);
  }

  void removeAtIndexFromOnlyFeed(int _index) {
    _onlyFeed.removeAt(_index);
  }

  void updateOnlyFeedAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _onlyFeed[_index] = updateFn(_onlyFeed[_index]);
  }

  void insertAtIndexInOnlyFeed(int _index, dynamic _value) {
    _onlyFeed.insert(_index, _value);
  }

  List<dynamic> _product = [];
  List<dynamic> get product => _product;
  set product(List<dynamic> _value) {
    _product = _value;
  }

  void addToProduct(dynamic _value) {
    _product.add(_value);
  }

  void removeFromProduct(dynamic _value) {
    _product.remove(_value);
  }

  void removeAtIndexFromProduct(int _index) {
    _product.removeAt(_index);
  }

  void updateProductAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _product[_index] = updateFn(_product[_index]);
  }

  void insertAtIndexInProduct(int _index, dynamic _value) {
    _product.insert(_index, _value);
  }

  List<dynamic> _content = [];
  List<dynamic> get content => _content;
  set content(List<dynamic> _value) {
    _content = _value;
  }

  void addToContent(dynamic _value) {
    _content.add(_value);
  }

  void removeFromContent(dynamic _value) {
    _content.remove(_value);
  }

  void removeAtIndexFromContent(int _index) {
    _content.removeAt(_index);
  }

  void updateContentAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _content[_index] = updateFn(_content[_index]);
  }

  void insertAtIndexInContent(int _index, dynamic _value) {
    _content.insert(_index, _value);
  }

  dynamic _data =
      jsonDecode('{\"topic\":\"\",\"title\":\"\",\"description\":\"\"}');
  dynamic get data => _data;
  set data(dynamic _value) {
    _data = _value;
  }

  String _topic = '';
  String get topic => _topic;
  set topic(String _value) {
    _topic = _value;
  }

  String _title = '';
  String get title => _title;
  set title(String _value) {
    _title = _value;
  }

  String _description = '';
  String get description => _description;
  set description(String _value) {
    _description = _value;
  }

  List<dynamic> _toolsList = [];
  List<dynamic> get toolsList => _toolsList;
  set toolsList(List<dynamic> _value) {
    _toolsList = _value;
  }

  void addToToolsList(dynamic _value) {
    _toolsList.add(_value);
  }

  void removeFromToolsList(dynamic _value) {
    _toolsList.remove(_value);
  }

  void removeAtIndexFromToolsList(int _index) {
    _toolsList.removeAt(_index);
  }

  void updateToolsListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _toolsList[_index] = updateFn(_toolsList[_index]);
  }

  void insertAtIndexInToolsList(int _index, dynamic _value) {
    _toolsList.insert(_index, _value);
  }

  String _localFile = '';
  String get localFile => _localFile;
  set localFile(String _value) {
    _localFile = _value;
    secureStorage.setString('ff_localFile', _value);
  }

  void deleteLocalFile() {
    secureStorage.delete(key: 'ff_localFile');
  }

  List<dynamic> _growthCardViewList = [];
  List<dynamic> get growthCardViewList => _growthCardViewList;
  set growthCardViewList(List<dynamic> _value) {
    _growthCardViewList = _value;
  }

  void addToGrowthCardViewList(dynamic _value) {
    _growthCardViewList.add(_value);
  }

  void removeFromGrowthCardViewList(dynamic _value) {
    _growthCardViewList.remove(_value);
  }

  void removeAtIndexFromGrowthCardViewList(int _index) {
    _growthCardViewList.removeAt(_index);
  }

  void updateGrowthCardViewListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _growthCardViewList[_index] = updateFn(_growthCardViewList[_index]);
  }

  void insertAtIndexInGrowthCardViewList(int _index, dynamic _value) {
    _growthCardViewList.insert(_index, _value);
  }

  bool _myFeedLike = false;
  bool get myFeedLike => _myFeedLike;
  set myFeedLike(bool _value) {
    _myFeedLike = _value;
    secureStorage.setBool('ff_myFeedLike', _value);
  }

  void deleteMyFeedLike() {
    secureStorage.delete(key: 'ff_myFeedLike');
  }

  bool _myFeedDisLike = false;
  bool get myFeedDisLike => _myFeedDisLike;
  set myFeedDisLike(bool _value) {
    _myFeedDisLike = _value;
    secureStorage.setBool('ff_myFeedDisLike', _value);
  }

  void deleteMyFeedDisLike() {
    secureStorage.delete(key: 'ff_myFeedDisLike');
  }

  String _file = '';
  String get file => _file;
  set file(String _value) {
    _file = _value;
    secureStorage.setString('ff_file', _value);
  }

  void deleteFile() {
    secureStorage.delete(key: 'ff_file');
  }

  dynamic _myStory;
  dynamic get myStory => _myStory;
  set myStory(dynamic _value) {
    _myStory = _value;
    secureStorage.setString('ff_myStory', jsonEncode(_value));
  }

  void deleteMyStory() {
    secureStorage.delete(key: 'ff_myStory');
  }

  String _pdf = 'pdf';
  String get pdf => _pdf;
  set pdf(String _value) {
    _pdf = _value;
  }

  String _doc = 'doc';
  String get doc => _doc;
  set doc(String _value) {
    _doc = _value;
  }

  String _excel = 'excel';
  String get excel => _excel;
  set excel(String _value) {
    _excel = _value;
  }

  bool _submittedLoginForm = false;
  bool get submittedLoginForm => _submittedLoginForm;
  set submittedLoginForm(bool _value) {
    _submittedLoginForm = _value;
  }

  String _accessToken = '';
  String get accessToken => _accessToken;
  set accessToken(String _value) {
    _accessToken = _value;
    secureStorage.setString('ff_accessToken', _value);
  }

  void deleteAccessToken() {
    secureStorage.delete(key: 'ff_accessToken');
  }

  bool _submittedSignUpForm = false;
  bool get submittedSignUpForm => _submittedSignUpForm;
  set submittedSignUpForm(bool _value) {
    _submittedSignUpForm = _value;
  }

  bool _answerFieldState = false;
  bool get answerFieldState => _answerFieldState;
  set answerFieldState(bool _value) {
    _answerFieldState = _value;
  }

  bool _questionFieldState = false;
  bool get questionFieldState => _questionFieldState;
  set questionFieldState(bool _value) {
    _questionFieldState = _value;
  }

  bool _submittedNewPost = false;
  bool get submittedNewPost => _submittedNewPost;
  set submittedNewPost(bool _value) {
    _submittedNewPost = _value;
  }

  bool _showMenuEdit = false;
  bool get showMenuEdit => _showMenuEdit;
  set showMenuEdit(bool _value) {
    _showMenuEdit = _value;
  }

  bool _durationToSliderError = false;
  bool get durationToSliderError => _durationToSliderError;
  set durationToSliderError(bool _value) {
    _durationToSliderError = _value;
  }

  bool _showMoreDetails = false;
  bool get showMoreDetails => _showMoreDetails;
  set showMoreDetails(bool _value) {
    _showMoreDetails = _value;
  }

  bool _showProductActions = false;
  bool get showProductActions => _showProductActions;
  set showProductActions(bool _value) {
    _showProductActions = _value;
  }

  bool _showServiceActions = false;
  bool get showServiceActions => _showServiceActions;
  set showServiceActions(bool _value) {
    _showServiceActions = _value;
  }

  double _minServiceTimeRange = 0.0;
  double get minServiceTimeRange => _minServiceTimeRange;
  set minServiceTimeRange(double _value) {
    _minServiceTimeRange = _value;
  }

  double _maxServiceTimeRange = 0.0;
  double get maxServiceTimeRange => _maxServiceTimeRange;
  set maxServiceTimeRange(double _value) {
    _maxServiceTimeRange = _value;
  }

  double _minServiceCostRange = 0.0;
  double get minServiceCostRange => _minServiceCostRange;
  set minServiceCostRange(double _value) {
    _minServiceCostRange = _value;
  }

  double _maxServiceCostRange = 0.0;
  double get maxServiceCostRange => _maxServiceCostRange;
  set maxServiceCostRange(double _value) {
    _maxServiceCostRange = _value;
  }

  bool _myBookings = false;
  bool get myBookings => _myBookings;
  set myBookings(bool _value) {
    _myBookings = _value;
  }

  bool _submittedUpdateOrgDetailsForm = false;
  bool get submittedUpdateOrgDetailsForm => _submittedUpdateOrgDetailsForm;
  set submittedUpdateOrgDetailsForm(bool _value) {
    _submittedUpdateOrgDetailsForm = _value;
  }

  int _showMoreQstn = 0;
  int get showMoreQstn => _showMoreQstn;
  set showMoreQstn(int _value) {
    _showMoreQstn = _value;
  }

  bool _submitteAddServiceForm = false;
  bool get submitteAddServiceForm => _submitteAddServiceForm;
  set submitteAddServiceForm(bool _value) {
    _submitteAddServiceForm = _value;
  }

  bool _submittedChangePasswordForm = false;
  bool get submittedChangePasswordForm => _submittedChangePasswordForm;
  set submittedChangePasswordForm(bool _value) {
    _submittedChangePasswordForm = _value;
  }

  bool _submittedEditYourStoryForm = false;
  bool get submittedEditYourStoryForm => _submittedEditYourStoryForm;
  set submittedEditYourStoryForm(bool _value) {
    _submittedEditYourStoryForm = _value;
  }

  int _editProductItem = 0;
  int get editProductItem => _editProductItem;
  set editProductItem(int _value) {
    _editProductItem = _value;
  }

  bool _submittedAddProductForm = false;
  bool get submittedAddProductForm => _submittedAddProductForm;
  set submittedAddProductForm(bool _value) {
    _submittedAddProductForm = _value;
  }

  bool _submittedContactDetailsForm = false;
  bool get submittedContactDetailsForm => _submittedContactDetailsForm;
  set submittedContactDetailsForm(bool _value) {
    _submittedContactDetailsForm = _value;
  }

  bool _submittedAddTeamMemberForm = false;
  bool get submittedAddTeamMemberForm => _submittedAddTeamMemberForm;
  set submittedAddTeamMemberForm(bool _value) {
    _submittedAddTeamMemberForm = _value;
  }

  bool _submittedEditPersonalDetailsForm = false;
  bool get submittedEditPersonalDetailsForm =>
      _submittedEditPersonalDetailsForm;
  set submittedEditPersonalDetailsForm(bool _value) {
    _submittedEditPersonalDetailsForm = _value;
  }

  bool _submittedForgotPasswordForm = false;
  bool get submittedForgotPasswordForm => _submittedForgotPasswordForm;
  set submittedForgotPasswordForm(bool _value) {
    _submittedForgotPasswordForm = _value;
  }

  int _EditService = 0;
  int get EditService => _EditService;
  set EditService(int _value) {
    _EditService = _value;
  }

  int _editAnswerId = 0;
  int get editAnswerId => _editAnswerId;
  set editAnswerId(int _value) {
    _editAnswerId = _value;
  }

  String _bookingStatus = 'pending';
  String get bookingStatus => _bookingStatus;
  set bookingStatus(String _value) {
    _bookingStatus = _value;
  }

  int _forumAnswerInputQuestionId = 0;
  int get forumAnswerInputQuestionId => _forumAnswerInputQuestionId;
  set forumAnswerInputQuestionId(int _value) {
    _forumAnswerInputQuestionId = _value;
  }

  dynamic _userAnswers;
  dynamic get userAnswers => _userAnswers;
  set userAnswers(dynamic _value) {
    _userAnswers = _value;
  }

  int _feedIdToToggle = 0;
  int get feedIdToToggle => _feedIdToToggle;
  set feedIdToToggle(int _value) {
    _feedIdToToggle = _value;
  }

  bool _helpful = false;
  bool get helpful => _helpful;
  set helpful(bool _value) {
    _helpful = _value;
  }

  bool _unhelpful = false;
  bool get unhelpful => _unhelpful;
  set unhelpful(bool _value) {
    _unhelpful = _value;
  }

  String _bookingReplyMessage = '';
  String get bookingReplyMessage => _bookingReplyMessage;
  set bookingReplyMessage(String _value) {
    _bookingReplyMessage = _value;
  }

  dynamic _healthCheckAnswers = jsonDecode('{}');
  dynamic get healthCheckAnswers => _healthCheckAnswers;
  set healthCheckAnswers(dynamic _value) {
    _healthCheckAnswers = _value;
  }

  String _dummy = '';
  String get dummy => _dummy;
  set dummy(String _value) {
    _dummy = _value;
  }

  bool _isPublic = false;
  bool get isPublic => _isPublic;
  set isPublic(bool _value) {
    _isPublic = _value;
  }

  List<String> _searchCategoryItems = [
    'Companies',
    'Service Cards',
    'Growth Partners',
    'Newsfeed Posts',
    'Growth Cards',
    'Products'
  ];
  List<String> get searchCategoryItems => _searchCategoryItems;
  set searchCategoryItems(List<String> _value) {
    _searchCategoryItems = _value;
    secureStorage.setStringList('ff_searchCategoryItems', _value);
  }

  void deleteSearchCategoryItems() {
    secureStorage.delete(key: 'ff_searchCategoryItems');
  }

  void addToSearchCategoryItems(String _value) {
    _searchCategoryItems.add(_value);
    secureStorage.setStringList('ff_searchCategoryItems', _searchCategoryItems);
  }

  void removeFromSearchCategoryItems(String _value) {
    _searchCategoryItems.remove(_value);
    secureStorage.setStringList('ff_searchCategoryItems', _searchCategoryItems);
  }

  void removeAtIndexFromSearchCategoryItems(int _index) {
    _searchCategoryItems.removeAt(_index);
    secureStorage.setStringList('ff_searchCategoryItems', _searchCategoryItems);
  }

  void updateSearchCategoryItemsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchCategoryItems[_index] = updateFn(_searchCategoryItems[_index]);
    secureStorage.setStringList('ff_searchCategoryItems', _searchCategoryItems);
  }

  void insertAtIndexInSearchCategoryItems(int _index, String _value) {
    _searchCategoryItems.insert(_index, _value);
    secureStorage.setStringList('ff_searchCategoryItems', _searchCategoryItems);
  }

  String _documentTypeUqudo = '';
  String get documentTypeUqudo => _documentTypeUqudo;
  set documentTypeUqudo(String _value) {
    _documentTypeUqudo = _value;
  }

  dynamic _uqudoResponse;
  dynamic get uqudoResponse => _uqudoResponse;
  set uqudoResponse(dynamic _value) {
    _uqudoResponse = _value;
  }

  int _editCommentID = 0;
  int get editCommentID => _editCommentID;
  set editCommentID(int _value) {
    _editCommentID = _value;
  }

  List<String> _criteriaSelected = [];
  List<String> get criteriaSelected => _criteriaSelected;
  set criteriaSelected(List<String> _value) {
    _criteriaSelected = _value;
  }

  void addToCriteriaSelected(String _value) {
    _criteriaSelected.add(_value);
  }

  void removeFromCriteriaSelected(String _value) {
    _criteriaSelected.remove(_value);
  }

  void removeAtIndexFromCriteriaSelected(int _index) {
    _criteriaSelected.removeAt(_index);
  }

  void updateCriteriaSelectedAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _criteriaSelected[_index] = updateFn(_criteriaSelected[_index]);
  }

  void insertAtIndexInCriteriaSelected(int _index, String _value) {
    _criteriaSelected.insert(_index, _value);
  }

  List<String> _chatHistory = [];
  List<String> get chatHistory => _chatHistory;
  set chatHistory(List<String> _value) {
    _chatHistory = _value;
  }

  void addToChatHistory(String _value) {
    _chatHistory.add(_value);
  }

  void removeFromChatHistory(String _value) {
    _chatHistory.remove(_value);
  }

  void removeAtIndexFromChatHistory(int _index) {
    _chatHistory.removeAt(_index);
  }

  void updateChatHistoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _chatHistory[_index] = updateFn(_chatHistory[_index]);
  }

  void insertAtIndexInChatHistory(int _index, String _value) {
    _chatHistory.insert(_index, _value);
  }

  bool _dummyBoolean = false;
  bool get dummyBoolean => _dummyBoolean;
  set dummyBoolean(bool _value) {
    _dummyBoolean = _value;
  }

  dynamic _uqudoResponseProfileImage;
  dynamic get uqudoResponseProfileImage => _uqudoResponseProfileImage;
  set uqudoResponseProfileImage(dynamic _value) {
    _uqudoResponseProfileImage = _value;
  }

  bool _digitalOnboardLoading = false;
  bool get digitalOnboardLoading => _digitalOnboardLoading;
  set digitalOnboardLoading(bool _value) {
    _digitalOnboardLoading = _value;
  }

  bool _subAnswerShow = false;
  bool get subAnswerShow => _subAnswerShow;
  set subAnswerShow(bool _value) {
    _subAnswerShow = _value;
  }

  bool _showForumQuestionActions = false;
  bool get showForumQuestionActions => _showForumQuestionActions;
  set showForumQuestionActions(bool _value) {
    _showForumQuestionActions = _value;
  }

  bool _showForumAnswerActions = false;
  bool get showForumAnswerActions => _showForumAnswerActions;
  set showForumAnswerActions(bool _value) {
    _showForumAnswerActions = _value;
  }

  List<String> _interestIndustries = [];
  List<String> get interestIndustries => _interestIndustries;
  set interestIndustries(List<String> _value) {
    _interestIndustries = _value;
  }

  void addToInterestIndustries(String _value) {
    _interestIndustries.add(_value);
  }

  void removeFromInterestIndustries(String _value) {
    _interestIndustries.remove(_value);
  }

  void removeAtIndexFromInterestIndustries(int _index) {
    _interestIndustries.removeAt(_index);
  }

  void updateInterestIndustriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _interestIndustries[_index] = updateFn(_interestIndustries[_index]);
  }

  void insertAtIndexInInterestIndustries(int _index, String _value) {
    _interestIndustries.insert(_index, _value);
  }

  bool _interestAvailable = false;
  bool get interestAvailable => _interestAvailable;
  set interestAvailable(bool _value) {
    _interestAvailable = _value;
  }

  bool _intesrestPopup = false;
  bool get intesrestPopup => _intesrestPopup;
  set intesrestPopup(bool _value) {
    _intesrestPopup = _value;
  }

  List<dynamic> _taggableUsersList = [];
  List<dynamic> get taggableUsersList => _taggableUsersList;
  set taggableUsersList(List<dynamic> _value) {
    _taggableUsersList = _value;
  }

  void addToTaggableUsersList(dynamic _value) {
    _taggableUsersList.add(_value);
  }

  void removeFromTaggableUsersList(dynamic _value) {
    _taggableUsersList.remove(_value);
  }

  void removeAtIndexFromTaggableUsersList(int _index) {
    _taggableUsersList.removeAt(_index);
  }

  void updateTaggableUsersListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _taggableUsersList[_index] = updateFn(_taggableUsersList[_index]);
  }

  void insertAtIndexInTaggableUsersList(int _index, dynamic _value) {
    _taggableUsersList.insert(_index, _value);
  }

  String _selectedTaggedCompanyName = '';
  String get selectedTaggedCompanyName => _selectedTaggedCompanyName;
  set selectedTaggedCompanyName(String _value) {
    _selectedTaggedCompanyName = _value;
  }

  String _taggedCompanyName = '';
  String get taggedCompanyName => _taggedCompanyName;
  set taggedCompanyName(String _value) {
    _taggedCompanyName = _value;
  }

  bool _tagListPopup = false;
  bool get tagListPopup => _tagListPopup;
  set tagListPopup(bool _value) {
    _tagListPopup = _value;
  }

  bool _showRepliedPageQuestionActions = false;
  bool get showRepliedPageQuestionActions => _showRepliedPageQuestionActions;
  set showRepliedPageQuestionActions(bool _value) {
    _showRepliedPageQuestionActions = _value;
  }

  bool _showRepliedPageAnswerActions = false;
  bool get showRepliedPageAnswerActions => _showRepliedPageAnswerActions;
  set showRepliedPageAnswerActions(bool _value) {
    _showRepliedPageAnswerActions = _value;
  }

  bool _showFeedCommentActions = false;
  bool get showFeedCommentActions => _showFeedCommentActions;
  set showFeedCommentActions(bool _value) {
    _showFeedCommentActions = _value;
  }

  List<dynamic> _taggedCompanyList = [];
  List<dynamic> get taggedCompanyList => _taggedCompanyList;
  set taggedCompanyList(List<dynamic> _value) {
    _taggedCompanyList = _value;
  }

  void addToTaggedCompanyList(dynamic _value) {
    _taggedCompanyList.add(_value);
  }

  void removeFromTaggedCompanyList(dynamic _value) {
    _taggedCompanyList.remove(_value);
  }

  void removeAtIndexFromTaggedCompanyList(int _index) {
    _taggedCompanyList.removeAt(_index);
  }

  void updateTaggedCompanyListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _taggedCompanyList[_index] = updateFn(_taggedCompanyList[_index]);
  }

  void insertAtIndexInTaggedCompanyList(int _index, dynamic _value) {
    _taggedCompanyList.insert(_index, _value);
  }

  List<String> _browseIndustries = [];
  List<String> get browseIndustries => _browseIndustries;
  set browseIndustries(List<String> _value) {
    _browseIndustries = _value;
  }

  void addToBrowseIndustries(String _value) {
    _browseIndustries.add(_value);
  }

  void removeFromBrowseIndustries(String _value) {
    _browseIndustries.remove(_value);
  }

  void removeAtIndexFromBrowseIndustries(int _index) {
    _browseIndustries.removeAt(_index);
  }

  void updateBrowseIndustriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _browseIndustries[_index] = updateFn(_browseIndustries[_index]);
  }

  void insertAtIndexInBrowseIndustries(int _index, String _value) {
    _browseIndustries.insert(_index, _value);
  }

  String _browseCategories = '';
  String get browseCategories => _browseCategories;
  set browseCategories(String _value) {
    _browseCategories = _value;
  }

  bool _SelectAllIndustries = false;
  bool get SelectAllIndustries => _SelectAllIndustries;
  set SelectAllIndustries(bool _value) {
    _SelectAllIndustries = _value;
  }

  List<String> _browseentrepenur = [];
  List<String> get browseentrepenur => _browseentrepenur;
  set browseentrepenur(List<String> _value) {
    _browseentrepenur = _value;
  }

  void addToBrowseentrepenur(String _value) {
    _browseentrepenur.add(_value);
  }

  void removeFromBrowseentrepenur(String _value) {
    _browseentrepenur.remove(_value);
  }

  void removeAtIndexFromBrowseentrepenur(int _index) {
    _browseentrepenur.removeAt(_index);
  }

  void updateBrowseentrepenurAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _browseentrepenur[_index] = updateFn(_browseentrepenur[_index]);
  }

  void insertAtIndexInBrowseentrepenur(int _index, String _value) {
    _browseentrepenur.insert(_index, _value);
  }

  bool _submittedEditServiceForm = false;
  bool get submittedEditServiceForm => _submittedEditServiceForm;
  set submittedEditServiceForm(bool _value) {
    _submittedEditServiceForm = _value;
  }

  String _browseServiceProvider = '';
  String get browseServiceProvider => _browseServiceProvider;
  set browseServiceProvider(String _value) {
    _browseServiceProvider = _value;
  }

  String _taggedEnterprenurName = '';
  String get taggedEnterprenurName => _taggedEnterprenurName;
  set taggedEnterprenurName(String _value) {
    _taggedEnterprenurName = _value;
  }

  List<String> _dummyIndisties = [
    'Advertising, Marketing & Design',
    'Computer, ICT Equipment and Services, Network Security',
    'Food Production & Processing (incl. dairy & sugar)',
    'Media Production or Broadcast incl. Newspapers and Magazines',
    'Writing & Editing, Content Creation'
  ];
  List<String> get dummyIndisties => _dummyIndisties;
  set dummyIndisties(List<String> _value) {
    _dummyIndisties = _value;
    secureStorage.setStringList('ff_dummyIndisties', _value);
  }

  void deleteDummyIndisties() {
    secureStorage.delete(key: 'ff_dummyIndisties');
  }

  void addToDummyIndisties(String _value) {
    _dummyIndisties.add(_value);
    secureStorage.setStringList('ff_dummyIndisties', _dummyIndisties);
  }

  void removeFromDummyIndisties(String _value) {
    _dummyIndisties.remove(_value);
    secureStorage.setStringList('ff_dummyIndisties', _dummyIndisties);
  }

  void removeAtIndexFromDummyIndisties(int _index) {
    _dummyIndisties.removeAt(_index);
    secureStorage.setStringList('ff_dummyIndisties', _dummyIndisties);
  }

  void updateDummyIndistiesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _dummyIndisties[_index] = updateFn(_dummyIndisties[_index]);
    secureStorage.setStringList('ff_dummyIndisties', _dummyIndisties);
  }

  void insertAtIndexInDummyIndisties(int _index, String _value) {
    _dummyIndisties.insert(_index, _value);
    secureStorage.setStringList('ff_dummyIndisties', _dummyIndisties);
  }

  String _roleName = 'SME';
  String get roleName => _roleName;
  set roleName(String _value) {
    _roleName = _value;
  }

  bool _join = false;
  bool get join => _join;
  set join(bool _value) {
    _join = _value;
  }

  String _joinStatus = 'join';
  String get joinStatus => _joinStatus;
  set joinStatus(String _value) {
    _joinStatus = _value;
  }

  String _roleStatus = 'member';
  String get roleStatus => _roleStatus;
  set roleStatus(String _value) {
    _roleStatus = _value;
  }

  bool _groupsearch = false;
  bool get groupsearch => _groupsearch;
  set groupsearch(bool _value) {
    _groupsearch = _value;
  }

  bool _selectGroupsPopup = false;
  bool get selectGroupsPopup => _selectGroupsPopup;
  set selectGroupsPopup(bool _value) {
    _selectGroupsPopup = _value;
  }

  List<int> _groupsData = [];
  List<int> get groupsData => _groupsData;
  set groupsData(List<int> _value) {
    _groupsData = _value;
  }

  void addToGroupsData(int _value) {
    _groupsData.add(_value);
  }

  void removeFromGroupsData(int _value) {
    _groupsData.remove(_value);
  }

  void removeAtIndexFromGroupsData(int _index) {
    _groupsData.removeAt(_index);
  }

  void updateGroupsDataAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _groupsData[_index] = updateFn(_groupsData[_index]);
  }

  void insertAtIndexInGroupsData(int _index, int _value) {
    _groupsData.insert(_index, _value);
  }

  bool _groupsAvailable = false;
  bool get groupsAvailable => _groupsAvailable;
  set groupsAvailable(bool _value) {
    _groupsAvailable = _value;
  }

  String _uploadCroppedImage = '';
  String get uploadCroppedImage => _uploadCroppedImage;
  set uploadCroppedImage(String _value) {
    _uploadCroppedImage = _value;
  }

  List<int> _croppedImageBytes = [];
  List<int> get croppedImageBytes => _croppedImageBytes;
  set croppedImageBytes(List<int> _value) {
    _croppedImageBytes = _value;
  }

  void addToCroppedImageBytes(int _value) {
    _croppedImageBytes.add(_value);
  }

  void removeFromCroppedImageBytes(int _value) {
    _croppedImageBytes.remove(_value);
  }

  void removeAtIndexFromCroppedImageBytes(int _index) {
    _croppedImageBytes.removeAt(_index);
  }

  void updateCroppedImageBytesAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _croppedImageBytes[_index] = updateFn(_croppedImageBytes[_index]);
  }

  void insertAtIndexInCroppedImageBytes(int _index, int _value) {
    _croppedImageBytes.insert(_index, _value);
  }

  String _croppedImage = '';
  String get croppedImage => _croppedImage;
  set croppedImage(String _value) {
    _croppedImage = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
