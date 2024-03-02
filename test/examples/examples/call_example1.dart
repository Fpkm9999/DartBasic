/// ===========================================================
/// fileName       : call_example1
/// date           : 2024-02-18
/// description    :
/// ===========================================================
void caller(void Function(int p) notNull, [void Function(int p)? nullable = null]) {
  // 전달된 고차함수가 Nullable이 아닐 때 호출
  notNull(10);
  notNull.call(10); // notNull 변수를 통해 함수를 호출하는 것과 동일
  // 전달된 고차함수가 Nullable일 때 호출
  nullable?.call(10); // nullable 변수를 통해 함수를 호출하는 것과 동일
}
void main(){
  caller((p) { });
}
/*

"call 메소드"는 일반적으로 명시적으로 호출하지 않는 메소드이며,
단순히 Dart의 함수를 호출하는 데 사용됩니다.
제가 언급한 call은 명시적인 메소드 호출이 아니라, 함수 객체 자체를 호출하는 데 사용되는 Dart의 기능.

Dart에서 함수는 객체이기 때문에, 해당 객체의 call 메소드를 사용하여 함수를 호출할 수 있습니다.
그렇기 때문에 함수를 변수에 할당하고, 이 변수를 통해 함수를 호출할 수도 있습니다.
아래의 코드에서 notNull과 nullable은 함수를 가리키는 변수로서,
 이 변수를 사용하여 함수를 호출하는 것과 call 메소드를 사용하는 것은 동일한 동작을 수행합니다.
 */