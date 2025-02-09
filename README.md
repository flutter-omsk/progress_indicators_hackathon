# Хакатон лоадеров (индикаторов загрузки)

<p align="center"><img src="./assets/rasters/logo.png" alt="Cover" width="300"/></p>

## Задание

Необходимо придумать анимированный индикатор загрузки.

## Подготовка

1. Создать папку со своей фамилией и виджетом заготовкой для индикатора по аналогии с Martynov
2. Добавить роут в файл `lib/core/routing/app_router.dart`
3. Добавить индикатор в список `lib/app/feature/progress_indicators/progress_indicators_list.dart`

После этого ваш индикатор должен появиться в списке.

## Генерация ассетов

Для генерации ассетов используется пакет [spider](https://pub.dev/packages/spider).

Для установки выполните команду:

```bash
dart pub global activate spider
```

Для генерации ассетов выполните команду:

```bash
spider build
```

Доступ к ассетам по аналогии с логотипом.
