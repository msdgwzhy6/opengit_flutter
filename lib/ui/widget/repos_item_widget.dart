import 'package:flutter/material.dart';
import 'package:open_git/bean/repos_bean.dart';
import 'package:open_git/route/navigator_util.dart';
import 'package:open_git/util/image_util.dart';

class ReposItemWidget extends StatelessWidget {
  final Repository item;

  ReposItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _getItemOwner(item.owner.avatarUrl, item.owner.login),
                  _getItemLanguage(item.language ?? ""),
                ],
              ),
              //全称
              Padding(
                padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Text(
                  item.fullName ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //描述
              Text(
                item.description,
                style: TextStyle(color: Colors.black54, fontSize: 12.0),
              ),
              //底部数据
              Row(
                children: <Widget>[
                  _getItemBottom(
                      Image(
                          width: 12.0,
                          height: 12.0,
                          image: AssetImage('image/ic_star.png')),
                      item.stargazersCount.toString()),
                  _getItemBottom(
                      Image(
                          width: 12.0,
                          height: 12.0,
                          image: AssetImage('image/ic_issue.png')),
                      item.openIssuesCount.toString()),
                  _getItemBottom(
                      Image(
                          width: 12.0,
                          height: 12.0,
                          image: AssetImage('image/ic_branch.png')),
                      item.forksCount.toString()),
                  Text(
                    item.fork ? "Forked" : "",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          NavigatorUtil.goReposDetail(context, item.owner.login, item.name);
        });
  }

  Widget _getItemOwner(String ownerHead, String ownerName) {
    return Row(
      children: <Widget>[
        ImageUtil.getImageWidget(ownerHead, 18.0),
        Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            ownerName,
            style: TextStyle(color: Colors.black54, fontSize: 12.0),
          ),
        ),
      ],
    );
  }

  Widget _getItemLanguage(String language) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ClipOval(
            child: Container(
              color: Colors.black87,
              width: 8.0,
              height: 8.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              language,
              style: TextStyle(color: Colors.black54, fontSize: 12.0),
            ),
          ),
        ],
      ),
      flex: 1,
    );
  }

  Widget _getItemBottom(Widget icon, String count) {
    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: Row(
        children: <Widget>[
          icon,
          Padding(
            padding: EdgeInsets.only(left: 3.0),
            child: Text(
              count,
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
