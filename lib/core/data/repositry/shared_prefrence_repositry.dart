import 'dart:convert';

import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/data/models/token_info.dart';
import 'package:empty_code/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------

  String PREF_TOKEN_INFO = 'login_info';
  String PREF_IS_LOGGED = 'logged_in';
  String PREF_TASK_LIST = 'task_info';


  void setLoggedIn(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_IS_LOGGED, value: value);
  }

  bool getLoggedIn() {
    if (pref.containsKey(PREF_IS_LOGGED))
      return getPrefrence(PREF_IS_LOGGED);
    else
      return false;
  }










  void setTokenInfo(TokenInfo token) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_TOKEN_INFO,
        value: jsonEncode(token.toJson()));
  }

  TokenInfo getTokenInfo() {
    return TokenInfo.fromJson(jsonDecode(getPrefrence(PREF_TOKEN_INFO)));
  }

  void setTaskList(List<TaskModel> list) {
    setPrefrenc(
        type: DataType.STRING,
        key: PREF_TASK_LIST,
        value: TaskModel.encode(list));
  }

  List<TaskModel> getTaskList() {
    if (pref.containsKey(PREF_TASK_LIST))
      return TaskModel.decode(getPrefrence(PREF_TASK_LIST));
    else
      return [];
  }

  //*====================================

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }
}
