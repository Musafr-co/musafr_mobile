import 'dart:ui';

Color rgba(int i, int j, int k, double l) {
  return Color.fromARGB((l*255).toInt(), i, j, k);
}