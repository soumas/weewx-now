class ShortTermWeather {
  final String label;
  final String unitformat;
  final String unitlabel;
  final Map<DateTime, double> last2hours;
  final Map<DateTime, double> last4hours;
  final Map<DateTime, double> last8hours;
  ShortTermWeather({
    required this.label,
    required this.unitformat,
    required this.unitlabel,
    required this.last2hours,
    required this.last4hours,
    required this.last8hours,
  });
}
