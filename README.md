
# Template: 📱 iOS Project Starter Kit

> **Tuist + Scaffold Template 기반 iOS 프로젝트**
> 빠른 모듈 확장과 일관된 아키텍처를 위한 스타터 구조입니다.

---

## ✨ 주요 특징

* 🛠 **Tuist 기반 프로젝트 관리**
* 🧩 **Scaffold / Stencil Template 적용** (모듈·파일 자동 생성)
* 🏗 **RIBs 기반을 단순화한 아키텍처**
* 🔌 **Protocol 중심 설계**로 모듈 간 의존성 최소화


---

## 🚀 초기 구현 상태

앱 실행 시 아래 플로우가 기본 구현되어 있습니다:

```
App → Intro → Login
```

* 🟢 **Intro**

  * SwiftUI 기반 구현

* 🔵 **Login**

  * UIKit (`UIViewController`) 기반 구현

> SwiftUI와 UIKit을 혼합하여 사용할 수 있는 구조를 기본으로 제공합니다.

---

## 🧱 모듈 구성 전략

### 📦 Basic Module

* **Feature가 아닌 공통/기반 모듈**을 추가할 때 사용
* 예시:

  * Core
  * Shared
  * Architecture

---

### 🧩 Feature Module

* 실제 화면 단위의 기능 구현 시 사용
* Scaffold Template을 통해 **Feature 모듈 생성 시 기본 구조 자동 생성**

```
FeatureName/
 ├── View
 ├── ViewModel
 ├── Router
 ├── Factory
 └── Dependency
```

---

## 🧠 Architecture 구조

본 프로젝트는 RIBs 구조를 기반으로 하되,
러닝 커브를 줄이기 위해 필수 개념만 남겨 단순화했습니다.

### 📐 구성 요소

* 🎨 **UI**

  * `View` (SwiftUI)
  * `ViewController` (UIKit)

* 🧠 **ViewModel**

  * 비즈니스 로직 처리

* 🧭 **Router**

  * 화면 전환
  * Feature Module 간 연결

* 🏭 **Factory**

  * 모듈 생성 책임

* 🔌 **Dependency**

  * 의존성 주입 관리

> 이 아키텍처를 기준으로 **모든 Feature 모듈을 구성**합니다.

---

## 🧩 Core Module

📁 **공통 유틸리티 모듈**

* Util
* Extensions

> 앱 전반에서 사용되는 순수 공통 로직을 포함합니다.

---

## 🎨 Shared Module

📁 **UI 공통 모듈**

* 🎨 **Design System**

  * Color / Font / Typography / Component Style

* 🧱 **Common UI**

  * 재사용 가능한 UI 컴포넌트

> Feature 모듈에서는 Shared를 통해 UI를 구성합니다.

---

## 🧬 Protocol-Oriented Design

* ✅ **모든 클래스는 Protocol을 통해 외부에 노출**됩니다.
* ✅ 구현체에 직접 의존하지 않도록 설계
* ✅ 테스트, 모듈 교체, 확장에 유리

```swift
protocol LoginViewModelProtocol {
    func login()
}
```

---

## ⚙️ Scaffold / Stencil Template

* 📄 Feature 생성 시 **기본 파일 구조 자동 생성**
* 📐 아키텍처 규칙 강제
* ⏱ 반복 작업 최소화

> 새로운 Feature는 반드시 Scaffold Template을 통해 생성하는 것을 권장합니다.



✨ **새로운 기능은 Feature 모듈로, 공통 로직은 Basic 모듈로 추가하세요.**
