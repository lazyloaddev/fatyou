import SwiftUI

struct StepperView: View {

    @State
    var value = 0

    var body: some View {
        HStack(spacing: 0) {
            Button {
                value = max(value - 1, 0)
            } label: {
                Image(.minus)
                    .padding(8)
                    .background(Color(.white))
                    .clipShape(RoundedCorner(radius: 10))

            }

            ZStack {
                TextField("", value: $value, format: .number)
                    .textFieldStyle(.plain)
                    .keyboardType(.numberPad)
                    .frame(idealWidth: 79)
                    .multilineTextAlignment(.center)
                    .fixedSize()
                Divider().background(Color(.controlSecondary))
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .padding([.leading, .trailing], 8)

            Button {
                value = min(value + 1, Int.max - 1)
            } label: {
                Image(.plus)
                    .padding(8)
                    .background(Color(.white))
                    .clipShape(RoundedCorner(radius: 10))
            }
        }.fixedSize()

    }
}
