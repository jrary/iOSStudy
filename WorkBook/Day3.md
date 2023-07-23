# :one: ViewController Life Cycle

![Life cycle](image-8.png)

## loadView

- View를 메모리에 올리는 함수이다.

## viewDidLoad

![viewDidLoad](image-9.png)

- View의 로딩이 완료되었을 때 시스템에 의해 자동으로 호출된다.
- 리소스를 초기화하거나 초기 화면을 구성하는 용도로 사용한다.

## viewWillAppear

- View가 나타나기 직전에 호출된다.
- View가 이제 나타날 것이라는 신호를 컨트롤러에게 준다.

## viewDidAppear

- View가 화면에 나타난 직후에 실행된다.
- View가 나타났다는 것을 컨트롤러에게 알힌다.
- 화면의 애니메이션을 그린다.

## viewWillDisappear

- View가 삭제되려고 하는 상황을 ViewController에 알린다.

## viewDidDisappear

- View가 삭제되었음을 알려준다.

# :two: Optional

- 값이 들어갈 수도 있고, 아닐 수도 있다(Optional)
- nil을 가지려면 Optional을 사용해야 한다
- Optional로 선언된 자료형은, Optional로 Wrapping되어 있다.

```swift
let myFirstOptionalVar: Int?

let possibleNumber = “123”
let convertedNumber = Int(possibleNumber)
print(convertedNumber)
// 출력 결과 : Optional(123)
```

# Optional Binding

```swift
var value: String? = "test"
var forcedvalue: String = value!
```

- Force unwrapping : !를 사용하여 강제로 옵셔널을 추출

```swift
var myName: String? = "shine"
var yourName: String? = nil

if let name = myName, let friend = yourName {
	print("not in")
}

yourName = "jrary"

if let name = myName, let friend = yourName {
	print("we are \(name) and \(friend)")
}
```

- Optional Binding : if let, guard let을 써서 옵셔널을 추출

> 💡Optional을 Unwrapping 하고자 하는 변수가 nil이면 안 된다.

# Optional Chaining

- 체인의 형태처럼 연쇄적으로 Optional에 접근한다.

```swift
let user = null;

alert( user?.address ); // undefined
alert( user?.address.street ); // undefined
```

- `?.`은 `?.` 앞의 평가 대상이 nil이면 평가를 멈추고 nil을 반환한다.

# :three: guard문

```swift
guard 조건 else {
	// 조건이 false일 때 실행
}
```

- 조건을 걸러내는 기능이다.
- if문보다 가독성이 좋다.

```swift
guard someValue != 0 else { return }
print(someValue)
```

```swift
func printMessage(_ message: String?) {
	guard let letMessage = message else { return }
    print(letMessage)
}
printMessage(string)
```

- guard를 사용하면 if로 옵셔널 바인딩했을 때와 달리 { } 괄호 밖에서도 사용 가능하다.

# :four: 화면 전환

- iOS에서 화면을 전환하는 방법

1. 소스코드에서 구현 - 특정 상황에 대응할 수 있으나, 구현이 복잡
2. 스토리보드에서 구현 - 특정 상황에 대응하기 어렵지만, 구현하기 쉬움

- iOS에서의 화면 전환 개념

1. ViewController의 View 위에 다른 View를 가져와 교체하는 방식 - Container View Controller
2. ViewController에서 다른 ViewController를 호출하여 화면 전환하는 방식
3. 네비게이션 컨트롤러를 사용하여 화면 전환하는 방식
4. 화면 전환용 객체 세그웨이(Segueway)를 사용하는 방식.

## present

- 뷰가 이동하는 방식 중 하나이다.
- 아래에서 위로 뷰가 전환된다.
- alert 알람, 새로운 이메일 작성하기 등에 사용된다.

```swift
@IBAction func exampleFunction(_ sender: Any) {
    guard let ExampleViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerID") else {return}

    self.present(ExampleViewController, animated: true, completion: nil)
}
```

> - viewControllerToPresent : 전환 될 뷰
> - animated : 애니메이션 여부
> - completion : 이동하고 나서 실행될 문장 블럭

### dismiss

```swift
func dismiss(animated flag: Bool, completion: (() -> Void)? = nil)
```

- 이전으로 돌아가는 설정을 한다.
- present된 뷰를 메모리에서 삭제하고 걷어낸다.

```swift
@IBAction func gotoBack(_sender: Any) {
	self.dismiss(animated: true, completion: nil)
}
```

> - animated : 애니메이션 여부
> - completion :
>   이동하고 나서 실행될 문장 블럭

## Navigation Controller

# :five: ViewController 간의 데이터 전달
