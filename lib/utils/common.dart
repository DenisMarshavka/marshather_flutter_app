import 'package:logger/logger.dart';

final prettyLog = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 110,
  ),
);
