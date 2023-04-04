import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'esewa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ESEWA Testing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _esewaPayment() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
          secretId: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          callbackUrl: "www.test-url.com",
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'esewa testing',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _esewaPayment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
