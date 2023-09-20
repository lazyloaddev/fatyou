import SwiftUI

struct FoodDiaryFlow: View {
    var body: some View {
        NavigationStack {
            FoodDiaryScreen()
        }
    }
}

struct FoodDiaryFlow_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryFlow()
    }
}
