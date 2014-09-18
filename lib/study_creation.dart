library research_lims;

import 'package:angular/angular.dart';

import 'service/recipe.dart';
import 'service/query_service.dart';

@Controller(
    selector: '[create-study]',
    publishAs: 'ctrl')
class StudyCreationController {


  final Http _http;
  final QueryService queryService;


  // Data objects that are loaded from the server side via json
  List<String> _categories = [];
  List<String> get categories => _categories;

  Map<String, Recipe> _recipeMap = {};
  Map<String, Recipe> get recipeMap => _recipeMap;
  List<Recipe> _allRecipes = [];

  List<Recipe> get allRecipes => _allRecipes;

  // Filter box
  final categoryFilterMap = <String, bool>{};
  String nameFilter = "";

  StudyCreationController(this._http, this.queryService) {
    _loadData();
  }

  Recipe selectedRecipe;

  void selectRecipe(Recipe recipe) {
    selectedRecipe = recipe;
  }


  void _loadData() {
    queryService.getAllRecipes()
      .then((Map<String, Recipe> allRecipes) {
        _recipeMap = allRecipes;
        _allRecipes = _recipeMap.values.toList();
      })
      .catchError((e) {
        print(e);

      });

    queryService.getAllCategories()
      .then((List<String> allCategories) {
        _categories = allCategories;
        for (String category in _categories) {
          categoryFilterMap[category] = false;
        }
      })
      .catchError((e) {
        print(e);
      });
  }
}


