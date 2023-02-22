import "package:cowlar_task/constants/keys.dart";
import "package:cowlar_task/model/movieModel.dart";
import "package:dio/dio.dart";
import "package:flutter_test/flutter_test.dart";
import "package:http_mock_adapter/http_mock_adapter.dart";

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  dio.httpClientAdapter = dioAdapter;
  const videoIDPath = "$baseUrl/movie/123/videos?api_key=$apiKey";
  const genreListPath =
      "$baseUrl/genre/movie/list?api_key=$apiKey&language=en-US";
  const searchMoviePath =
      "$baseUrl/search/multi?api_key=$apiKey&language=en-US&query=hum&page=1&include_adult=false";

  const trendingMoviesPath = "$baseUrl/trending/all/day?api_key=$apiKey";
  test("Get Video ID Test", () async {
    dioAdapter.onGet(
        videoIDPath,
        (server) => server.reply(
              200,
              "videoID",
            ));

    final onGetResponse = await dio.get(videoIDPath);
    expect(onGetResponse.data, "videoID");
  });

  test("Get genresList Test", () async {
    dioAdapter.onGet(
        genreListPath,
        (server) => server.reply(
              200,
              <dynamic>[
                {"name": "Sports", "id": 25}
              ],
            ));

    final onGetResponse = await dio.get(genreListPath);
    expect(onGetResponse.data.runtimeType, List<dynamic>);
  });

  test("Get Search Movies Test", () async {
    dioAdapter.onGet(
        searchMoviePath,
        (server) => server.reply(
              200,
              [
                MovieModel(
                    id: 123,
                    title: "adasdasd",
                    hasVideo: true,
                    imageUrl: "",
                    overview: "",
                    releaseDate: "releaseDate",
                    genreIds: []).toMap()
              ],
            ));

    final onGetResponse = await dio.get(searchMoviePath);
    expect(onGetResponse.data, [
      {
        "id": 123,
        "title": "adasdasd",
        "hasVideo": true,
        "imageUrl": "",
        "overview": "",
        "releaseDate": "releaseDate",
        "genreIds": []
      }
    ]);
  });

  test("Get Trending Movies Test", () async {
    dioAdapter.onGet(
        trendingMoviesPath,
        (server) => server.reply(
              200,
              [
                MovieModel(
                    id: 123,
                    title: "adasdasd",
                    hasVideo: true,
                    imageUrl: "",
                    overview: "",
                    releaseDate: "releaseDate",
                    genreIds: []).toMap()
              ],
            ));

    final onGetResponse = await dio.get(trendingMoviesPath);
    expect(onGetResponse.data, [
      {
        "id": 123,
        "title": "adasdasd",
        "hasVideo": true,
        "imageUrl": "",
        "overview": "",
        "releaseDate": "releaseDate",
        "genreIds": []
      }
    ]);
  });
}
