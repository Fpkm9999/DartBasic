void main(){
  // Set
  final Set<String> names = {
    'Code Factory',
    'Flutter',
    'Black Pink',
    // 'Flutter', 중복은 안됨
  };
  print(names);

  names.add('Jenny');
  print(names);

  names.remove('Jenny');
  print(names);

  print(names.contains('Flutter'));
}