import 'package:finance/data/money_model.dart';

List<Money> geter_top() {
  Money money = Money();
  money.buy = false;
  money.fee = "300";
  money.name = "upworks";
  money.image = "Education.png";
  money.time = "jan 30,2023";
  Money snap = Money();
  snap.buy = false;
  snap.fee = "300";
  snap.name = "upworks";
  snap.image = "Education.png";
  snap.time = "today";
  return [money,snap];
}
