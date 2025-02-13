import 'package:flutter/widgets.dart';
import 'package:open_git/bean/event_bean.dart';
import 'package:open_git/bloc/base_list_bloc.dart';
import 'package:open_git/common/config.dart';
import 'package:open_git/manager/event_manager.dart';
import 'package:open_git/status/status.dart';
import 'package:open_git/util/log_util.dart';

class EventBloc extends BaseListBloc<EventBean> {
  static final String TAG = "EventBloc";

  final String userName;

  EventBloc(this.userName) {
  }

  bool _isInit = false;

  void initData(BuildContext context) async {
    if (_isInit) {
      return;
    }
    _isInit = true;

    _showLoading();
    await _fetchEventList();
    _hideLoading();

    refreshStatusEvent();
  }

  @override
  ListPageType getListPageType() {
    return ListPageType.event;
  }

  @override
  Future getData() async {
    await _fetchEventList();
  }

  Future _fetchEventList() async {
    LogUtil.v('_fetchEventList', tag: TAG);
    try {
      var result = await EventManager.instance.getEventReceived(userName, page);
      if (bean.data == null) {
        bean.data = List();
      }
      if (page == 1) {
        bean.data.clear();
      }

      noMore = true;
      if (result != null) {
        noMore = result.length != Config.PAGE_SIZE;
        bean.data.addAll(result);
      }

      sink.add(bean);
    } catch (_) {
      if (page != 1) {
        page--;
      }
    }
  }

  void _showLoading() {
    bean.isLoading = true;
    sink.add(bean);
  }

  void _hideLoading() {
    bean.isLoading = false;
    sink.add(bean);
  }
}
