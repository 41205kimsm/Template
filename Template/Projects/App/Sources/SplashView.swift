/**
 @module: SplashView
 @author: kimsm
 @since: 11/27/25
 @desc
 @remark
 */
import Foundation
import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("ic_logo_CI")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 120)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}

