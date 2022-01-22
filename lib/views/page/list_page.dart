import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lib/model/job.dart';
import 'package:flutter_lib/providers/app_provider.dart';
import 'package:flutter_lib/resources/colors.dart';
import 'package:flutter_lib/views/base/base_gridview.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final RefreshController _refreshController = RefreshController();

  void _onLoading(int page) async {
    context.read<AppProvider>().getJobs(page);
  }

  void _onRefresh() async {
    context.read<AppProvider>().getJobs(0);
  }

  @override
  void initState() {
    super.initState();
    context.read<AppProvider>().getJobs(0);
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<AppProvider>(builder: (context, state, child) {
        // return BaseList<Job>(
        //   builder: (context, item, child) => _item(item),
        //   refreshController: _refreshController,
        //   data: state.jobs ?? [],
        //   total: state.countJobs,
        //   loadMore: _onLoading ,
        //   refresh: _onRefresh,
        // );

        return BaseGridView<Job>(
          builder: (BuildContext context, value, Widget? child) => _item(value),
          data: state.jobs ?? [],
          crossAxisCount: 2,
          refreshController: _refreshController,
          refresh: _onRefresh,
          loadMore: _onLoading,
        );
      }),
    );
  }

  Widget _item(Job item) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: Card(
          child: Text(
            item.title ?? "",
          ),
        ));
  }
}
