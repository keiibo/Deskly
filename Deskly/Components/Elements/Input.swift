import SwiftUI

struct Input: View {
    enum InputType {
        case text
        case password
        case textarea
    }
    
    var type: InputType
    var placeholder: String
    var icon: String? = nil // アイコン（SF Symbolsなど）
    @Binding var text: String // 入力データ
    var errorMessage: String? = nil // エラーメッセージ
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .leading) {
                // プレースホルダー
                if text.isEmpty && type != .textarea {
                    HStack {
                        if let icon = icon {
                            Image(systemName: icon)
                                .foregroundColor(Colors.white)
                        }
                        Text(placeholder)
                            .foregroundColor(Colors.darkWhite)
                    }
                }
                
                // 入力フィールド
                if type == .textarea {
                    TextField("", text: $text)
                        .foregroundColor(Colors.black)
                        .autocapitalization(.none)
                        .frame(minHeight: 100)
                } else {
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
            }
            // テキスト入力時のデザイン
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(errorMessage == nil ? Colors.primary : Colors.red, lineWidth: errorMessage == nil ? 0 : 1)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Colors.primary30a)
                    )
            )
            .foregroundColor(Colors.black)
            
            // エラーメッセージ
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
        VStack(spacing: 20) {
            // シンプルなテキスト入力
            Input(type: .text, placeholder: "メールアドレス", text: .constant(""))
            
            // パスワード入力
            Input(type: .password, placeholder: "パスワード", text: .constant(""))
            
            // テキストエリア（複数行）
            Input(type: .textarea, placeholder: "詳細を入力してください", text: .constant("複数行の入力テキスト"))
            
            // エラーメッセージ付き
            Input(type: .text, placeholder: "メールアドレス", text: .constant(""), errorMessage: "メールアドレスを入力してください")
        }
        .padding()
        .background(Colors.white)
        .previewLayout(.sizeThatFits)
    }
}
