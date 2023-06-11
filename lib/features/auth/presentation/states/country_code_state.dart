import 'package:equatable/equatable.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class CountryCodeState extends Equatable {
  final CountryCode countryCode;

  const CountryCodeState({
    required this.countryCode,
  });

  @override
  List<Object?> get props => [countryCode.code];
}
