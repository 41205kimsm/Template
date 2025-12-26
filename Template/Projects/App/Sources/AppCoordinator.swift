/**
 @module:
 @author: kimsm
 @since:
 @desc
 @remark
 */

// Projects/App/Sources/AppCoordinator.swift

import UIKit
import SwiftUI

// App 모듈의 메인 흐름을 관리합니다.
final class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // 앱 시작 시 호출되어 Splash 화면을 띄우고 타이머를 시작합니다.
    func start() {
        // 1. SplashView를 root로 설정
        let splashView = SplashView()
        let rootViewController = UIHostingController(rootView: splashView)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        // 2. 2초 후 Intro 화면으로 전환
        // Dispatch Queue를 사용하여 비동기로 지연 실행합니다.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.showIntroScreen()
        }
    }
    
    private func showIntroScreen() {


    }
}
