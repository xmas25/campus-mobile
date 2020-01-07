import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/models/availability_model.dart';
import 'package:campus_mobile_experimental/core/models/dining_menu_items_model.dart';
import 'package:campus_mobile_experimental/core/models/dining_model.dart';
import 'package:campus_mobile_experimental/core/models/events_model.dart';
import 'package:campus_mobile_experimental/core/models/links_model.dart';
import 'package:campus_mobile_experimental/core/models/news_model.dart';
import 'package:campus_mobile_experimental/ui/views/availability/manage_availability_view.dart';
import 'package:campus_mobile_experimental/ui/views/baseline/baseline_view.dart';
import 'package:campus_mobile_experimental/ui/views/dining/dining_detail_view.dart';
import 'package:campus_mobile_experimental/ui/cards/dining/dining_list.dart';
import 'package:campus_mobile_experimental/ui/views/events/event_detail_view.dart';
import 'package:campus_mobile_experimental/ui/views/events/events_list.dart';
import 'package:campus_mobile_experimental/ui/views/home.dart';
import 'package:campus_mobile_experimental/ui/views/links/links_list.dart';
import 'package:campus_mobile_experimental/ui/views/map.dart' as prefix0;
import 'package:campus_mobile_experimental/ui/views/news/news_detail_view.dart';
import 'package:campus_mobile_experimental/ui/views/news/news_list.dart';
import 'package:campus_mobile_experimental/ui/views/notifications.dart';
import 'package:campus_mobile_experimental/ui/views/profile.dart';
import 'package:campus_mobile_experimental/ui/views/dining/nutrition_facts_view.dart';
import 'package:campus_mobile_experimental/core/viewmodels/surf_view_model.dart';
import 'package:campus_mobile_experimental/ui/views/special_events/special_events_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:campus_mobile_experimental/ui/views/special_events/special_events_filter_view.dart';
import 'package:provider/provider.dart';
import 'package:campus_mobile_experimental/core/services/event_service.dart';
import 'package:campus_mobile_experimental/ui/views/parking/manage_parking_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutePaths.SpecialEventsDetailView:
        return MaterialPageRoute(builder: (_) => SpecialEventsViewModel());
      case RoutePaths.SpecialEventsFilterView:
        Map<String, Object> arguments = settings.arguments;
        Function selectFilter = arguments['selectFilter'] as Function;
        FilterArguments filterArguments =
            arguments['filterArguments'] as FilterArguments;
        return MaterialPageRoute(
            builder: (_) => SpecialEventsFilterView(
                filterArguments: filterArguments, selectFilter: selectFilter));
      case RoutePaths.Map:
        return MaterialPageRoute(builder: (_) => prefix0.Map());
      case RoutePaths.Notifications:
        return MaterialPageRoute(builder: (_) => Notifications());
      case RoutePaths.Profile:
        return MaterialPageRoute(builder: (_) => Profile());
      case RoutePaths.NewsViewAll:
        NewsModel data = settings.arguments as NewsModel;
        return MaterialPageRoute(builder: (_) => NewsList(data: data));
      case RoutePaths.EventsViewAll:
        return MaterialPageRoute(
            builder: (context) =>
                EventsList(data: Provider.of<EventsService>(context).data));
      case RoutePaths.BaseLineView:
        return MaterialPageRoute(builder: (_) => BaselineView());
      case RoutePaths.NewsDetailView:
        Item newsItem = settings.arguments as Item;
        return MaterialPageRoute(
            builder: (_) => NewsDetailView(data: newsItem));
      case RoutePaths.EventDetailView:
        EventModel data = settings.arguments as EventModel;
        return MaterialPageRoute(builder: (_) => EventDetailView(data: data));
      case RoutePaths.ManageAvailabilityView:
        return MaterialPageRoute(builder: (_) => ManageAvailabilityView());
      case RoutePaths.LinksViewAll:
        List<LinksModel> data = settings.arguments as List<LinksModel>;
        return MaterialPageRoute(builder: (_) => LinksList(data: data));
      case RoutePaths.DiningViewAll:
        return MaterialPageRoute(builder: (_) => DiningList());
      case RoutePaths.DiningDetailView:
        DiningModel data = settings.arguments as DiningModel;
        return MaterialPageRoute(builder: (_) => DiningDetailView(data: data));
      case RoutePaths.DiningNutritionView:
        Map<String, Object> arguments = settings.arguments;
        MenuItem data = arguments['data'] as MenuItem;
        String disclaimer = arguments['disclaimer'] as String;
        String disclaimerEmail = arguments['disclaimerEmail'] as String;
        return MaterialPageRoute(
            builder: (_) => NutritionFactsView(
                  data: data,
                  disclaimer: disclaimer,
                  disclaimerEmail: disclaimerEmail,
                ));
      case RoutePaths.SurfView:
        return MaterialPageRoute(builder: (_) => SurfView());
      case RoutePaths.ManageParkingView:
        return MaterialPageRoute(builder: (_) => ManageParkingView());
    }
  }
}
