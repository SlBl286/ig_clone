import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/notification_controller.dart';

class NotificationPage extends NyStatefulWidget {
  final NotificationController controller = NotificationController();

  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends NyState<NotificationPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 10));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // edgeOffset: 60,
      color: Colors.red,
      onRefresh: _onRefresh,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Hoạt động',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
