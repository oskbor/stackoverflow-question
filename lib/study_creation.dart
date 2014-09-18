library research_lims;

import 'package:angular/angular.dart';

import 'lims.dart';
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

  Map<String, Study> _studyMap = {};
  Map<String, Study> get studyMap => _studyMap;
  List<Study> _allStudies = [];

  List<Study> get allStudies => _allStudies;

  // Filter box
  final categoryFilterMap = <String, bool>{};
  String nameFilter = "";

  StudyCreationController(this._http, this.queryService) {
    _loadData();
  }

  Study selectedStudy;

  void selectStudy(Study study) {
    selectedStudy = study;
  }


  void _loadData() {
    queryService.getAllStudies()
      .then((Map<String, Study> allStudies) {
        _studyMap = allStudies;
        _allStudies = _studyMap.values.toList();
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


