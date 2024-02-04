/**
 * ===========================================================
 * fileName       : day4_collection
 * date           : 2024-02-01
 * description    :
 * ===========================================================
 * - 배열(Array)
 *    같은 데이터 타입을 N 개 생성한 것  > 메모리 공간 N개를 일렬(연속적)로 선언한 것
 *
 *   정적 배열 : 길이(Length, 크기 Size)가 고정인 배열 - 모든 언어에서 기본 지원되는 배열
 *   동적 배열 : 길이가 동적인 배열(요소 Element 추가/삭제 가능) - 컬렉션의 리스트
 *              (비연속적일 수 있음)
 *
 *   배열의 시스템 두 가지
 *   0 기반 배열(0-Based Array) : 배열에서 0번째부터 시작 - 일반적인 언어에서 채택하는 시스템
 *   1 기반 배열(1-Based Array) : 배열에서 1번째부터 시작
 *
 *   0-Based Array vs 1-Based Array
 *   마지막 번째 요소를 가져올 때,
 *   0-Based Array 는 size-1 위치로 접근
 *   1-Based Array 는 size 위치로 접근
 *
 *   복사 방법 두 가지
 *   얕은 복사(Shallow Copy) : 레퍼런스 주소만 복사해옴(여기서는 배열의 시작 위치)
 *   깊은 복사(Deep Copy) : 값 자체를 복사해옴
 *
 * - 동적 배열 구현 방법 두 가지
 *   정적 배열을 내부적으로 사용하여 구현하는 방법
 *   객체를 N개로 묶어서 구현하는 방법
 *
 * - 자료구조(Data structure)
 *   데이터의 모양
 *
 * - 자료구조의 정렬(Sorting)/탐색(Searching)
 *   정렬 : 자료구조에서 내가 원하는대로 데이터를 순서화 시키는 것 (보통 오름차순/내림차순)
 *   탐색 : 자료구조에서 내가 원하는 데이터를 찾아내는 것
 *
 * - 자료구조의 종류
 *   선형 - 배열(Array), 목록(List), 집합(Set), 큐(Queue), 스택(Stack), 덱(Deque)
 *          원형큐(Circular Queue), 우선순위큐(Priority Queue),
 *          이중 연결 리스트(Double-Linked List)
 *   비선형 - 그래프(Graph), 그래프의 한 종류로 트리(Tree), 테이블(Table)/맵(Map)
 *
 * - 컬렉션(Collection)
 *   자료구조의 모음
 *
 * - 컬렉션에서 기본 지원되는 자료구조 : 현대 언어들에서 기본 지원하는 컬렉션
 *   리스트 - 값이 중복 가능한 동적 배열
 *   셋 - 값이 중복 불가능한 동적 배열 - 일반적으로 해시 셋으로 구현됨(값을 해시화)
 *   맵 - 키와 값으로 연결된 자료구조 - 일반적으로 해시 테이블로 구현됨(키를 해시화)
 *
 * - 해시(Hash)
 *   특정한 값을 숫자화
 *   e.g. ABC는 0이다. DEF는 1이다.
 *        0101 = ABCDEFABCDEF
 *        여기서 0101은 해시와 같은 것이다.
 */
void main() {
  // 기본 선언 방법
  var list1 = []; // 리터럴 리스트
  var list2 = List.empty(); // 생성자를 통한 리스트

  // 생성 시 값과 함께 선언하는 방법
  var initializedList1 = [for (int i = 0; i < 10; i++)
    i
  ];
  var initializedList2 = List.generate(10, (index) {
    print(index);
    return index;
  }); // 10 개 선언 했으므로 iindex == 0~9
  var initializedList3 = List.generate(10, (index){
    return initializedList2[index] + 1;
  });
  // List<E>.generate(int length, E generator(int index),{bool growable: true})
  // length의 길이만큼 0부터 index - 1까지 범위의 각 인덱스를 오름차순으로 호출하여 만든 값으로 리스트를 생성합니다.
  // growable의 기본값은 true이고, false인 경우 생성된 리스트의 길이는 고정됩니다.

  // 값에 대한 불변(Immutable) vs 가변(Mutable)
  // 값 변경은 가능, 데이터 추가/제거 불가능
  var immutable = initializedList2.toList(growable:false);
  print('immutable : ${immutable}');
  // 요소는 반복 순서로 되어 있습니다. false 인 경우 목록은 고정 길이입니다 growable.
  // to list() 함수
  // 생성되는 값들을 리스트로 만들어서 반환한다.
  var mutable = immutable.toList(growable: true);
  // 바로 위처럼 하면 값 복사로 수행됨 (깊은 복사 Deep Copy)
  var shallowCopied = initializedList2;

  // 바로 위처럼 하면 주소 복사로 수행됨(얕은복사 Shallow Copy)
  shallowCopied[1] = 10; // initializedList2[1] == 10
  mutable[2] = 20; // initializedList2[2] != 20

  // 상수화 - 리스트를 가르키는 변수의 레퍼런스 주소에 대해서 상수화 (리스트 내부는 변경 가능한 상태)
  final constants1 = [];
  var constants2 = List.unmodifiable(initializedList2); // 내용물 상수화
  print(constants2);
  constants2 = [1,2,3,4];
  const constList = const[1,2,3,4]; // final 과의 차이 : list 가 컴파일 타임부터 상수화됨
  // 위의 const 상수화는 컴파일 타임부터 어떤 값인지 명확할 때만 사용 가능
  print(constList);


  // 값 가져오기 - 0번째 부터 시작
  // 첫 번째 요소 가져오기
  int first1 = initializedList1[0]; // 인덱서(Indexer)를 통해 값을 가져옴
  print(first1);
  int first2 = initializedList1.first;
  print(first1);

  // 마지막 번째 요소 가져오기
  int last1 = initializedList1[initializedList1.length-1];
  print(last1);
  int last2 = initializedList1.last;
  print(last1);

  initializedList1.add(11); // size: 11
  print(initializedList1.length);
  print("현재 배열 상태1 : (${initializedList1.length})");  // 현재 배열 상태1 : (11)
  initializedList1.clear();
  bool isEmpty = initializedList1.isEmpty;  // 리스트가 비었는지 여부
  print(isEmpty);
  bool isnotEmpty = initializedList1.isNotEmpty;  // 리스트가 비어있지 않는가?

  // 값만 가져오기
  for(final value in initializedList1){ /*... */ } // Iterable 로 접근
  // 인덱스 + 값 같이 가져오기
  for(final (index, value) in initializedList2.indexed) {
    /*... */};


  // Set 또는 Map을 사용할 때는 var 사용 자제
  var varSet = <String>{};
  var varMap = <String, String>{};
  var data = {};// 여기서 Set인지, Map인지 프로그래머가 혼란이 생길 수 있음

  // Set을 사용하는 이유는 List로부터 중복 제거
  Set<int> set1 = Set.of(initializedList1);
  Set<int> set2 = initializedList1.toSet();
  // 역변환
  List<int> listFromSet = set2.toList();

  //set1[1];// 인덱서(Indexer)가 없어서 이렇게 접근 불가능
  int third = set1.elementAt(2);
  set1.add(10); //Dart에서 지원하긴 하지만, 잘 사용안함
  set1.remove(5); //Dart에서 지원하긴 하지만, 잘 사용안함
  set1.clear();
  // 근데 초기화 할때 말고 추후에 추가/제거할려면
  // add remove 함수 말고 없지 않음?
  // 각 요소 접근
  for(final value in set1) { /* ... */ }

  for(final (index, value) in set1.indexed) { /* ... */ }


  // Map : 키 + 값 => 키는 유일한 이름이어야 함
  Map<String, int> map1 = {};
  var map2 = <String, int>{
    for(int i = 0; i < 10; i++)
      "A" : i // 키 콜론(:) 값
  };
  Map<String, int> immutableMap = Map.unmodifiable(map2);

  // 리스트를 맵으로...
  Map<String, int> mapFromList = Map.fromEntries(list1.map((e) => MapEntry("A", 10)));
  List<MapEntry<String, int>> listFromMap = mapFromList.entries.toList();

  map2["B"] = 200; // 키 "B" 추가, Map에는 인덱서(Indexer) 있음
  map2.remove("B"); // 키 "B" 제거

  // 문자열 중복 제거하기 : 2가지 방법으로 제거하기
  List<String> strings = [ "a", "b", "c", "f", "b", "c" ];
  strings = strings.toSet().toList();
  strings = Map.fromEntries(strings.map((e) => MapEntry(e, 0)))
      .entries.map((e) => e.key).toList();

  // 문자열에서 같은 문자열 횟수 세기
  strings = [ "a", "b", "c", "f", "b", "c" ];
  Map<String, int> counter = {};
  for(final value in strings) {
    if(!counter.containsKey(value)) {
      counter[value] = 0;
    }
    counter[value] = counter[value]! + 1;
  }
  for(final entry in counter.entries) {
    print("${entry.key} 횟수는 ${entry.value} 입니다.");
  }
}
