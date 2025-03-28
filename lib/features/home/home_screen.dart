import 'package:counter_app/core/utils/storage_service.dart';
import 'package:counter_app/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _checkUserToken();
    super.initState();
  }

  // Check User token already exists
  Future<void> _checkUserToken() async {
    UserModel? user = await StorageService().getUserData();
    if (user != null) {
      if (user.token != null) {
        // Navigate to counter screen
        if (mounted) {
          context.goNamed('counter');
        }
      }
    } else {
      // Navigate to login screen
      if (mounted) {
        context.goNamed('loginScreen');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}