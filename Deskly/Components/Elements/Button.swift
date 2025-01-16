import SwiftUI

struct CustomButton: View {
    enum ButtonStyleType {
         case primary, line, danger, disabled, plain
     }
     
     var style: ButtonStyleType
     var title: String
     var icon: String? = nil // アイコン（SF Symbolsなど）
     var action: () -> Void
     
     var body: some View {
         Button(action: {
             action()
         }) {
             HStack {
                 if let icon = icon {
                     Image(systemName: icon)
                         .font(.headline)
                 }
                 Text(title)
             }
             .frame(maxWidth: .infinity)
             .padding()
             .background(backgroundColor)
             .foregroundColor(foregroundColor)
             .cornerRadius(12)
             .overlay(
                 RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: style == .line || style == .danger ? 2 : 0)
             )
             .shadow(color: shadowColor, radius: 5, x: 0, y: 3)
         }
         .disabled(style == .disabled)
     }
     
     // 背景色の設定
     private var backgroundColor: Color {
         switch style {
         case .primary:
             return Colors.primary
         case .line:
             return Colors.white
         case .danger:
             return Colors.red
         case .disabled:
             return Colors.black30a
         case .plain:
             return Color.clear
         }
     }
     
     // テキスト＆アイコンの色
     private var foregroundColor: Color {
         switch style {
         case .primary, .danger:
             return Colors.white
         case .line:
             return Colors.primary
         case .disabled:
             return Colors.white
         case .plain:
             return Colors.primary
         }
     }
     
     // 境界線の色
     private var borderColor: Color {
         switch style {
         case .line:
             return Colors.primary
         case .danger:
             return Colors.white
         default:
             return Color.clear
         }
     }
     
     // 影の色
     private var shadowColor: Color {
         style == .disabled ? Color.clear : Colors.black10a
     }
}


// Preview
struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
              // Primaryボタン
              CustomButton(style: .primary, title: "送信", icon: "headphones") {
                  print("Primaryボタンがタップされました")
              }
              
              // Secondaryボタン
              CustomButton(style: .line, title: "送信", icon: "headphones") {
                  print("Lineボタンがタップされました")
              }
              
              // Dangerボタン
              CustomButton(style: .danger, title: "送信", icon: "headphones") {
                  print("Dangerボタンがタップされました")
              }
              
              // Disabledボタン
              CustomButton(style: .disabled, title: "送信", icon: "headphones") {
                  print("Disabledボタンがタップされました")
              }
              
              // Plainボタン
              CustomButton(style: .plain, title: "送信", icon: "headphones") {
                  print("Plainボタンがタップされました")
              }
          }
        .padding()
            
    }
}
