import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progress_indicators_hackathon/app/feature/progress_indicators/progress_indicators_list.dart';
import 'package:progress_indicators_hackathon/core/assets/rasters.dart';
import 'package:progress_indicators_hackathon/core/localization/localizations_x.dart';
import 'package:progress_indicators_hackathon/core/routing/app_router.dart';

class ProgressIndicatorsScreen extends StatelessWidget {
  const ProgressIndicatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed(AppRoute.settings.name),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Rasters.logo, width: 128, height: 128),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: progressIndicators.length,
              itemBuilder: (context, index) {
                final title = progressIndicators[index].title;
                final author = progressIndicators[index].author;
                final routeName = progressIndicators[index].route;

                return ListTile(
                  title: Text(title),
                  subtitle: Text(author),
                  onTap: () => context.goNamed(routeName),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
