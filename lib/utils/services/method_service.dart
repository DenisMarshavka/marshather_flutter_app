import 'dart:io';

bool isRunningInEmulator() {
  if (Platform.isAndroid) {
    return Platform.environment.containsKey('ANDROID_EMULATOR');
  } else if (Platform.isIOS) {
    return Platform.environment['SIMULATOR_DEVICE_NAME'] != null;
  }

  return false;
}
