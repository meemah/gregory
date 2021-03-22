import 'package:flutter_test/flutter_test.dart';
import 'package:gregory/networking/api_client.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  test('Constructing Service should find correct dependencies', () {
    var apiService = ApiClient()
        .get("https://us-central1-grigora-alt.cloudfunctions.net/details");
    expect(apiService != null, true);
  });
}
