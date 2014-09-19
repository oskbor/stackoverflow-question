library query_service;

import 'dart:async';

import '../lims.dart';
import 'package:angular/angular.dart';

@Injectable()
class QueryService {
  String _studiesUrl = 'studies.json';
  String _templatesUrl = 'studies.json';

  Future _loaded;

  Map<String, Study> _studyCache;
  Map<String, Study> _templateCache;

  final Http _http;

  QueryService(Http this._http) {
    _loaded = Future.wait([_loadStudies(), _loadTemplates()]);
  }

  Future _loadStudies() {
    return _http.get(_studiesUrl).then((HttpResponse response) {
      _studyCache = new Map<String, Study>();
      for (Map study in response.data) {
        Study s = new Study.fromJson(study);
        _studyCache[s.id] = s;
      }
    });
  }

  Future _loadTemplates() {
    return _http.get(_templatesUrl).then((HttpResponse response) {
      _templateCache = new Map<String, Study>();
      for (Map template in response.data) {
        Study t = new Study.fromJson(template);
        _templateCache[t.id] = t;
      }
    });
  }

  Future<Study> getStudyById(String id) {
    return _studyCache == null ? _loaded.then((_) => _studyCache[id]) : new Future.value(_studyCache[id]);
  }

  Future<Map<String, Study>> getAllStudies() {
    return _studyCache == null ? _loaded.then((_) => _studyCache) : new Future.value(_studyCache);
  }

  Future<Map<String,Study>> getAllTemplates() {
    return _templateCache == null ? _loaded.then((_) => _templateCache) : new Future.value(_templateCache);
  }
}
