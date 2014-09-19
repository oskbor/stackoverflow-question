library research_lims;

import 'package:angular/angular.dart';

import '../lims.dart';
import '../service/query_service.dart';

import 'dart:html';

@Controller(
    selector: '[create-study]',
    publishAs: 'ctrl')
class StudyCreationController {


  final Http _http;
  final QueryService queryService;

  Study selectedStudy;

  // Data objects that are loaded from the server side via json
  List<Study> _allTemplates = [];
  List<Study> get templates => _allTemplates;

  List<Study> _allStudies = [];

  List<Study> get allStudies => _allStudies;
  
  num curValue= 22;
  num max= 100;
  String text ="heheheh";
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
        _allStudies = allStudies.values.toList();
      })
      .catchError((e) {
        print(e);

      });

    queryService.getAllTemplates()
      .then((Map<String,Study> allCategories) {
        _allTemplates = allCategories.values.toList();
      })
      .catchError((e) {
        print(e);
      });
  }
}


