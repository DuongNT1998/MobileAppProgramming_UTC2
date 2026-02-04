import 'package:flutter/material.dart';
import '../views/home_view.dart';
import '../views/row_column_view.dart';
import '../views/stack_wrap_view.dart';
import '../views/list_grid_view.dart';
import '../views/table_flex_view.dart';
import '../views/flow_view.dart';
import '../views/wrap_scroll_view.dart';
import '../views/listview_scroll_view.dart';

class AppRoutes {
  static const home = '/';
  static const rowColumn = '/row-column';
  static const stackWrap = '/stack-wrap';
  static const listGrid = '/list-grid';
  static const tableFlex = '/table-flex';
  static const flow = '/flow';
  static const wrapScroll = '/wrap-scroll';
  static const listviewScroll = '/listview_scroll_view';

  static final routes = <String, WidgetBuilder>{
    home: (_) => const HomeView(),
    rowColumn: (_) => const RowColumnView(),
    stackWrap: (_) => const StackWrapView(),
    listGrid: (_) => const ListGridView(),
    tableFlex: (_) => const TableFlexView(),
    flow: (_) => const FlowView(),
    wrapScroll: (_) => const WrapScrollView(),
    listviewScroll: (_) => const ListViewScrollView(),
  };
}
