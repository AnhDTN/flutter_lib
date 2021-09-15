import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseGridView<T> extends StatefulWidget {
  final Widget Function(T item) child;
  final List<T> data;
  final int crossAxisCount;
  final Widget? header;
  final Widget? footer;
  final void Function()? refresh;
  final void Function(int page)? loadMore;
  final RefreshController refreshController;
  const BaseGridView(
      {Key? key,
      required this.child,
      required this.data,
      required this.crossAxisCount,
      this.header,
      this.footer,
      this.refresh,
      this.loadMore, required this.refreshController})
      : super(key: key);

  @override
  _BaseGridViewState createState() => _BaseGridViewState();
}

class _BaseGridViewState extends State<BaseGridView> {

  int page = 1;
  int length = 0;

  void _onLoading() async {
    if (widget.loadMore == null) return widget.loadMore!(page);
    page++;
  }

  void _onRefresh() async {
    if (widget.refresh == null) return widget.refresh!();
    page = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: widget.refreshController,
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
          ),
          itemBuilder: (context, index) {
            return widget.child(widget.data[index]);
          },
          itemCount: widget.data.length,
        ));
  }
}
