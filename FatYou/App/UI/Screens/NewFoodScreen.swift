import SwiftUI

struct NewFoodScreen: View {
    let onClose: () -> Void
    @State var name = "Eggs"
    @State var calories = "125"
    @State var protein = ""
    @State var sugar = ""
    @State var fat = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Adding new food")
                    .customFont(.h1)
                    .foregroundStyle(Color(.accent))
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))

                NewFoodTextArea(title: "Nessesary fields") {
                    NewFoodTextField(text: $name, placeholder: "Name", trailingTitle: nil)
                        .padding(.bottom, 15)
                    NewFoodTextField(text: $calories, placeholder: "Calories", trailingTitle: "cal")
                }

                NewFoodTextArea(title: "All other staff") {
                    NewFoodTextField(text: $protein, placeholder: "Protein per serving", trailingTitle: "g")
                        .padding(.bottom, 15)
                    NewFoodTextField(text: $sugar, placeholder: "Sugar per serving", trailingTitle: "g")
                        .padding(.bottom, 15)
                    NewFoodTextField(text: $fat, placeholder: "Fat per serving", trailingTitle: "g")
                }

                Button {
                    onClose()
                } label: {
                    Text("SAVE")
                }
                .buttonStyle(AccentButtonStyle())
                .padding(EdgeInsets(top: 21, leading: 16, bottom: 0, trailing: 16))

            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(.lightBg))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    onClose()
                } label: {
                    Image(.back).foregroundColor(Color(.mainText))
                }
                .padding(.bottom, 12)
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

private struct NewFoodTextField: View {
    @Binding
    var text: String
    let placeholder: String
    let trailingTitle: String?

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(Color(.minorTxt))
                }
                .customFont(.bodyTextSmall)
                .foregroundStyle(Color(.mainText))
                if let trailingTitle = trailingTitle {
                    Text(trailingTitle)
                        .foregroundStyle(Color(.minorTxt))
                }
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 7, trailing: 8))
            Divider().background(Color(.minorTxt))
        }
    }
}

private struct NewFoodTextArea<Content> : View where Content : View {

    private let title: String
    private let content: () -> Content

    init(
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .customFont(.h2)
                .foregroundStyle(Color(.mainText))
                .padding(.bottom, 20)
            content()
        }
        .padding(20)
        .background(Color(.white))
        .clipShape(RoundedCorner(radius: 20))
        .shadow(color: Color(.shadow2), radius: 15, x: 0, y: 15)
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
    }

}

#Preview {
    NavigationStack {
        NewFoodScreen(onClose: {})
    }
}
