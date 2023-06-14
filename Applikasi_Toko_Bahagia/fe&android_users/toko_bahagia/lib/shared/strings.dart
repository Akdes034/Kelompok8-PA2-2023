const baseUrl = 'http://192.168.88.52/test/api&web_toko_bahagia/public';
const baseUrlApi = '$baseUrl/api';
const baseUrlImage = baseUrl;

extension ParseUrlImage on String {
  String get parseBaseUrlImage {
    return replaceAll('http://localhost', baseUrlImage);
  }
}
