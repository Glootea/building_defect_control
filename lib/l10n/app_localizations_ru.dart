// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get projectRouteName => 'Проекты';

  @override
  String get profileRouteName => 'Профиль';

  @override
  String get authRouteName => 'Авторизация';

  @override
  String get projectDetailsRouteName => 'Детали проекта';

  @override
  String get reportsRouteName => 'Рапорты';

  @override
  String get reportDetailsRouteName => 'Детали рапорта';

  @override
  String get defectDetailsRouteName => 'Детали дефекта';

  @override
  String get createNewReport => 'Создать новый рапорт';

  @override
  String get enterReportName => 'Введите название рапорта';

  @override
  String get enterReportDescription => 'Введите описание рапорта';

  @override
  String get cancel => 'Отмена';

  @override
  String get create => 'Создать';

  @override
  String get name => 'Название';

  @override
  String get submissionDate => 'Дата заполнения';

  @override
  String get description => 'Описание';

  @override
  String get classification => 'Класс';

  @override
  String get status => 'Статус';

  @override
  String get email => 'Почта';

  @override
  String get jobPosition => 'Роль';

  @override
  String get password => 'Пароль';

  @override
  String get pleaseEnter => 'Пожалуйста, введите';

  @override
  String get login => 'Войти';

  @override
  String get error => 'Ошибка';

  @override
  String get executor => 'Исполнитель';

  @override
  String get createElimination => 'Создать устранение';

  @override
  String get defectElimination => 'Устранение дефекта';

  @override
  String get startDate => 'Дата начала';

  @override
  String get endDate => 'Дата окончания';

  @override
  String get listView => 'Таблица';

  @override
  String get gridView => 'Карточки';

  @override
  String get createNew => 'Создать';

  @override
  String get defects => 'Дефекты';

  @override
  String get badRequest => 'Неверный запрос при обращении к данным';

  @override
  String get unauthorized => 'Неавторизован';

  @override
  String get forbidden => 'Доступ к данным запрещен';

  @override
  String get notFound => 'Данные не найдены';

  @override
  String get internalServerError => 'Внутренняя ошибка сервера';

  @override
  String get unknownError => 'Произошла неизвестная ошибка';
}
