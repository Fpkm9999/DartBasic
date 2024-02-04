void main(){
 var year = 2024;
 var flybyObjects = [1,2,3];

if (year >= 2001) {
print('21st century');
} else if (year >= 1901) {
print('20th century');
}

for (final object in flybyObjects) {
print(object);
}
print(' ');

for (int month = 1; month <= 12; month++) {
print(month); // 1월 부터 2월까지 출력
}

while (year < 2016) {
year += 1;
}

while (year > 2019){
  print('S24');
  break;
}
}