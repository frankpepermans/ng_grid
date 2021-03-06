import 'package:angular2/angular2.dart';

import 'package:ng_grid/grid/header_renderers/header_renderer_base.dart';
import 'package:ng_grid/grid/infrastructure/sort_service.dart';

@Component(
    changeDetection: ChangeDetectionStrategy.Stateful,
    encapsulation: ViewEncapsulation.None,
    preserveWhitespace: false,
    selector: 'sortable-header-renderer',
    template: '''
    <button (click)="sortData()">
      {{gridColumn?.title}}
      <span *ngIf="isSorted"> {{sortDirection == 1? 'ASC': 'DESC'}}</span>
    </button>''')
class SortableHeaderRenderer extends HeaderRendererBase {
  //-----------------------------
  // Public Properties
  //-----------------------------

  final SortService sortService;

  bool get isSorted => gridColumn == sortService.currentSortedColumn;

  int get sortDirection => sortService.currentSortDirection;

  //-----------------------------
  // Constructor
  //-----------------------------

  SortableHeaderRenderer(@Inject(SortService) this.sortService);

  //-----------------------------
  // Public Methods
  //-----------------------------

  void sortData() {
    if (gridColumn.isSortable) {
      sortService.sortOnColumn(gridColumn);
    }
  }
}
