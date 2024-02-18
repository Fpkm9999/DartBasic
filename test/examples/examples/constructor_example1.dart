/// ===========================================================
/// fileName       : constructor_example1
/// date           : 2024-02-18
/// description    :
/// ===========================================================

class _MyClass {
  int? x;
  int? y;

  // 기본 생성자
  _MyClass(this.x, this.y);


  // 이름 있는 생성자1

  _MyClass.nameedConstructor(this.x, this.y){
    x = 0;
    y = 0;
  }
  // 이름 있는 생성자2
  _MyClass.origin() {
    x = 0;
    y = 0;
  }

  // 다른 이름 있는 생성자
  _MyClass.fromJson(Map<String, int> json) {
    x = json['x']!;
    y = json['y']!;
  }
}

void main(){
  _MyClass myClass = _MyClass.origin();
  print('${myClass.x}');
  print('${myClass.y}');
}
