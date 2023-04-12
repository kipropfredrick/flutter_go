import 'package:finance/data/money_model.dart';

List<Money> getMoney() {
  Money money = Money();
  money.buy = false;
  money.fee = "300";
  money.name = "upworks";
  money.image = "Education.png";
  return [money];
}
