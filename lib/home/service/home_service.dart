import 'package:dio/dio.dart';
import 'package:news_app/entity/anamodel.dart';

class HomeService {
  Dio dio = Dio();

  Future<NewsModel?> homeApi(String lg) async {
    String url =
        "https://newsdata.io/api/1/news?apikey=pub_393244824e55278d57d47f1e45f851e0b873&language=$lg";
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print(response);
      return NewsModel.fromJson(response.data);
    }
  }

  Future<NewsModel?> categoryApi(String kelime, String lg) async {
    String url =
        "https://newsdata.io/api/1/news?apikey=pub_393244824e55278d57d47f1e45f851e0b873&language=$lg&category=$kelime";
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print(response);
      return NewsModel.fromJson(response.data);
    }
  }

  Future<NewsModel?> changeLanguage(String lg) async {
    String url =
        "https://newsdata.io/api/1/news?apikey=pub_393244824e55278d57d47f1e45f851e0b873&language=$lg";
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print(response);
      return NewsModel.fromJson(response.data);
    }
  }

  Future<NewsModel?>  searchApi(String search,String lg) async{
    String url="https://newsdata.io/api/1/news?apikey=pub_393244824e55278d57d47f1e45f851e0b873&q=$search&language=$lg";
     Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print(response);
      return NewsModel.fromJson(response.data);
    }
  }
}
