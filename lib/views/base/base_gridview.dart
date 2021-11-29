import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

int _page = 0;
int _length = 0;

class BaseGridView<T> extends SingleChildStatelessWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final List<T> data;
  final int crossAxisCount;
  final Widget? header;
  final Widget? footer;
  final void Function() refresh;
  final void Function(int page) loadMore;
  final RefreshController refreshController;
  final SliverGridDelegateWithFixedCrossAxisCount? delegate;

  const BaseGridView(
      {Key? key,
      Widget? child,
      this.header,
      this.footer,
      this.delegate,
      required this.data,
      required this.builder,
      required this.refresh,
      required this.loadMore,
      required this.crossAxisCount,
      required this.refreshController})
      : super(key: key, child: child);

  void _onLoading() async {
    _page++;
    loadMore(_page);
  }

  void _onRefresh() async {
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
        child: GridView.builder(
          gridDelegate: delegate ??
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
          itemBuilder: (context, index) => header != null && index == 0
              ? header!
              : footer != null && index == _length
                  ? footer!
                  : builder(context, data[index], child),
          itemCount: _length,
        ));
  }
}
