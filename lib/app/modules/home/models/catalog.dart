import 'package:fluttter/app/modules/home/models/catalog_item.dart';

class Catalog {
  int page;
  int totalResults;
  int totalPages;
  List<CatalogItem> results;

  Catalog({this.page, this.totalResults, this.totalPages, this.results});

  Catalog.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = new List<CatalogItem>();
      json['results'].forEach((v) {
        results.add(new CatalogItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
