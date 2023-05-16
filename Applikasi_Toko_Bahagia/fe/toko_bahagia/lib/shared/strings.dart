const baseUrl = 'http://192.168.232.52/test/api_del_shop/public';
const baseUrlApi = '$baseUrl/api';
const baseUrlImage = baseUrl;

extension ParseUrlImage on String {
  String get parseBaseUrlImage {
    return replaceAll('http://localhost', baseUrlImage);
  }
}
