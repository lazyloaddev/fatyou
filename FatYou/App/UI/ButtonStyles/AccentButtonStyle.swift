import SwiftUI

struct AccentButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .customFont(.buttonText)
            .foregroundStyle(Color(.white))
            .padding([.top, .bottom], 15.0)
            .frame(maxWidth: .infinity)
            .background(Color(.accent))
            .clipShape(RoundedCorner(radius: 10))
            .opacity(configuration.isPressed ? 0.6 : 1)
    }

}
