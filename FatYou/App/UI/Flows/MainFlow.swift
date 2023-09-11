import SwiftUI

enum MainFlowTab: Int {
    case foodDiary
    case statisticts
}

struct MainFlow: View {

    @State var currentTab: MainFlowTab = .foodDiary

    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection: $currentTab) {
                Text("1")
                    .id(MainFlowTab.foodDiary)
                Text("2")
                    .id(MainFlowTab.statisticts)
            }
            TabBar(currentTab: $currentTab)
        }
    }
}

private struct TabBar: View {
    @Binding var currentTab: MainFlowTab

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(
                icon: .diary,
                title: "FOOD DIARY",
                backgroundColor: .white,
                foregroundColor: .mainText,
                roundedCorners: []
            )
            TabBarButton(
                icon: .statistics,
                title: "STATISTICS",
                backgroundColor: .warning,
                foregroundColor: .white,
                roundedCorners: [.topLeft]
            )
        }
    }
}

private struct TabBarButton: View {
    let icon: CustomIcons
    let title: String
    let backgroundColor: CustomColors
    let foregroundColor: CustomColors
    let roundedCorners: UIRectCorner

    var body: some View {
        let height = 56.0
        VStack(spacing: 0) {
            Image(icon)
                .padding(.bottom, 2)
            Text(title)
                .customFont(.bottomBarText)
                .lineLimit(1)
        }
        .foregroundColor(Color(foregroundColor))
        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
        .background(Color(backgroundColor))
        .clipShape(RoundedCorner(radius: 10, corners: roundedCorners))
        .background {
            Color(.warning)
                .padding(.top, height)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}



struct MainFlow_Previews: PreviewProvider {
    static var previews: some View {
        MainFlow()
    }
}
