import SwiftUI

struct FoodDiaryScreen: View {

    var body: some View {
        ScrollView  {
            VStack(spacing: 0) {
                CaloryInfo()
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
                LazyVStack(spacing: 0) {
                    Text("qwe")
                    Text("qwe")
                    Text("qwe")
                    Text("qwe")
                }.background(Color(.white))
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
                    Image(CustomIcons.calendar).foregroundColor(Color(.mainText))
                }

            }
        }.navigationBarTitleDisplayMode(.inline)
    }

}

private struct CaloryInfo: View {

    var body: some View {
        HStack(spacing: 0) {
            Button  {

            } label: {
                Text("123")
            }
            Spacer()
            Button  {

            } label: {
                Text("123")
            }
        }
        .padding(EdgeInsets(top: 20, leading: 17, bottom: 23, trailing: 17))
        .background(Color(.white))
        .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
    }

}

struct FoodDiaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FoodDiaryScreen()
        }
    }
}
