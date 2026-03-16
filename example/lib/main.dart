import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_status_checker/internet_status_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Status Checker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: const ConnectivityDemoPage(),
    );
  }
}

class ConnectivityDemoPage extends StatefulWidget {
  const ConnectivityDemoPage({super.key});

  @override
  State<ConnectivityDemoPage> createState() => _ConnectivityDemoPageState();
}

class _ConnectivityDemoPageState extends State<ConnectivityDemoPage> {
  bool? _isConnected;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkConnection();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    final connected = await InternetStatusChecker.isConnected();
    if (!mounted) return;
    setState(() {
      _isConnected = connected;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Status Checker'),
      ),
      body: _isConnected!
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    size: 90,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Internet is available',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _checkConnection,
                    child: const Text('Check Again'),
                  ),
                ],
              ),
            )
          : NoInternetView(
              onRetry: _checkConnection,
            ),
    );
  }
}
