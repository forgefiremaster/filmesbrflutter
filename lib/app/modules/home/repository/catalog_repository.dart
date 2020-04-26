import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:fluttter/app/modules/home/models/catalog.dart';
import 'package:fluttter/app/shared/custom_dio/custom_dio.dart';

class CatalogRepository{
  final CustomDio dio;

  CatalogRepository(this.dio);

  Future<Catalog> fetchCatalog(int page) async { 
      try {
        final response = await dio.client.get('3/movie/popular?api_key=aba398d98b63f0b51f76edf8b1bfc371&language=en-US&page=[${page}]');
        return Catalog.fromJson(response.data);
      } on DioError catch(e) {
        throw (e.message);
      }
   }

}
