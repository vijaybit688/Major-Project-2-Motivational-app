
class UnsplashApiClass{
  static String _apiKey='3y053l7YtgxwFMZl5WSyJjZGE9suT10Pu9IozHGaUrc';
  static String baseUrlPhoto='https://api.unsplash.com/search/photos?';
  static String baseUrlApiKey="$baseUrlPhoto"+"client_id=$_apiKey";
  static String queryUrl='$baseUrlApiKey&query=';
  static String portraitImageQueryUrl=baseUrlApiKey+'&orientation=portrait';

  String getQueryUrl(String query){
    return queryUrl+query;
  }
  String getBaseUrlApiKey(){
    return baseUrlApiKey;
  }
  String getBaseUrl(){
    return baseUrlPhoto;
  }
  String getApiKey(){
    return _apiKey;
  }
  String getPortraitImageQueryUrl(String query){
    return portraitImageQueryUrl+'&query='+query;
  }

  String getNexPagePhotos(String query,int page){
    return portraitImageQueryUrl+'&query='+query+"&page="+page.toString();

  }

}
