library view_recipe_component;

import '../../service/recipe.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'view-recipe',
    templateUrl: 'packages/research_lims/component/view/view_component.html',
    cssUrl: 'packages/research_lims/component/view_recipe_component.css',
    publishAs: 'cmp')
class ViewComponent {
  @NgOneWay('recipe-map')
  Map<String, Recipe> recipeMap;

  String _recipeId;

  Recipe get recipe => recipeMap == null ? null : recipeMap[_recipeId];

  ViewComponent(RouteProvider routeProvider) {
    _recipeId = routeProvider.parameters['recipeId'];
  }
}
