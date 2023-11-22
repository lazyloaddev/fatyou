import SwiftUI

struct AccentSmallButton: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .customFont(.smallButtonTxt)
            .lineLimit(1)
            .foregroundColor(Color(.white))
            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            .background(Color(.accent))
            .clipShape(RoundedCorner(radius: 10))
            .opacity(configuration.isPressed ? 0.6 : 1)
    }

}

