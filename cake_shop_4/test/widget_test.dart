import 'dart:async';
import 'dart:io';
import 'dart:typed_data';


import 'package:flutter_test/flutter_test.dart';

import 'package:cake_shop_4/main.dart';
import 'package:cake_shop_4/screens/home_screen.dart';
import 'package:cake_shop_4/screens/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return MockHttpClient();
  }
}

class MockHttpClient extends Fake implements HttpClient {
  @override
  bool autoUncompress = false;

  @override
  Future<HttpClientRequest> getUrl(Uri url) async {
    return MockHttpClientRequest();
  }
}

class MockHttpClientRequest extends Fake implements HttpClientRequest {
  @override
  Future<HttpClientResponse> close() async {
    return MockHttpClientResponse();
  }
}

class MockHttpClientResponse extends Fake implements HttpClientResponse {
  @override
  int get statusCode => 200;

  @override
  int get contentLength => kTransparentImage.length;

  @override
  HttpClientResponseCompressionState get compressionState =>
      HttpClientResponseCompressionState.notCompressed;

  @override
  StreamSubscription<List<int>> listen(void Function(List<int> event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return Stream.value(kTransparentImage).listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  @override
  Stream<S> transform<S>(StreamTransformer<List<int>, S> streamTransformer) {
    return Stream.value(kTransparentImage)
        .cast<List<int>>()
        .transform(streamTransformer);
  }
}

final kTransparentImage = Uint8List.fromList([
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);

void main() {
  testWidgets('SplashScreen test', (WidgetTester tester) async {
    HttpOverrides.global = MyHttpOverrides();
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SweetBitesApp());

    // Verify that SplashScreen is shown
    expect(find.byType(SplashScreen), findsOneWidget);

    // Wait for 3 seconds
    await tester.pump(const Duration(seconds: 3));

    // pumpAndSettle will wait for all animations to complete
    await tester.pumpAndSettle();

    // Verify that HomePage is shown
    expect(find.byType(HomePage), findsOneWidget);
  });
}
