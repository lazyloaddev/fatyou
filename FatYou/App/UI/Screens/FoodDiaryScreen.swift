import SwiftUI
import SwipeActions

struct FoodDiaryScreen: View {
    @State
    private var currentDate = Date.now
    @State
    private var isSearchFoodPresented = false
    private let dateFormatter: DateFormatter

    init() {
        self.dateFormatter = DateFormatter()
        // https://nsdateformatter.com/
        dateFormatter.dateFormat = "EEEE, MMMM d"
    }

    var body: some View {
        ScrollView  {
            VStack(spacing: 0) {
                CaloryInfo(onAddFoodRecord: { isSearchFoodPresented = true })
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
                LazyVStack(spacing: 0) {
                    CaloryRow()
                        .addSwipeAction(edge: .trailing) {
                            Button(
                                action: {},
                                label: {
                                    Image(.edit)
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .background(Color(.warning))
                                        .foregroundColor(Color(.white))
                                }
                            )

                            Button(
                                action: {},
                                label: {
                                    Image(.trash)
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .foregroundColor(Color(.white))
                                        .background(Color(.accent))
                                }
                            )

                        }
                    CaloryRow()
                    CaloryRow()
                    CaloryRow()
                }
                .background(
                    Color(.white)
                        .shadow(color: Color(.shadow), radius: 12, y: 12)
                )
                GeometryReader { proxy in
                    Color.white.frame(height: proxy.bounds(of: .scrollView)?.height ?? 0)
                }
            }
        }
        .background(Color(.lightBg))
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(spacing: -2) {
                    Text(currentDayLabel()).customFont(.h2)
                    Text(currentDate, formatter: dateFormatter).customFont(.screenSubtitle)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(.calendar)
                    .foregroundColor(Color(.mainText))
                    .overlay {
                        DatePicker(
                            "",
                            selection: $currentDate,
                            displayedComponents: [.date]
                        ).blendMode(.destinationOver)
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.shadowColor = .clear
            appearance.backgroundColor = UIColor(resource: .lightBg)
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        }
        .fullScreenCover(isPresented: $isSearchFoodPresented) {
            FoodSearchScreen(onClose: { isSearchFoodPresented = false })
        }
    }

    private func currentDayLabel() -> String {
        if Calendar.current.isDateInToday(currentDate) {
            "Today"
        } else if Calendar.current.isDateInTomorrow(currentDate) {
            "Tomorrow"
        } else if Calendar.current.isDateInYesterday(currentDate) {
            "Yesterday"
        } else {
            "Past"
        }
    }

}

private struct CaloryInfo: View {

    @State
    private var isCollapsed = false
    let onAddFoodRecord: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                } label: {
                    HStack(alignment: .bottom, spacing: 11) {
                        Text("235 cal left")
                            .customFont(.h2)
                            .lineLimit(1)
                        Image(.upSmall)
                            .rotationEffect(isCollapsed ? .zero : .degrees(180))
                    }.foregroundColor(Color(.mainText))
                }.frame(minWidth: 100)

                Spacer()

                Button  {
                    onAddFoodRecord()
                } label: {
                    Text("Add Food")
                }
                .layoutPriority(1)
                .buttonStyle(AccentSmallButton())
            }
            // jdhsjfkd

            PacmanProgress(percent: 0.5)
                .padding(.top, 16)
                .frame(maxHeight: isCollapsed ? 0 : .infinity)
                .opacity(isCollapsed ? 0.0 : 1.0)
                .clipped()
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 23, trailing: 17))
        .background(Color(.white))
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
    }

}

private struct PacmanProgress: View {

    let percent: Double

    var body: some View {
        let headSize = 60.0
        let dotSize = 14.0
        let dotSpace = 5.0

        GeometryReader { proxy in
            let minSize = headSize / 2
            let actualSize = (proxy.size.width - minSize) * percent
            let dotCount = Int(actualSize / (dotSize + dotSpace))
            ZStack(alignment: .leading) {
                HStack(spacing: dotSpace) {
                    ForEach(0...dotCount, id: \.self) { _ in
                        Circle()
                            .fill(Color(.lightBlue))
                            .frame(width: dotSize, height: dotSize)
                    }
                }.padding(.leading, headSize / 2)
                Image(.packmanHead)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(height: headSize)
    }
}

private struct CaloryRow: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Fried eggs with ham, 2 eggs")
                Spacer()
                Text("235 cal").padding(.trailing, 4)
                Image(.more).foregroundStyle(Color(.grayBg))
            }
            .customFont(.bodyText)
            .foregroundStyle(Color(.mainText))
            .padding(.leading, 20)
            .frame(height: 59)
            Divider().background(Color(.grayBg))
        }
    }
}

struct FoodDiaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FoodDiaryScreen()
        }
    }
}
