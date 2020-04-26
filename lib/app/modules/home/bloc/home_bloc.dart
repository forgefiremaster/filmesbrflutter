import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fluttter/app/modules/home/home_module.dart';
import 'package:fluttter/app/modules/home/models/catalog.dart';
import 'package:fluttter/app/modules/home/repository/catalog_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  var _catalogRepository = HomeModule.to.getDependency<CatalogRepository>();

  var catalog = BehaviorSubject<Catalog>();
  Sink<Catalog> get responseIn => catalog.sink;

  Observable<Catalog> get responseOut => catalog.stream;

  void getCatalog(int page) async {
    responseIn.add(null);
    try {
      var res = await _catalogRepository.fetchCatalog(page);
      responseIn.add(res);
    } catch(e) {
        catalog.addError(e);
    }
  }

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // TODO: Add Logic
  }
}
