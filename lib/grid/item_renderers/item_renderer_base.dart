import 'package:angular2/angular2.dart';

import 'package:ng_grid/grid/core/grid_column.dart';

abstract class ItemRendererBase<T> extends ComponentState {
  //-----------------------------
  // Public Properties
  //-----------------------------

  GridColumn gridColumn;

  T data;

  //-----------------------------
  // Constructor
  //-----------------------------

  ItemRendererBase();

  //-----------------------------
  // Public Methods
  //-----------------------------

  String resolveLabel() {
    if (gridColumn == null || data == null) {
      return '';
    }

    if (gridColumn.labelHandler != null) {
      return gridColumn.labelHandler(data);
    }

    return '';
  }
}
