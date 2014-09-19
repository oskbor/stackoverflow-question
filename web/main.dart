library recipe_book;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:logging/logging.dart';

import 'package:research_lims/controllers/study_creation.dart';
import 'package:research_lims/formatter/category_filter.dart';
import 'package:research_lims/component/rating/rating_component.dart';
import 'package:research_lims/service/query_service.dart';
import 'package:research_lims/routing/lims_router.dart';
import 'package:research_lims/component/view/view_component.dart';
import 'package:research_lims/component/search/search_component.dart';

class LimsApp extends Module {
  LimsApp() {
    bind(StudyCreationController);
    bind(RatingComponent);
    bind(CategoryFilter);
    bind(SearchComponent);
    bind(ViewComponent);
    bind(QueryService);
    bind(RouteInitializerFn, toValue: limsRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

void main() {
  Logger.root..level = Level.FINEST
             ..onRecord.listen((LogRecord r) { print(r.message); });
  applicationFactory()
      .addModule(new LimsApp())
      .run();
}
