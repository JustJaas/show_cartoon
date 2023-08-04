import 'package:show_cartoon/data/infraestructures/http_infraestructure.dart';

class CartoonService with HttpInfraestructure {
  getData(String url) async {
    try {
      var result = await get(url);
      return result;
    } catch (e) {
      return false;
    }
  }
}
