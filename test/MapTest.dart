void main() {
  // Map
  // Key / Value
  Map<String, String> dictionary = {
    'Harry potter': '해리포터', // 키, 벨류. 키를 이용해 벨류를 찾음
    'Ron Weasley': '론 위즐리',
    'Hermione Granger': '헤르미온느 그레인저',
  };
  print(dictionary);

  Map<String, bool> isHarryPotter = {
    'Harry potter': true, // 키, 벨류. 키를 이용해 벨류를 찾음
    'Ron Weasley': true,
    'Ironman': false,
  };
  print(isHarryPotter);

  isHarryPotter.addAll({
    'Spiderman' : false,
  });
  print(isHarryPotter);

  print(isHarryPotter['Ironman']);
  isHarryPotter['Hulk'] = false;
  print(isHarryPotter);

  isHarryPotter['Spiderman'] = true;
  print(isHarryPotter);

  print(isHarryPotter);
  isHarryPotter.remove('Harry potter');
  print(isHarryPotter);

  print(isHarryPotter.keys);
  print(isHarryPotter.values);
}
