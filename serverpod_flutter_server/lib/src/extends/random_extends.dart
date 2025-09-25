import 'dart:math';

class RandomExtends {
  static final random = Random();
  static String get getRandomNumber => '${random.nextInt(10)}';

  static int nextInt(int max) => random.nextInt(max);
}
