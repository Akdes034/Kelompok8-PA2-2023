const baseUrl = 'http://192.168.100.7/test/api&web_toko_bahagia/public';
const baseUrlApi = '$baseUrl/api';
const baseUrlImage = baseUrl;

extension ParseUrlImage on String {
  String get parseBaseUrlImage {
    return replaceAll('http://localhost', baseUrlImage);
  }
}
