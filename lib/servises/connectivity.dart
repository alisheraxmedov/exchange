// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exchange/screens/home.dart';
import 'package:exchange/screens/offline_screen.dart';
import 'package:flutter/material.dart';

class ConnectivityCheck extends StatefulWidget {
  static const String routeName = "/";
  const ConnectivityCheck({super.key});

  @override
  _ConnectivityCheckState createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isConnected = true; // Assume connected initially

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _checkConnection();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();
      setState(() {
        _isConnected = (result != ConnectivityResult.none);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? const Home() : const Offline();
  }
}
