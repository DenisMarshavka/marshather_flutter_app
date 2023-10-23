import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  PrefManager(this.preferences);
  String kInitCity = 'initCity';

  /// Light, Dark ,System
  SharedPreferences preferences;

  /// Initial City's weather search
  set initCity(String? value) => preferences.setString(kInitCity, value ?? '');

  String? get initCity => preferences.getString(kInitCity);

  /*set allUsersSettingsList(List<UserSettings> settingsList) {
    final settingsStringsList = <String>[];

    settingsList.map((e) {
      settingsStringsList.add(jsonEncode(e));
    }).toList();

    preferences.setStringList(
      kAllUsersSettingsList,
      settingsStringsList,
    );
  }

  List<UserSettings> get allUsersSettingsList {
    final settingsModelsList = <UserSettings>[];

    final stringArray = preferences.getStringList(kAllUsersSettingsList);

    if (stringArray != null) {
      for (final element in stringArray) {
        // final _encodedString = jsonEncode(element);
        final _valueMap = json.decode(element) as Map<String, dynamic>;
        settingsModelsList.add(UserSettings.fromJson(_valueMap));
      }
    }

    return settingsModelsList;
  }*/
}
