import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseList<T> extends StatefulWidget {
  final Widget Function(T item) child;
  final List<T> data;
  final int? total;
  final Widget? header;
  final Widget? footer;
  final RefreshController refreshController;
  final void Function()? refresh;
  final void Function(int page)? loadMore;

  const BaseList(
      {Key? key,
      required this.child,
      required this.data,
      this.total,
      this.header,
      this.footer,
      this.refresh,
      this.loadMore, required this.refreshController})
      : super(key: key);

  @override
  _BaseListState createState() => _BaseListState();
}

class _BaseListState extends State<BaseList> {

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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    length = widget.data.length +
        (widget.header != null ? 1 : 0) +
        (widget.footer != null ? 1 : 0);
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
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) => widget.header != null && index == 0
            ? widget.header!
            : widget.footer != null && index == length
                ? widget.footer!
                : widget.child(widget.data[index]),
      ),
    );
  }
}
