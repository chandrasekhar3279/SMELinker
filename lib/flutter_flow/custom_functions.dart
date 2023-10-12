import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

dynamic shareFeed(
  String? title,
  String? topic,
  String? feedUrl,
  String? description,
) {
  return {
    "title": title,
    "topic": topic,
    "feedUrl": feedUrl,
    "description": description
  };
}

dynamic getInTouch(
  String? address,
  String? email,
  String? website,
  String? linkedin,
  String? contactNo,
) {
  return {
    "address": address,
    "email": email,
    "website": website,
    "linkedin": linkedin,
    "contactNo": contactNo
  };
}

dynamic addTeammember(
  String? empName,
  String? empPosition,
  String? linkedin,
) {
  return {"empName": empName, "empPosition": empPosition, "linkedin": linkedin};
}

dynamic image(String imagepath) {
  if (imagepath == "null") {
    return {
      "image":
          "http://smeconnectdev.cloudseed.io/assets/images/news/newsfeed-square.jpg"
    };
  }
  if (imagepath == "") {
    return {
      "image":
          "http://smeconnectdev.cloudseed.io/assets/images/news/newsfeed-square.jpg"
    };
  }
  return {"image": "http://smeconnectdev.cloudseed.io" + imagepath};
}

String submitedDate(int date) {
  // Convert Integer to Dateformat
  var dateTime = DateTime.fromMillisecondsSinceEpoch(date);
  var now = DateTime.now();
  var diff = now.difference(dateTime);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    time = timeago.format(dateTime);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + 'd';
    } else {
      time = diff.inDays.toString() + 'd';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' W';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' W';
    }
  }

  return time;
}

String getQuestionsCount(List<dynamic> questions) {
  int numOfQuestions = questions.length;
  return "${numOfQuestions.toString()} questions";
}

List<String> getAnswers(List<dynamic> answers) {
  return answers.map((answer) => answer.answer as String).toList();
}

dynamic forumQuestionReq(String? question) {
  return {"question": question};
}

dynamic updateProfile(
  String firstName,
  String lastName,
  String title,
  String email,
) {
  return {
    "firstName": firstName,
    "lastName": lastName,
    "title": title,
    "email": email
  };
}

dynamic addFollower(int? userId) {
  return {"userId": userId};
}

dynamic updateOrgDetails(
  String companyName,
  String brnNumber,
  String industry,
  String incorporationYear,
  String about,
  String tradeLicense,
  String companyRegion,
) {
  return {
    "companyName": companyName,
    "brnNumber": brnNumber,
    "industry": industry,
    "incorporationYear": incorporationYear,
    "about": about,
    "tradeLicense": tradeLicense,
    "companyRegion": companyRegion
  };
}

dynamic downloadGcidPdf(
  String? serviceDescriptionUrl,
  int gcId,
) {
  if (serviceDescriptionUrl != null) {
    return {
      "downloadGcidPdf":
          'http://52.172.93.14/api/growth-cards/viewGCAsPDF?gcId=$gcId'
    };
  }
}

dynamic addProducts(
  String name,
  String description,
  String category,
  String price,
  int? id,
) {
  return {
    "name": name,
    "description": description,
    "category": category,
    "price": price,
    "id": id
  };
}

int splitServiceCost(
  String priceRange,
  String? getValue,
) {
  List<String> parts = priceRange.split(' - ');

  if (getValue == "min") {
    return int.parse(parts[0]);
  } else {
    return int.parse(parts[1]);
  }
}

dynamic addNewService(
  String serviceName,
  String description,
  String category,
  String costEstimate,
  String timeEstimate,
) {
  return {
    "serviceName": serviceName,
    "description": description,
    "category": category,
    "costEstimate": costEstimate,
    "timeEstimate": timeEstimate
  };
}

List<dynamic> incorporationYearList() {
  List<Map<String, dynamic>> yearList = [];

  int currentYear = DateTime.now().year;
  for (int year = 1920; year <= currentYear; year++) {
    Map<String, dynamic> yearData = {
      'year': year,
      // add other data fields here
    };
    yearList.add(yearData);
  }
  return yearList;
}

dynamic splitServiceTime(
  String timeStamp,
  String? getValue,
) {
  List<String> parts = timeStamp.split(' ');

  if (getValue == 'min') {
    return int.parse(parts[0]);
  } else if (getValue == 'max') {
    return int.parse(parts[2]);
  } else {
    return parts[3];
  }
}

String? convertFirstLetterCapital(String status) {
  String capitalizedText = status[0].toUpperCase() + status.substring(1);

  return capitalizedText; // "This is an example response"
}

bool userAnswerSelection(
  int? questionId,
  int? answerId,
  dynamic userAnswers,
) {
  if (userAnswers) {
    if (userAnswers[questionId.toString()] == answerId) {
      return true;
    }
  }
  return false;
}

double? convertProgressValue(double progressValue) {
  double num = progressValue;
  double decimal = num / 100.0;
  return decimal;
}

int? sumOfCount(dynamic growthCardsCount) {
  List<dynamic> myArray = growthCardsCount;

  num totalCount = 0;

  for (int i = 0; i < myArray.length; i++) {
    totalCount += myArray[i].length;
  }
  return totalCount.toInt();
}

dynamic updateUserAnswers(
  int? questionId,
  int? answerId,
  dynamic userAnswers,
) {
  if (userAnswers == null) {
    userAnswers = {};
  }
  userAnswers[questionId.toString()] = answerId;
  return userAnswers;
}

double convertStringToDouble(String stringToChange) {
  return double.parse(stringToChange);
}

dynamic bookingsReplyTemplate(
  String? bookedBy,
  String? productOrServiceName,
  String? companyName,
  String? email,
  String? phone,
  String? firstName,
  String? lastName,
) {
  final message =
      "Hi $bookedBy,\n\nWe've successfully received your request for the $productOrServiceName.\nLet's discuss and agree on the next steps. \n\nYou can reach out to us with the following details:\nCompany: $companyName\nEmail: $email\nPhone: $phone\n\nLooking forward to working with you. \n      \nRegards, \n$firstName $lastName";
  return jsonEncode(message);
}

dynamic answersSelection(
  int? questionId,
  int? answerId,
) {
  return {"questionId": questionId, "answerId": answerId};
}

dynamic getHealthCheckAnswers(
  dynamic healthCheckAnswers,
  String? answeredTopic,
  int? questionId,
  int? answerId,
  int? healthCheckId,
) {
  // Check if the healthCheckId already exists in the Map.
  bool healthCheckIdExists = false;
  int topicIndex = 0;
  if (healthCheckAnswers['healthCheckId'] == healthCheckId) {
    healthCheckIdExists = true;
    List<dynamic> topicList = healthCheckAnswers['topic'];
    for (int i = 0; i < topicList.length; i++) {
      Map<String, dynamic> topicMap = topicList[i];
      if (topicMap['topic'] == answeredTopic) {
        topicIndex = i;
        break;
      }
    }
  }

  // If the healthCheckId exists, add the new data to the relevant fields.
  if (healthCheckIdExists) {
    List<dynamic> answerList =
        healthCheckAnswers['topic'][topicIndex]['answers'];
    Map<String, dynamic> answerMap = {
      'answerId': answerId,
      'questionId': questionId
    };
    answerList.add(answerMap);
  } else {
    // If the healthCheckId doesn't exist, create a new Map with the new data.
    Map<String, dynamic> answerMap = {
      'answerId': answerId,
      'questionId': questionId
    };
    List<dynamic> answerList = [answerMap];
    Map<String, dynamic> topicMap = {
      'topic': answeredTopic,
      'answers': answerList
    };
    List<dynamic> topicList = [topicMap];
    healthCheckAnswers = {'healthCheckId': healthCheckId, 'topic': topicList};
  }

  // Convert the Map back to a JSON string and return it.
  return healthCheckAnswers;
}

int? lengthOfMyArray(List<dynamic> myArray) {
  var array = myArray;
  return array.length;
}

dynamic editAddnewService(
  String serviceName,
  String description,
  String category,
  String costEstimate,
  String timeEstimate,
  int id,
) {
  return {
    "serviceName": serviceName,
    "description": description,
    "category": category,
    "costEstimate": costEstimate,
    "timeEstimate": timeEstimate,
    "id": id
  };
}

String submittedDateString(String submitteddate) {
  String timestampString = submitteddate;
  DateTime timestamp =
      DateFormat('d MMM yyyy HH:mm:ss zzz').parseUtc(timestampString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(timestamp);

  String differenceString;

  if (difference.inSeconds < 60) {
    differenceString = '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes < 60) {
    differenceString = '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    differenceString = '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    differenceString = '${difference.inDays} days ago';
  } else {
    differenceString = '${(difference.inDays / 7).floor()} weeks ago';
  }
  return differenceString;
}

List<String> saveChatHistory(
  List<String> chatHistory,
  String newChat,
  String initialChatSetup,
) {
  if (chatHistory.length == 0) {
    chatHistory.add(initialChatSetup + newChat);
  } else {
    chatHistory.add(newChat.trim());
  }

  return chatHistory;
}

String removeFromString(
  String inputValue,
  String removeValue,
) {
  String outputString = inputValue.replaceAll(removeValue, '').trim();
  return outputString;
}

String profilePicName(String name) {
  return name.substring(0, 1).toUpperCase();
}

dynamic registerUqudoSMEPayloadData(
  String firstName,
  String lastName,
  String position,
  String brnNumber,
  String email,
  String companyName,
  bool smeconnectCustomer,
  String industry,
  String heardFrom,
  String password,
) {
  return {
    "firstName": firstName,
    "lastName": lastName,
    "position": position,
    "brnNumber": brnNumber,
    "email": email,
    "companyName": companyName,
    "smeconnectCustomer": smeconnectCustomer,
    "industry": industry,
    "heardFrom": heardFrom,
    "password": password
  };
}

bool showHealthCheckBadge(
  dynamic healthCheckItems,
  String? badgeName,
) {
  if (healthCheckItems != null) {
    if (healthCheckItems is! List) {
      var newhealthCheckItems = [healthCheckItems];
      if (newhealthCheckItems.contains(badgeName)) {
        return true;
      }
    } else if (healthCheckItems.contains(badgeName)) {
      return true;
    }
  } else {
    return false;
  }

  return false;
}

dynamic healthCheckQuizData(
  dynamic healthCheckContentResponse,
  dynamic getUserSavedResponse,
) {
  dynamic data;
  var alldone = true;

  if (healthCheckContentResponse.isNotEmpty) {
    var currTopAnsCount = 0;
    data = healthCheckContentResponse['topic']
        .map((dynamic healthCheckContentItem) {
      currTopAnsCount = 0;
      return {
        "topic": healthCheckContentItem['topic'],
        "questions":
            healthCheckContentItem['questions'].map((resContentQuestion) {
          var doneFlag = false;

          if (!getUserSavedResponse.containsKey('error')) {
            getUserSavedResponse['topic'].forEach((savedResponseItem) {
              if (savedResponseItem['topic'] ==
                  healthCheckContentItem['topic']) {
                savedResponseItem['answers'].forEach((savedAnswer) {
                  if (savedAnswer['questionId'] == resContentQuestion['id']) {
                    currTopAnsCount++;
                    doneFlag = true;
                  }
                });
              }
            });
          }

          if (doneFlag == false) {
            alldone = false;
          }
          return {
            "question": resContentQuestion['question'],
            "id": resContentQuestion['id'],
            "done": doneFlag,
            "answerDescription": resContentQuestion['answerDescription'],
            "answers": resContentQuestion['answers'].map((resContentAnswers) {
              resContentAnswers['selected'] = false;

              if (!getUserSavedResponse.containsKey('error')) {
                getUserSavedResponse['topic'].forEach((savedResponseItem) {
                  if (savedResponseItem['topic'] ==
                      healthCheckContentItem['topic']) {
                    if (savedResponseItem['answers'].isNotEmpty) {
                      savedResponseItem['answers'].forEach((answerItem) {
                        if (answerItem['answerId'] == resContentAnswers['id']) {
                          resContentAnswers['selected'] = true;
                        }
                      });
                    }
                  }
                });
              }

              return resContentAnswers;
            }).toList()
          };
        }).toList(),
        "currTopAnsCount": currTopAnsCount,
        "done": alldone
      };
    }).toList();
  }

  var requiredData = data;

  return requiredData;
}

String? filterByDate(String? filterby) {
  DateTime currentDate = DateTime.now();
  DateTime date;

  switch (filterby) {
    case 'Last 7 days':
      date = currentDate.subtract(Duration(days: 7));
      break;
    case 'Last month':
      date = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
      break;
    case 'Last 3 months':
      date = DateTime(currentDate.year, currentDate.month - 3, currentDate.day);
      break;
    default:
      return null;
  }

  return DateFormat('yyyy-MM-dd').format(date);
}

int answersCountVal(int? commentsCount) {
  int? originalValue = commentsCount;
  int? result = originalValue! - 1;

  return result;
}

List<dynamic> selectHealthCheckAnswer(
  List<dynamic> allOptions,
  int selectedOptionId,
) {
  return allOptions.map((option) {
    if (option['id'] == selectedOptionId) {
      return {...option, 'selected': true};
    } else {
      return {...option, 'selected': false};
    }
  }).toList();
}

dynamic saveUserResponsePayload(
  dynamic healthCheckContent,
  dynamic savedUserResponses,
  String newAnswerTopic,
  int selectedQuestionId,
  int selectedOptionId,
) {
  var payload;

  // check if user has taken quiz before
  if (savedUserResponses.containsKey('error')) {
    // if user has not taken the quiz before

    var answersList = healthCheckContent['topic'].map((category) {
      return {"topic": category['topic'], "answers": []};
    }).toList();

    int topicIndex = -1;
    for (int i = 0; i < answersList.length; i++) {
      // find the index of newAnswerTopic in answersList
      if (answersList[i]['topic'] == newAnswerTopic) {
        topicIndex = i;
      }
    }

    // adding the selectedAnswer to the answersList at index
    answersList[topicIndex]['answers']
        .add({'answerId': selectedOptionId, 'questionId': selectedQuestionId});

    // payload for saving an answer for new quiz
    payload = {
      "healthCheckId": healthCheckContent['healthCheckId'],
      "topic": answersList
    };
  } else {
    // if user has taken the quiz before

    var savedAnswers = savedUserResponses;
    bool topicExists = false;
    int topicIndex = -1;

    // check if newAnswertopic exists
    for (int i = 0; i < savedAnswers['topic'].length; i++) {
      if (savedAnswers['topic'][i]['topic'] == newAnswerTopic) {
        topicExists = true;
        topicIndex = i;
        break;
      }
    }

    // if newAnswertopic exists
    if (topicExists) {
      List<dynamic> answersList = savedAnswers['topic'][topicIndex]['answers'];
      bool questionExists = false;
      int answerIndex = -1;

      for (int i = 0; i < answersList.length; i++) {
        // check if selectedQuestionId exists in answersList
        if (answersList[i]['questionId'] == selectedQuestionId) {
          questionExists = true;
          answerIndex = i;
          break;
        }
      }

      // if selectedQuestionId exists, modify the answerId to selectedOptionId
      if (questionExists) {
        answersList[answerIndex]['questionId'] = selectedOptionId;
      } else {
        // if selectedQuestionId doesn't exist, add new answer to the answersList
        answersList.add(
            {"questionId": selectedQuestionId, "answerId": selectedOptionId});
      }

      // payload for saving an answer
      payload = savedAnswers;
    }
  }

  return payload;
}

bool allQuizQuestionsAnswered(dynamic quizData) {
  for (var item in quizData) {
    if (item.containsKey('done') && item['done'] == false) {
      return false;
    }
  }
  return true;
}

int? lengthofMyString(String? myString) {
  String? text = myString;
  int length = text!.length;
  return length;
}

List<dynamic>? industriesSelectedList(
  String? interestOne,
  String? interestTwo,
  String? interestThree,
  String interestFour,
  String? interestFive,
) {
  return [
    {
      "industryName": interestOne,
    },
    {
      "industryName": interestTwo,
    },
    {
      "industryName": interestThree,
    },
    {
      "industryName": interestFour,
    },
    {
      "industryName": interestFive,
    }
  ];
}

int convertDoubleToInt(double decimal) {
  return decimal.toInt();
}

String findMyText(String inputText) {
  String mention = '';

  if (inputText.contains('@')) {
    List<String> words = inputText.split(' ');

    for (int i = words.length - 1; i >= 0; i--) {
      String word = words[i];
      if (word.startsWith('@')) {
        mention = word.substring(1).trim().toLowerCase();
        // Make API call with the mention here
        break;
      }
    }
  }

  return mention;
}

String inputTextTrim(String myOldText) {
  if (myOldText.contains('@')) {
    final index = myOldText.indexOf('@');
    final prefix = myOldText.substring(0, index + 1);
    final trimmedText = prefix;
    return trimmedText;
  }
  return myOldText;
}

String? commentTaggableFeed(
  List<int>? userId,
  List<String>? companyName,
  String? commentText,
) {
  List<String> formattedResults = List<String>.generate(
    userId!.length,
    (index) =>
        "@{\\\"userId\\\":${userId[index]},\\\"companyName\\\":\\\"${companyName![index]}\\\"}",
  );

  for (int i = 0; i < userId.length; i++) {
    String searchText = "@${companyName![i]}";
    String replacementText = formattedResults[i];
    commentText = commentText!.replaceAllMapped(
      RegExp(searchText),
      (match) => replacementText,
    );
  }

  return commentText;
}

String convertedTaggableComment(String myCommentString) {
  int startIndex = myCommentString.indexOf('@{');
  int endIndex = myCommentString.indexOf('}');

  String jsonString = myCommentString.substring(startIndex + 2, endIndex);
  jsonString = jsonString.replaceAll('\\', ''); // Remove escape characters
  Map<String, dynamic> jsonMap = jsonDecode('{$jsonString}');
  String extractedString = jsonMap['companyName'];

  String modifiedString = myCommentString.replaceRange(
      startIndex, endIndex + 1, '@$extractedString');
  return modifiedString;
}

String commentTextConvertToString(String myCommentedText) {
  RegExp regex = RegExp(r'@\{.*?}');
  String result = myCommentedText.replaceAllMapped(regex, (Match match) {
    String? matchString = match.group(0);
    if (matchString != null) {
      String companyName = matchString
          .substring(2, matchString.length - 1)
          .split(',')[1]
          .split(':')[1]
          .replaceAll('"', '')
          .replaceAll('\\', '');
      return '@$companyName';
    } else {
      return '';
    }
  });
  return result;
}

String? fInalCommentInputText(
  String inputText,
  String? replacementText,
) {
  int lastIndex = inputText.lastIndexOf("@");
  if (lastIndex >= 0) {
    String beforeLastMention = inputText.substring(0, lastIndex);
    int endIndex = inputText.indexOf(" ", lastIndex);
    if (endIndex == -1) {
      endIndex = inputText.length;
    }
    String afterLastMention = inputText.substring(endIndex);
    String replacedText =
        beforeLastMention + "@" + replacementText! + afterLastMention;
    return replacedText;
  }

  return inputText;
}

String? finalCommentText(
  List<String>? companyNames,
  String mycommentText,
) {
  String originalText = mycommentText.trim();
  String newText = originalText;

  if (companyNames != null) {
    for (String companyName in companyNames) {
      newText += ' @$companyName';
    }
  }

  return newText;
}

String? browseCategoriesConvert(List<String>? browseIndustries) {
  String _customEncode(String value) {
    return value.replaceAll('&', '%26');
  }

  final encodedArr = browseIndustries!.map((item) {
    return _customEncode(Uri.encodeFull(item));
  }).toList();
  String industriesString = encodedArr.join(',');

  return industriesString;
}

bool isMinLowerThanMax(
  String min,
  String max,
) {
  if (int.parse(min) > int.parse(max)) {
    return false;
  } else {
    return true;
  }
}

String? browseServiceProviderConcertotString(String? dropdownSelected) {
  String replacedString =
      dropdownSelected!.replaceAll('&', '%20').replaceAll(' ', '%20');

  return replacedString;
}
