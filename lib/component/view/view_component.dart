library view_recipe_component;

import '../../lims.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'view-study',
    templateUrl: 'packages/research_lims/component/view/view_component.html',
    cssUrl: 'packages/research_lims/component/view_recipe_component.css',
    publishAs: 'cmp')
class ViewComponent {
  @NgOneWay('study-map')
  Map<String, Study> studyMap;

  String _studyId;

  Study get study => studyMap == null ? null : studyMap[_studyId];

  ViewComponent(RouteProvider routeProvider) {
    _studyId = routeProvider.parameters['studyId'];
  }
}
