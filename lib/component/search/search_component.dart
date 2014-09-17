library search_component;

import 'package:angular/angular.dart';

@Component(
    selector: 'search-recipe',
    templateUrl: 'packages/research_lims/component/search/search_component.html',
    publishAs: 'cmp')
class SearchComponent {
  Map<String, bool> _categoryFilterMap;
  List<String> _categories;

  @NgTwoWay('name-filter-string')
  String nameFilterString = "";

  @NgOneWay('category-filter-map')
  Map<String, bool> get categoryFilterMap => _categoryFilterMap;
  void set categoryFilterMap(values) {
    _categoryFilterMap = values;
    _categories = categoryFilterMap.keys.toList();
  }

  List<String> get categories => _categories;

  void clearFilters() {
    _categoryFilterMap.keys.forEach((f) => _categoryFilterMap[f] = false);
    nameFilterString = "";
  }
}