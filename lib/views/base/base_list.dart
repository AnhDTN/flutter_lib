import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

int _page = 0;
int _length = 0;

class BaseList<T> extends SingleChildStatelessWidget {
  final int total;
  final List<T> data;
  final Widget? header;
  final Widget? footer;
  final void Function() refresh;
  final void Function(int page) loadMore;
  final RefreshController refreshController;

  final Widget Function(BuildContext context, T value, Widget? child) builder;

  BaseList({Key? key,
    this.header,
    this.footer,
    Widget? child,
    required this.data,
    required this.total,
    required this.refresh,
    required this.builder,
    required this.loadMore,
    required this.refreshController,})
      : super(key: key, child: child);

  void _onLoading() {
    _page++;
    loadMore(_page);
  }

  void _onRefresh() {
    _page = 0;
    refresh();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    _length = data.length + (header != null ? 1 : 0) + (footer != null ? 1 : 0);
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }

    return SmartRefresher(
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      header: WaterDropHeader(
        refresh: CupertinoActivityIndicator(),
        complete: SizedBox(),
      ),
      footer: ClassicFooter(
        loadingText: "",
        canLoadingText: "",
        idleText: "",
        idleIcon: SizedBox(),
        loadStyle: LoadStyle.ShowWhenLoading,
      ),
      enablePullUp: true,
      child: ListView.builder(
        itemCount: _length,
        itemBuilder: (context, index) =>
        header != null && index == 0
            ? header!
            : footer != null && index == _length
            ? footer!
            : builder(context, data[index], child),
      ),
    );
  }
}
