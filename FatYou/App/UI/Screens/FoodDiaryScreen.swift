import SwiftUI

struct FoodDiaryScreen: View {
    var body: some View {
        ScrollView  {
            VStack(spacing: 0) {
                CaloryInfo()
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
                LazyVStack(spacing: 0) {
                    CaloryRow()
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
                    Text("Today").customFont(.h2)
                    Text("Monday, march 2").customFont(.screenSubtitle)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("open calendar")
                } label: {
                    Image(.calendar).foregroundColor(Color(.mainText))
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
    }

}

private struct CaloryInfo: View {

    @State
    private var isCollapsed = false

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

                } label: {
                    Text("Add Food")
                        .customFont(.smallButtonTxt)
                        .lineLimit(1)
                        .foregroundColor(Color(.white))
                        .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
                        .background(Color(.accent))
                        .clipShape(RoundedCorner(radius: 10))
                }.layoutPriority(1)
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
