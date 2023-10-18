import SwiftUI

struct FoodSearchScreen: View {
    @State
    private var searchText = ""
    let onClose: () -> Void


    var body: some View {
        NavigationStack {
            ZStack {
                SearchResultList()
                SaveButtonView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
                ToolbarItem(placement: .principal) {
                    SearchFieldView(searchText: $searchText)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Image(.barcode).foregroundColor(Color(.mainText))
                    }
                    .padding(.bottom, 12)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.shadowColor = .clear
                appearance.backgroundColor = UIColor(resource: .white)
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
            }
        }
    }
}

private struct SearchFieldView: View {
    @State
    private var isSearchTextFocused = false
    @Binding var searchText: String

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                TextField("", text: $searchText, onEditingChanged: { isEditing in
                    isSearchTextFocused = isEditing
                })
                    .customFont(.inputText)
                    .frame(idealWidth: 10000)
                    .padding(.leading, 12)
                Button {
                    searchText = ""
                } label: {
                    Image(.clearButton)
                }
                .fixedSize()
                .frame(width: searchText.isEmpty ? 0 : 40)
                .clipped()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 2))
            }
            Divider()
                .background(isSearchTextFocused ? Color(.link) : Color(.grayBg))
        }.padding(EdgeInsets(top: 0, leading: -5, bottom: 9, trailing: 4))
    }
}

private struct SaveButtonView: View {
    var body: some View {
        Button {

        } label: {
            Text("SAVE")
                .customFont(.buttonText)
                .foregroundStyle(Color(.white))
                .padding([.top, .bottom], 15.0)
                .frame(maxWidth: .infinity)
                .background(Color(.accent))
                .clipShape(RoundedCorner(radius: 10))
        }
        .padding([.leading, .trailing], 16.0)
    }
}

private struct SearchResultList: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                SearchResultHeader(title: "RECENT")
                ForEach(0...100, id: \.self) { _ in
                    let data = SearchResultRowData(
                        title: "Fried eggs with ham",
                        caloryTitle: "100 g",
                        caloryAmount: "235 kcal"
                    )
                    SearchResultRow(data: data)
                }
            }
        }
    }
}

private struct SearchResultHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .customFont(.screenSubtitle)
            .foregroundStyle(Color(.mainText))
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 8, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.lightGrayBg))
    }
}

private struct SearchResultRowData {
    let title: String
    let caloryTitle: String
    let caloryAmount: String

}

private struct SearchResultRow: View {

    let data: SearchResultRowData

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(data.title)
                        .customFont(.bodyAccsent)
                        .lineLimit(5)
                        .padding(.bottom, 9)
                    HStack(spacing: 0) {
                        Text(data.caloryTitle)
                            .frame(minWidth: 40)
                            .padding(.trailing, 8)
                        Image(.downSmall)
                            .padding(.trailing, 24)
                        Text(data.caloryAmount).layoutPriority(1)
                    }
                    .customFont(.bodyTextSmall)
                    .lineLimit(1)
                }
                .foregroundStyle(Color(.mainText))
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                Spacer()
                Image(.unchecked)
                    .padding([.leading, .trailing], 16)
                    .layoutPriority(1)
            }.background(Color(.white))
            Divider().background(Color(.lightBg))
        }
    }

}


#Preview {
    FoodSearchScreen(onClose: {})
}
