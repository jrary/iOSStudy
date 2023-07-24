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

- 계층적 구조의 뷰 워크플로우를 구현하기 위해 사용한다.
- ViewController 사이 계층 구조를 탐색할 수 있게 해주는 객체이다.
- 자식 뷰를 Stack으로 관리한다.

### 1. push : 뷰 이동

```swift
func pushViewController(_ viewController: UIViewController, animated: Bool)
```

- 가로 방향으로 뷰가 전환된다.
- 스택에 뷰를 쌓는 형태로 화면을 업데이트한다.

```swift
@IBAction func gotoNextVC(_ sender: Any)
  guard let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "SignUpNickNameVC")  else {return}

  self.navigationController?.pushViewController(signUpVC, animated: true)
}
```

- pushViewController(\_:animated:)
  - viewController : 전환될 뷰
  - animated : 애니메이션 효과

### 2. pop : 돌아가기

```swift
func popViewController(animated: Bool) -> UIViewController?
```

- 스택에 쌓인 뷰 1개를 pop하고 돌아간다.

```swift
@IBAction func gotoBack(_ sender: Any)
	self.navigationController?.popViewController(animated: true)
}
```

- popViewController(animated:)
  - animated : 애니메이션 효과

### 3. popTo : 원하는 스택으로 돌아가기

```swift
func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]?
```

- 네비게이션 스택의 원하는 ViewController로 돌아간다.
  = 특정 viewController 가 navigation stack 의 맨 위에 올때까지 Pop을 진행한다.

```swift
@IBAction func gotoBack(_ sender: Any)
  guard let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "SignUpNickNameVC")  else {return}
	welcomeVC.modalPresentationStyle = .fullScreen

	self.present(welcomeVC, animated: true, completion: {
		//navigation 스택에서 돌아가고싶은 뷰까지 pop하면서 이동
		if let rootVC = ViewControoller as? LoginVC {
			self.navigationController?.popToViewController(rootVC ,animated: true)
		}
	})
}
```

- popToViewController(\_:animated:)
  - viewController : pop해서 이동할 뷰
  - animated : 애니메이션 효과

### 4. popToRoot : 맨 처음으로 돌아가기

```swift
func popToRootViewController(animated: Bool) -> [UIViewController]?
```

- 네비게이션 스택의 RootView로 돌아간다.

```swift
@IBAction func gotoNextVC(_ sender: Any)
  guard let signUpVC =  self.storyboard?.instantiateViewController(withIdentifier: "SignUpNickNameVC")  else {return}
	welcomeVC.modalPresentationStyle = .fullScreen

	self.present(welcomeVC, animated: true, completion: {
		self.navigationController?.popToRootViewController(animated: true)
	})
}
```

- popToViewController(\_:animated:)
  - animated : 애니메이션 효과

# :five: ViewController 간의 데이터 전달

1. 직접 전달 방식(동기 방식) : 데이터를 직접 넘겨주는 방법

- present,push시 프로퍼티에 접근해 넘겨주는 방식
- Segue prepare 메소드를 활용해서 데이터를 넘겨주는 방식
- Protocol / Delegation을 활용해서 데이터를 넘겨받는 방식
- Closure를 활용해서 데이터를 넘겨받는 방식
- NotificationCenter를 활용해 데이터를 넘기는 방식

2. 간접 전달 방식(비동기 방식) : 데이터를 다른곳에 저장해두고, 필요할 때 꺼내가는 방식

- AppDelegate.swift 활용
- UserDefaults 사용하기
- CoreData or Realm 활용하기

## 프로퍼티 직접 접근

- 전달하고자 하는 데이터를 뷰 컨트롤러의 프로퍼티에 직접 접근해서 넘기는 방식이다.
- push, present 방식으로 화면을 전환하는 경우에만 데이터가 정상적으로 사용 가능하다.

```swift
@IBAction func clickPushButton(_ sender: UIButton) {
        guard let viewController =
                self.storyboard?.instantiateViewController(withIdentifier: "blueViewController") as? blueViewController
        else { return }

        viewController.data = "Blue View Controller로 데이터 이동 완료"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
```

```swift
import UIKit

class blueViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 전달 받은 데이터를 Label에 표시
        if let data = data {
            dataLabel.text = data
            dataLabel.sizeToFit()
        }
    }

    @IBAction func clickBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
```

## Delegate를 이용하여 이전 화면에 데이터 전달

- Delegate를 이용하면 데이터를 주고 받는 뷰 컨트롤러가 서로 의존하지 않고 떨어져 있는 구조를 유지하게 된다.
- Delegate 패턴을 사용하여 현재 화면의 데이터를 이전 화면에 넘겨 주는 것이 가능하다.

```swift
protocol SendDataDelegate: AnyObject {
    func sendData(data: String)
}
```

```swift
import UIKit

class ViewController: UIViewController, SendDataDelegate {
    @IBOutlet weak var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickPushButton(_ sender: UIButton) {
        guard let viewController =
                self.storyboard?.instantiateViewController(withIdentifier: "blueViewController") as? blueViewController
        else { return }

        viewController.data = "Blue View Controller로 데이터 이동 완료"

        viewController.delegate = self // delegate를 위임받음
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    // SendDataDelegate 프로토콜 구현
    func receiveData(data: String) {
        self.dataLabel.text = data
        self.dataLabel.sizeToFit()
    }
}
```

```swift
import UIKit

protocol SendDataDelegate: AnyObject {
    func receiveData(data: String)
}

class blueViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var data: String?
    weak var delegate: SendDataDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = data {
            dataLabel.text = data
            dataLabel.sizeToFit()
        }
    }

    @IBAction func clickBackButton(_ sender: UIButton) {
        delegate?.receiveData(data: "To green view controller") // 데이터 전달
        self.navigationController?.popViewController(animated: true)
    }

}
```
