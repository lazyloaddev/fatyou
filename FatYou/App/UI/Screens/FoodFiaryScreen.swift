import SwiftUI

/*
struct FoodFiaryScreen: View {

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                NavigationBar()
                CaloriesInfo()
            }
            .frame(maxWidth: .infinity)
            .background(Color(.lightBg))
            RecordsList()
            Spacer()
            TabBar()
        }.ignoresSafeArea(.container, edges: .bottom)
    }

}

private struct NavigationBar: View {

    var body: some View {
        HStack(spacing: 0) {
            Rectangle().fill(.clear).frame(maxWidth: .infinity)
            NavigationBarTitle()
            NavigationBarCalendarButton()
        }
        .frame(height: 56)
    }

}

private struct NavigationBarTitle: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("Today")
                .foregroundColor(Color(.mainText))
                .font(FontBuilder.h2.font)
                .lineSpacing(FontBuilder.h2.lineSpacing)
            Text("Monday, march 2")
                .foregroundColor(Color(.mainText))
                .font(FontBuilder.screenSubtitle.font)
                .lineSpacing(FontBuilder.screenSubtitle.lineSpacing)
                .offset(y: -2)
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

private struct NavigationBarCalendarButton: View {
    var body: some View {
        Image(.calendar)
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

private struct CaloriesInfo: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(spacing: 0) {
                CaloriesInfoAmount()
                Spacer()
                CaloriesInfoAddButton()
            }.padding([.leading, .trailing, .top], 20)
            CaloriesInfoPackmanProgress()
        }
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
        .padding(EdgeInsets(top: 20, leading: 18, bottom: 0, trailing: 16))
    }
}

private struct CaloriesInfoAmount: View {

    var body: some View {
        HStack(spacing: 0) {
            Text("235 cal left")
                .foregroundColor(Color(.mainText))
                .font(FontBuilder.h2.font)
                .lineSpacing(FontBuilder.h2.lineSpacing)
                .padding([.top], FontBuilder.h2.verticalPadding)
                .padding(.trailing, 10)
            Image(.upSmall)
        }
    }

}

private struct CaloriesInfoAddButton: View {
    var body: some View {
        Text("Add Food")
            .foregroundColor(Color(.white))
            .font(FontBuilder.smallButtonTxt.font)
            .lineSpacing(FontBuilder.smallButtonTxt.lineSpacing)
            .padding([.vertical], FontBuilder.smallButtonTxt.verticalPadding)
            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
            .background(Color(.accent))
            .cornerRadius(10)
    }
}


private struct CaloriesInfoPackmanProgress: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("pacman")
            HStack(spacing: 0) {
                Text("1765")
                    .foregroundColor(Color(.mainText))
                    .font(FontBuilder.bodyText.font)
                    .lineSpacing(FontBuilder.bodyText.lineSpacing)
                    .padding([.vertical], FontBuilder.bodyText.verticalPadding)
                    .padding(.leading, 9)
                Spacer()
                Text("2000 cal")
                    .foregroundColor(Color(.mainText))
                    .font(FontBuilder.bodyText.font)
                    .lineSpacing(FontBuilder.bodyText.lineSpacing)
                    .padding([.vertical], FontBuilder.bodyText.verticalPadding)

            }
        }
        .frame(maxWidth: 217)
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20))
    }
}

private struct RecordsList: View {
    var body: some View {
        VStack(spacing: 0) {
            Divider().frame(height: 1).background(Color(.grayBg))
            RecordsListItem(title: "Борщ, 1 порция", amount: "235 cal")
            RecordsListItem(title: "Яблоко, 1 штука", amount: "50 cal")
            RecordsListItem(title: "Пицца, 100 грамм", amount: "150 cal")
            RecordsListItem(title: "Манная каша, 1 порция", amount: "75 cal")
            RecordsListItem(title: "Чипсы, 100 грамм", amount: "300 cal")
        }
        .frame(maxWidth: .infinity)
        .background(Color(.white))
    }
}

private struct RecordsListItem: View {

    let title: String
    let amount: String

    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .foregroundColor(Color(.mainText))
                .font(FontBuilder.bodyText.font)
                .lineSpacing(FontBuilder.bodyText.lineSpacing)
                .lineLimit(1)
                .padding([.vertical], FontBuilder.bodyText.verticalPadding)
            Spacer()
            Text(amount)
                .foregroundColor(Color(.mainText))
                .font(FontBuilder.bodyText.font)
                .lineSpacing(FontBuilder.bodyText.lineSpacing)
                .padding([.vertical], FontBuilder.bodyText.verticalPadding)
                .lineLimit(1)
                .padding(.trailing, 4)
                .layoutPriority(1)
            Image(.more).foregroundColor(Color(.grayBg))
        }
        .frame(height: 60)
        .padding(.leading, 20)
        Divider().frame(height: 1).background(Color(.grayBg))
    }
}

private struct TabBar: View {
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
            TabBarButton(
                icon: .profile,
                title: "PROFILE",
                backgroundColor: .warning,
                foregroundColor: .white,
                roundedCorners: []
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
        VStack(spacing: 0) {
            Image(icon)
            Text(title)
                .font(FontBuilder.bottomBarText.font)
                .lineSpacing(FontBuilder.bottomBarText.lineSpacing)
                .lineLimit(1)
                .padding([.vertical], FontBuilder.bottomBarText.verticalPadding)
        }
        .foregroundColor(Color(foregroundColor))
        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56)
        .background(Color(backgroundColor))
        .clipShape(RoundedCorner(radius: 10, corners: roundedCorners))
    }
}


*/
