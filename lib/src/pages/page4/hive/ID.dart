import 'package:hive/hive.dart';

part 'id.g.dart';

@HiveType(typeId: 3)
class Id {
  Id({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvv,
    required this.countryFlagEmoji,
    this.cardType,
  });

  @HiveField(0)
  String cardNumber;

  @HiveField(1)
  String expiryDate;

  @HiveField(2)
  String cardHolderName;

  @HiveField(3)
  String cvv;

  @HiveField(4)
  String countryFlagEmoji;

  @HiveField(5, defaultValue: 'other ')
  String? cardType;
}
