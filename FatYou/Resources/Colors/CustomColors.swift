import SwiftUI

enum CustomColors: String {
    case accent
    case activeBG
    case gray
    case grayBg
    case lightBg
    case lightBlue
    case lightGrayBg
    case link
    case mainText
    case minorTxt
    case warning
    case white
    case calculatorNumber
}


extension Color {
    
    init(_ name: CustomColors) {
        self.init(name.rawValue)
    }
    
}
