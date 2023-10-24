class WeatherName {
  final String night;
  final String day;

  const WeatherName({
    required this.night,
    required this.day,
  });
}

enum WeatherType {
  sun(
    codes: [0, 1],
    value: <WeatherName>[
      WeatherName(
        day: 'Sunny',
        night: 'Clear',
      ),
      WeatherName(
        day: 'Mainly Sunny',
        night: 'Mainly Clear',
      ),
    ],
    iconSrc: 'assets/icons/sunny.svg',
    iconNightSrc: 'assets/icons/moony.svg',
  ),
  fog(
    codes: [
      45,
      48,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Foggy',
        night: 'Foggy',
      ),
      WeatherName(
        day: 'Rime Fog',
        night: 'Rime Fog',
      ),
    ],
    iconSrc: 'assets/icons/foggy.svg',
  ),
  rain(
    codes: [
      51,
      53,
      56,
      57,
      61,
      63,
      66,
      67,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Light Drizzle',
        night: 'Light Drizzle',
      ),
      WeatherName(
        day: 'Drizzle',
        night: 'Drizzle',
      ),
      WeatherName(
        day: 'Light Freezing Drizzle',
        night: 'Light Freezing Drizzle',
      ),
      WeatherName(
        day: 'Freezing Drizzle',
        night: 'Freezing Drizzle',
      ),
      WeatherName(
        day: 'Light Rain',
        night: 'Light Rain',
      ),
      WeatherName(
        day: 'Rain',
        night: 'Rain',
      ),
      WeatherName(
        day: 'Light Freezing Rain',
        night: 'Light Freezing Rain',
      ),
      WeatherName(
        day: 'Freezing Rain',
        night: 'Freezing Rain',
      ),
    ],
    iconSrc: 'assets/icons/rainy.svg',
  ),
  heavyRain(
    codes: [
      55,
      65,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Heavy Drizzle',
        night: 'Heavy Drizzle',
      ),
      WeatherName(
        day: 'Heavy Rain',
        night: 'Heavy Rain',
      ),
    ],
    iconSrc: 'assets/icons/rainy_heavy.svg',
  ),
  cloudy(
    codes: [
      2,
      3,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Partly Cloudy',
        night: 'Partly Cloudy',
      ),
      WeatherName(
        day: 'Cloudy',
        night: 'Cloudy',
      ),
    ],
    iconSrc: 'assets/icons/cloudy.svg',
    iconNightSrc: 'assets/icons/cloudy_night.svg',
  ),
  thunderstorm(
    codes: [
      95,
      96,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Thunderstorm',
        night: 'Thunderstorm',
      ),
      WeatherName(
        day: 'Light Thunderstorms With Hail',
        night: 'Light Thunderstorms With Hail',
      ),
    ],
    iconSrc: 'assets/icons/thunderstorm.svg',
  ),
  heavyThunderstorm(
    codes: [
      99,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Thunderstorm With Hail',
        night: 'Thunderstorm With Hail',
      ),
    ],
    iconSrc: 'assets/icons/thunderstorm_heavy.svg',
  ),
  snow(
    codes: [
      71,
      73,
      75,
      77,
      80,
      81,
      82,
      85,
      86,
    ],
    value: <WeatherName>[
      WeatherName(
        day: 'Light Snow',
        night: 'Light Snow',
      ),
      WeatherName(
        day: 'Snow',
        night: 'Snow',
      ),
      WeatherName(
        day: 'Heavy Snow',
        night: 'Heavy Snow',
      ),
      WeatherName(
        day: 'Snow Grains',
        night: 'Snow Grains',
      ),
      WeatherName(
        day: 'Light Showers',
        night: 'Light Showers',
      ),
      WeatherName(
        day: 'Showers',
        night: 'Showers',
      ),
      WeatherName(
        day: 'Heavy Showers',
        night: 'Heavy Showers',
      ),
      WeatherName(
        day: 'Light Snow Showers',
        night: 'Light Snow Showers',
      ),
      WeatherName(
        day: 'Snow Showers',
        night: 'Snow Showers',
      ),
    ],
    iconSrc: 'assets/icons/snowy.svg',
  );

  factory WeatherType.fromCode(int code) {
    return WeatherType.values
        .where((weather) => weather.codes.contains(code))
        .first;
  }

  const WeatherType({
    required this.codes,
    required this.value,
    required this.iconSrc,
    this.iconNightSrc,
  });

  final List<int> codes;
  final List<WeatherName> value;
  final String iconSrc;
  final String? iconNightSrc;
}
