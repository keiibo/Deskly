import SwiftUI

struct LabeledInput: View {
    enum LayoutStyle {
        case vertical
        case horizontal
    }
    
    var label: String
    var type: Input.InputType
    var placeholder: String
    var icon: String? = nil
    @Binding var text: String
    var errorMessage: String? = nil
    var layout: LayoutStyle = .vertical // デフォルトは縦並び
    var showColon: Bool = false // デフォルトは「:」を表示しない
    
    var body: some View {
        Group {
            if layout == .vertical {
                verticalLayout
            } else {
                horizontalLayout
            }
        }
    }
    
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label + (showColon ? ":" : ""))
                .font(.headline)
                .foregroundColor(Colors.primary)
            
            Input(
                type: type,
                placeholder: placeholder,
                icon: icon,
                text: $text,
                errorMessage: errorMessage
            )
        }
    }
    
    private var horizontalLayout: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(label + (showColon ? ":" : ""))
                .font(.headline)
                .foregroundColor(Colors.primary)
                .frame(minWidth: 100, alignment: .leading) // ラベルの幅を揃えるため調整可能
            
            Input(
                type: type,
                placeholder: placeholder,
                icon: icon,
                text: $text,
                errorMessage: errorMessage
            )
        }
    }
}

// Preview
struct LabeledInput_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // 縦並びの例
            LabeledInput(
                label: "メールアドレス",
                type: .text,
                placeholder: "メールアドレスを入力してください",
                text: .constant("")
            )
            
            // 横並びの例
            LabeledInput(
                label: "パスワード",
                type: .password,
                placeholder: "パスワードを入力してください",
                text: .constant(""),
                layout: .horizontal,
                showColon: true
            )
            
            // 横並びかつエラーあり
            LabeledInput(
                label: "メールアドレス",
                type: .text,
                placeholder: "メールアドレスを入力してください",
                text: .constant(""),
                errorMessage: "メールアドレスを入力してください",
                layout: .horizontal,
                showColon: true
            )
        }
        .padding()
        .background(Colors.darkWhite)
    }
}
