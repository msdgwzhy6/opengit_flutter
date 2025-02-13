import 'package:flutter/widgets.dart';
import 'package:open_git/bean/repos_bean.dart';
import 'package:open_git/bloc/base_list_bloc.dart';
import 'package:open_git/common/config.dart';
import 'package:open_git/manager/repos_manager.dart';
import 'package:open_git/status/status.dart';

class ReposTrendBloc extends BaseListBloc<Repository> {
  final String language;

  ReposTrendBloc(this.language);

  bool _isInit = false;

  void initData(BuildContext context) async {
    if (_isInit) {
      return;
    }
    _isInit = true;

    _showLoading();
    await _fetchTrendList();
    _hideLoading();

    refreshStatusEvent();
  }

  @override
  Future getData() async {
    await _fetchTrendList();
  }

  @override
  ListPageType getListPageType() {
    return ListPageType.repos_trend;
  }

  Future _fetchTrendList() async {
    try {
      var result = await ReposManager.instance.getLanguages(language, page);
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
