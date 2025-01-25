import 'package:flutter/material.dart';
import 'package:iac_task/app/iac_app.dart';
import 'package:iac_task/core/database/api/api_service.dart';
import 'package:iac_task/core/functions/configure_system_orientation.dart';
import 'package:iac_task/core/service/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized.
  APIService.init(); // Initialize API service.
  ServicesLocator.init(); // Initialize service locator.
  configureSystemOrientation(); // Configure system orientation settings.
  runApp(const IACApp()); // Run the main application.
}



