import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_indicators_hackathon/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Turn off the # in the URLs on the web
  usePathUrlStrategy();

  // Ensure URL changes in the address bar when using push / pushNamed
  // More info here: https://docs.google.com/document/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/edit
  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(const ProviderScope(child: MyApp()));
}
