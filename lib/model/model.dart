class Currensy {
  final String lastUpdates;
  final String nextUpdates;
  final Map<String, dynamic> rates;

  Currensy({
    required this.lastUpdates,
    required this.nextUpdates,
    required this.rates,
  });

  factory Currensy.fromJson(Map<String, dynamic> json) {
    return Currensy(
      lastUpdates: json['time_last_update_utc'],
      nextUpdates: json['time_next_update_utc'],
      rates: json['conversion_rates'],
    );
  }
}
