library research_lims;

import 'package:angular/angular.dart';

import 'lims.dart';
import 'service/query_service.dart';

import 'dart:html';

@Controller(
    selector: '[create-study]',
    publishAs: 'ctrl')
class StudyCreationController {


  final Http _http;
  final QueryService queryService;

  Study selectedStudy;

  // Data objects that are loaded from the server side via json
  List<String> _templates = [];
  List<String> get templates => _templates;

  Map<String, Study> _studyMap = {};
  Map<String, Study> get studyMap => _studyMap;
  List<Study> _allStudies = [];

  List<Study> get allStudies => _allStudies;

  // Filter box
  final templateFilterMap = <String, bool>{};
  String nameFilter = "";

  StudyCreationController(this._http, this.queryService) {
    this.selectedStudy = new Study(null, "new study","", 5, null);
    _loadData();
  }

  void selectStudy(Study study) {
    selectedStudy = study;
  }
  void alert(e){
    window.alert(e);
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

    queryService.getAllTemplates()
      .then((List<String> allCategories) {
        _templates = allCategories;
        for (String template in _templates) {
          templateFilterMap[template] = false;
        }
      })
      .catchError((e) {
        print(e);
      });
  }
}


