class YouTubeApiClass {
  static String _apiKey = 'AIzaSyCgFpTXnwUJ3OH9hotpNNrPiD1A462Lhfs';
  static String baseUrlGetListOfVideos =
      'https://www.googleapis.com/youtube/v3/search?key=$_apiKey&maxResults=6&part=snippet&q=';
  String getListOfVideoUrlEndpoint(String query) {
    return baseUrlGetListOfVideos + query;
  }

  String getNexPageVideoUrlEndpoint(String query, String nextPageToken) {
    return baseUrlGetListOfVideos + query + "&pageToken=" +nextPageToken ;
  }
}
