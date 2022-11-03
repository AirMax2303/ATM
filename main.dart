void main() {
  // Изначально предполагается, что список отсортирован по убыванию номиналов
  List<Money> allMoney = [
    Money(5000, 10),
    Money(1000, 20),
    Money(500, 30),
    Money(100, 40)
  ];
  void getMoneyFromATM(int giveOut) {
    bool stop = true;
    int index = 0;
    int balanceATM = 0;

    for (var m in allMoney) {
      balanceATM += m.count * m.value;
    }
    // Идёт проверка, достаточно ли денежных средств в банкомате
    // и есть ли купюры нужного номинала
    if ((giveOut <= balanceATM) && (giveOut % allMoney[allMoney.length - 1].value) == 0) {
      do {
        // Проверяем, есть ли купюры определенного номинала
        if (allMoney[index].count > 0) {
          // Считаем купюры для выдачи
          if (giveOut ~/ allMoney[index].value >= 1) {
            giveOut -= allMoney[index].value;
            allMoney[index].count--;
          } else {
            if (giveOut < allMoney[allMoney.length - 1].value) {
              stop = false;
            } else {
              index++;
            }
          }
        } else {
          index++;
        }
      } while (stop);

      print('Сумма выдана.');
      print('');
      print('Количество оставшихся номиналов купюр:');
      for (var m in allMoney) {
        print('${m.count} шт номинала ${m.value}');
      }
    } else {
      print('Невозможно выдать данную сумму.');
    }
  }

  getMoneyFromATM(12500);
  print('------------------');
  getMoneyFromATM(37550);
  print('------------------');
  getMoneyFromATM(2900);
}

class Money {
  int value;
  int count;
  Money(this.value, this.count);
}
