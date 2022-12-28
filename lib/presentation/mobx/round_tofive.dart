double roundToFive(double degree) {
  double result = degree;
  double ostatok = degree % 5;

  if (ostatok < 3) {
    result = degree - ostatok;
  } else {
    result = degree + (5 - ostatok);
  }
  ;
  return result;
}

int roundToFiveInt(int degree) {
  int result = degree;
  int ostatok = degree % 5;

  if (ostatok < 3) {
    result = degree - ostatok;
  } else {
    result = degree + (5 - ostatok);
  }
  if (result >= 59) {
    result = 55;
  }
  return result;
}
