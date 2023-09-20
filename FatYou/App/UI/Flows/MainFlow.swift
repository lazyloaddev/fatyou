import SwiftUI

enum MainFlowTab {
    case foodDiary
    case statisticts
}

struct MainFlow: View {
    @State var currentTab: MainFlowTab = .foodDiary

    private let buttons = [
        TabBarButtonConfiguration(
            icon: .diary,
            title: "FOOD DIARY",
            tab: .foodDiary
        ),
        TabBarButtonConfiguration(
            icon: .statistics,
            title: "STATISTICS",
            tab: .statisticts
        ),
    ]

    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection: $currentTab) {
                FoodDiaryFlow()
                    .tag(MainFlowTab.foodDiary)
                StatistictsFlow()
                    .tag(MainFlowTab.statisticts)
            }.background(Color(.lightBg))
            TabBar(currentTab: $currentTab, buttons: buttons)
        }
    }

}

private struct TabBar: View {
    @Binding var currentTab: MainFlowTab
    let buttons: [TabBarButtonConfiguration]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(buttons.enumerated()), id: \.element.id) { (index, button) in
                let style: TabBarButtonStyle = button.tab == currentTab ? .active : .unactive
                TabBarButton(
                    configuration: button,
                    style: style,
                    roundedCorners: cornerForButton(atIndex: index),
                    action: { currentTab = button.tab }
                )
            }
        }
    }


    private func cornerForButton(atIndex index: Int) -> UIRectCorner {
        let currentIndex = buttons.firstIndex { $0.id == currentTab }
        guard let currentIndex else { return [] }

        if index - 1 == currentIndex {
            return .topLeft
        } else if index + 1 == currentIndex {
            return .topRight
        } else if index == currentIndex {
            return [.topLeft, .topRight]
        } else {
            return []
        }
    }
}

private struct TabBarButtonConfiguration: Identifiable {
    var id: MainFlowTab { tab }

    let icon: CustomIcons
    let title: String
    let tab: MainFlowTab
}

private struct TabBarButtonStyle {

    let backgroundColor: CustomColors
    let foregroundColor: CustomColors

    static let active = TabBarButtonStyle(backgroundColor: .white, foregroundColor: .mainText)
    static let unactive = TabBarButtonStyle(backgroundColor: .warning, foregroundColor: .white)

}

private struct TabBarButton: View {
    let configuration: TabBarButtonConfiguration
    let style: TabBarButtonStyle
    let roundedCorners: UIRectCorner
    let action: () -> Void

    var body: some View {
        let height = 56.0
        Button {
            action()
        } label: {
            VStack(spacing: 0) {
                Image(configuration.icon)
                    .padding(.bottom, 2)
                Text(configuration.title)
                    .customFont(.bottomBarText)
                    .lineLimit(1)
            }
            .foregroundColor(Color(style.foregroundColor))
            .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
            .background(Color(style.backgroundColor))
            .clipShape(RoundedCorner(radius: 10, corners: roundedCorners))
        }
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
