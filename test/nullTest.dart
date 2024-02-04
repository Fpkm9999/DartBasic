void main(){
  // nullable - null 이 될 수 있다.
 //  non-nullable - null 이 될 수 있다.
// null - 아루런 값도 있지 않다
String name = '코드팩토리';
print(name);
// name = null;  null 이 들어갈 수 없는데 넣어서 오류

String? name2 = '블랙핑크'; // 어떤 타입이든 타입에 `?`가 붙으면 null이 들어갈 수있도록 선언할 수 있다.
// name2 = null;
print(name2);

// print(name2!);  // !표시는 null이 절대 아니라는 표시



}