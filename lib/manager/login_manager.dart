import 'dart:convert';

import 'package:open_git/bean/login_bean.dart';
import 'package:open_git/bean/user_bean.dart';
import 'package:open_git/common/config.dart';
import 'package:open_git/common/shared_prf_key.dart';
import 'package:open_git/http/api.dart';
import 'package:open_git/http/credentials.dart';
import 'package:open_git/http/http_manager.dart';
import 'package:open_git/util/shared_prf_util.dart';

class LoginManager {
  factory LoginManager() => _getInstance();

  static LoginManager get instance => _getInstance();
  static LoginManager _instance;

  String _token;
  UserBean _userBean;

  LoginManager._internal();

  static LoginManager _getInstance() {
    if (_instance == null) {
      _instance = new LoginManager._internal();
    }
    return _instance;
  }

  login(String userName, String password) async {
    _token = Credentials.basic(userName, password);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": Config.CLIENT_ID,
      "client_secret": Config.CLIENT_SECRET
    };
    final response =
        await HttpManager.doPost(Api.authorizations(), requestParams, null);
    if (response != null && response.data != null) {
      return LoginBean.fromJson(response.data);
    }
    return null;
  }

  getMyUserInfo() async {
    final response = await HttpManager.doGet(Api.getMyUserInfo(), null);
    if (response != null && response.data != null) {
      LoginManager.instance.setUserBean(response.data, true);
      return UserBean.fromJson(response.data);
    }
    return null;
  }

  clearAll() async {
    setUserBean(null, true);
    setToken(null, true);
  }

  setUserBean(data, bool isNeedCache) {
    if (data == null) {
      _userBean = null;
    } else {
      _userBean = UserBean.fromJson(data);
    }
    if (isNeedCache) {
      SharedPrfUtils.saveString(
          SharedPrfKey.SP_KEY_USER_INFO, data != null ? jsonEncode(data) : '');
    }
  }

  getUserBean() {
    return _userBean;
  }

  void setToken(String token, bool isNeedCache) {
    _token = token;
    if (isNeedCache) {
      SharedPrfUtils.saveString(SharedPrfKey.SP_KEY_TOKEN, token ?? "");
    }
  }

  String getToken() {
    String auth = _token;
    if (_token != null && _token.length > 0) {
      auth = _token.startsWith("Basic") ? _token : "token " + _token;
    }
    return auth;
  }
}
