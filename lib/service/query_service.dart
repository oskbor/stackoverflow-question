library query_service;

import 'dart:async';

import '../lims.dart';
import 'package:angular/angular.dart';

@Injectable()
class QueryService {
  String _studiesUrl = 'studies.json';
  String _categoriesUrl = 'categories.json';

  Future _loaded;

  Map<String, Study> _studyCache;
  List<String> _categoriesCache;

  final Http _http;

  QueryService(Http this._http) {
    _loaded = Future.wait([_loadStudies(), _loadCategories()]);
  }

  Future _loadStudies() {
    return _http.get(_studiesUrl).then((HttpResponse response) {
      _studyCache = new Map<String, Study>();
      for (Map recipe in response.data) {
        Study r = new Study.fromJson(recipe);
        _studyCache[r.id] = r;
      }
    });
  }

  Future _loadCategories() {
    return _http.get(_categoriesUrl).then((HttpResponse response) {
      _categoriesCache = response.data;
    });
  }

  Future<Study> getStudyById(String id) {
    return _studyCache == null ? _loaded.then((_) => _studyCache[id]) : new Future.value(_studyCache[id]);
  }

  Future<Map<String, Study>> getAllStudies() {
    return _studyCache == null ? _loaded.then((_) => _studyCache) : new Future.value(_studyCache);
  }

  Future<List<String>> getAllTemplates() {
    return _categoriesCache == null ? _loaded.then((_) => _categoriesCache) : new Future.value(_categoriesCache);
  }
}
