/**
 * - 인터페이스(Interface)
 *   메소드 구현만 강제하는 기능
 *   DART에서는 전용 키워드인 interface 같은 키워드를 제공하지 않음
 *
 * - 일반 클래스 vs 추상 클래스 vs 인터페이스
 *   공통 : 추상 메소드, 추상 액세서 가능
 *   일반 클래스(상속) : 직접 생성 가능, 멤버변수 선언 및 상속 가능, 다중 상속 불가
 *   추상 클래스(상속) : 직접 생성 불가능, 멤버변수 선언 및 상속 가능, 다중 상속 불가
 *   인터페이스(구현) : 직접 생성 불가능, 멤버변수 선언 및 상속 불가능, 다중 구현 가능
 *
 *   => 직접 생성 가능 : 이미 구현 완료, 그 자체로 의미가 있으며, 사용 가능
 *      직접 생성 불가능 : 아직 구현되지 않은 부분이 존재, 개념적으로만 의미 있음, 사용 불가
 *   => 멤버 변수 선언/상속 가능 : 상태 값을 지님
 *      멤버 변수 선언/상속 불가능 : 상호 간의 기능만 연결
 *   => 다중 상속 불가 : 기회가 1회 => 사용성에 있어서 불리 => 종류 제한 시 사용
 *      다중 구현 가능 : 기회가 N회 => 사용성에 있어서 유리 => 종류 제한 없음
 *
 *   문법을 떠나서 보면, 사용성에 유리한 순위
 *   전략 > 인터페이스 > 추상 클래스 > 일반 클래스
 *
 * - 다형성
 *   객체 간 다양한 형태로 변환 가능하다는 개념
 *   e.g. 동물 > 사람/개/고양이 변환 가능 : 명시적 캐스팅
 *        사람/개/고양이 > 동물 변환 가능 : 묵시적 캐스팅
 */
abstract class Interface {
  int parentField = 100;
}
class Impl implements Interface {
  @override
  int parentField = 20;
}