//
//  View.swift
//  Architecture
//
//  Created by kimsoomin on 12/4/25.
//

import SwiftUI


public final class SwiftUIViewController<Content: View>:
    UIHostingController<Content>,
    ViewControllerProtocol {

    public var uiViewController: UIViewController { self }

    public init(@ViewBuilder content: () -> Content) {
        super.init(rootView: content())
    }

    @available(*, unavailable)
    dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var prefersStatusBarHidden: Bool {
        true        
    }
}
