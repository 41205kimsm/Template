import SwiftUI
import Architecture
import DesignSystem
import Extensions

struct IntroView: View {
    
    @ObservedObject var viewModel: IntroViewModel

    var body: some View {
        ZStack {
            Image("logo_bi", bundle: .designSystem)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 120)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.ignoresSafeArea())
    }
}
