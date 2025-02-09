import 'package:progress_indicators_hackathon/app/feature/progress_indicators/progress_indicator_info.dart';
import 'package:progress_indicators_hackathon/core/routing/app_router.dart';

// TODO: Добавь свой индикатор в этот список
final progressIndicators = <ProgressIndicatorInfo>[
  ProgressIndicatorInfo(
    title: 'Глитч индикатор',
    author: 'Саша Мартынов',
    route: AppRoute.glitch.name,
  ),
  ProgressIndicatorInfo(
    title: 'Название индикатора',
    author: 'Имя автора',
    route: AppRoute.example.name,
  ),
];
