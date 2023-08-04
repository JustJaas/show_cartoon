import 'package:flutter_test/flutter_test.dart';
import 'package:show_cartoon/data/services/cartoon_service.dart';

void main() {
  group('Cartoon Service', () {
    const String episodeURL = "https://rickandmortyapi.com/api/episode";
    const String characterURL = "https://rickandmortyapi.com/api/character";
    test("Get Episodes data", () async {
      bool success = false;
      final result = await CartoonService().getData(episodeURL);
      if (result != null) {
        success = true;
      }
      expect(success, true);
    });

    test("Get Characters data", () async {
      bool success = false;
      final result = await CartoonService().getData(characterURL);
      if (result != null) {
        success = true;
      }
      expect(success, true);
    });
  });
}
