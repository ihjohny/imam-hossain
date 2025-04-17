class DurationPeriod {
  final int? startYear;
  final int? startMonth;
  final int? endYear;
  final int? endMonth;

  DurationPeriod({
    this.startYear,
    this.startMonth,
    this.endYear,
    this.endMonth,
  });

  bool get isPresent => endYear == null && endMonth == null;

  factory DurationPeriod.fromJson(Map<String, dynamic> json) {
    return DurationPeriod(
      startYear: json['startYear'],
      startMonth: json['startMonth'],
      endYear: json['endYear'],
      endMonth: json['endMonth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startYear': startYear,
      'startMonth': startMonth,
      'endYear': endYear,
      'endMonth': endMonth,
    };
  }
}
