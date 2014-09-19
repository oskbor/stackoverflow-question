library research_lims;

import 'package:angular/angular.dart';

import '../../lims.dart';
import '../../service/query_service.dart';

import 'dart:html';

@Component(
    selector: 'study',
    publishAs: 'cmp',
    templateUrl: 'packages/research_lims/component/study/study.html'    
)
class StudyComponent {


  final Http _http;
  final QueryService queryService;

  Study selectedStudy;

  // Data objects that are loaded from the server side via json
  List<Study> _allTemplates = [];
  List<Study> get templates => _allTemplates;

  List<Study> _allStudies = [];

  List<Study> get allStudies => _allStudies;
  @NgTwoWay('curValue')
  num curValue= 22;
  num max= 100;
  String text ="heheheh";


  StudyComponent(this._http, this.queryService) {
    this.selectedStudy = new Study(null, "new study","", 5, null);
    _loadData();
  }

  void selectStudy(Study study) {
    selectedStudy = study;
  }

  void sendAlert([e]){
    e= e==null ? 'nuthing': e;
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


