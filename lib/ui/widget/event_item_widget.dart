import 'package:flutter/material.dart';
import 'package:open_git/bean/event_bean.dart';
import 'package:open_git/bean/event_payload_bean.dart';
import 'package:open_git/route/navigator_util.dart';
import 'package:open_git/util/date_util.dart';
import 'package:open_git/util/event_util.dart';
import 'package:open_git/util/image_util.dart';

class EventItemWidget extends StatelessWidget {
  final EventBean item;

  EventItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    String repoUser, repoName;
    if (item.repo.name.isNotEmpty && item.repo.name.contains("/")) {
      List<String> repos = item.repo.name.split("/");
      repoUser = repos[0];
      repoName = repos[1];
    }

    List<Widget> columnWidgets = [];
    _buildTitleWidget(columnWidgets, item, repoName);
    _buildDescWidget(columnWidgets, item);
    _buildCreatedAtWidget(columnWidgets, item.createdAt);
    _buildIssueWidget(columnWidgets, item.payload, repoName);

    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //头像
            ImageUtil.getImageWidget(item.actor.avatarUrl ?? "", 36.0),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: columnWidgets,
                ),
              ),
              flex: 1,
            ),
            EventUtil.getTypeIcon(item),
          ],
        ),
      ),
      onTap: () {
        if (item.payload != null && item.payload.issue != null) {
          NavigatorUtil.goIssueDetail(context, item.payload.issue);
        } else if (item.repo != null && item.repo.name != null) {
          NavigatorUtil.goReposDetail(context, repoUser, repoName);
        }
      },
    );
  }

  void _buildTitleWidget(List<Widget> column, EventBean item, repoName) {
    String type = EventUtil.getTypeDesc(item);

    Text title = Text.rich(
      TextSpan(children: [
        TextSpan(
            text: item.actor.login,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        TextSpan(text: " $type ", style: TextStyle(color: Colors.grey)),
        TextSpan(
            text: repoName ?? item.repo.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ]),
    );
    column.add(title);
  }

  void _buildDescWidget(List<Widget> column, EventBean item) {
    String desc = EventUtil.getEventDes(item);
    if (desc != null && desc.isNotEmpty) {
      column.add(Text(desc, style: TextStyle(color: Colors.black87)));
    }
  }

  void _buildCreatedAtWidget(List<Widget> column, createdAt) {
    Padding createdAtWidget = Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: Text(
        DateUtil.getNewsTimeStr(createdAt),
        style: TextStyle(color: Colors.grey, fontSize: 12.0),
      ),
    );
    column.add(createdAtWidget);
  }

  void _buildIssueWidget(
      List<Widget> column, EventPayloadBean payload, repoName) {
    if (payload == null) {
      return;
    }
    if (payload.issue != null) {
      if (payload.comment != null) {
        Padding commentWidget = Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            payload.comment.body,
            style: TextStyle(color: Colors.grey),
          ),
        );
        column.add(commentWidget);

        Row issueWidget = Row(
          children: <Widget>[
            ImageUtil.getImageWidget(payload.issue.user.avatarUrl ?? "", 24.0),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  repoName + " #${payload.issue.number}",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              flex: 1,
            ),
            Image(
                width: 16.0,
                height: 16.0,
                image: AssetImage('image/ic_comment.png')),
            Text(
              "${payload.issue.commentNum}",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        );
        Container issueContainer = Container(
          padding: EdgeInsets.all(6.0),
          color: Colors.grey[350],
          child: issueWidget,
        );
        column.add(issueContainer);
      } else {
        Padding issueWidget = Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            payload.issue.title,
            style: TextStyle(color: Colors.grey),
          ),
        );
        column.add(issueWidget);
      }
    }
  }
}
