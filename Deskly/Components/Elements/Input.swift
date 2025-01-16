import SwiftUI

struct Input: View {
    enum InputType {
        case text
        case password
    }
    
    var type: InputType
    var placeholder: String
    var icon: String? = nil // アイコン（SF Symbolsなど）
    @Binding var text: String // 入力データ
    var errorMessage: String? = nil // エラーメッセージ
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .leading) {
                 if text.isEmpty {
                     HStack {
                         if let icon = icon {
                             Image(systemName: icon)
                                 .foregroundColor(Colors.white)
                         }
                         Text(placeholder)
                             .foregroundColor(Colors.darkWhite)
                     }
                 }
                 HStack {
                     if let icon = icon {
                         Image(systemName: icon)
                             .foregroundColor(Colors.white)
                     }
                     if type == .password {
                         SecureField("", text: $text)
                             .foregroundColor(Colors.black)
                             .autocapitalization(.none)
                     } else {
                         TextField("", text: $text)
                             .foregroundColor(Colors.black)
                             .autocapitalization(.none)
                     }
                 }
            }
            // 高さ32
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 32)
                    .stroke(errorMessage == nil ? Colors.primary : Colors.red, lineWidth: errorMessage == nil ? 0 : 1)
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Colors.primary30a)
                    )
            )
            .foregroundColor(Colors.black)
            
            if let error = errorMessage, !error.isEmpty {
                Text(error)
                    .font(.footnote)
                    .foregroundColor(Colors.red)
            }
        }
    }
}


// Preview
struct InputComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack  {
            Input(type: .text, placeholder: "メールアドレス", text: .constant(""))
                .padding()
            Input(type: .password, placeholder: "パスワード", text: .constant(""))
                .padding()
            // アイコン
            Input(type: .text, placeholder: "メールアドレス", icon: "envelope", text: .constant(""))
                .padding()
            // エラー
            Input(type: .text, placeholder: "メールアドレス", text: .constant(""), errorMessage: "メールアドレスを入力してください")
                .padding()
        }
     
    }
}
