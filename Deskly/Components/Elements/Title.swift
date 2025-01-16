import SwiftUI

struct Title: View {
    var text: String
    var allowMultipleLines: Bool = false // 複数行を許可するかどうか
    
    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .bold)) // 16pxでboldフォント
            .lineLimit(allowMultipleLines ? nil : 1) // 行数制限
            .truncationMode(.tail) // テキストが切れる場合に末尾を省略
            .foregroundColor(Colors.black) // テキスト色（例: 黒）
            .multilineTextAlignment(.leading) // 左寄せ
            .frame(maxWidth: .infinity, alignment: .leading) // 左寄せで最大幅
    }
}

// Preview
struct Title_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // 一行のタイトル
            Title(text: "これは一行のタイトルです")
            
            // 複数行を許可しないタイトル（切り捨てあり）
            Title(text: "これは非常に長いタイトルであり、切り捨てられる必要があります。", allowMultipleLines: false)
            
            // 複数行を許可するタイトル
            Title(text: "これは非常に長いタイトルであり、複数行で表示される必要があります。複数行を許可します。", allowMultipleLines: true)
        }
        .padding()
        .background(Colors.darkWhite) // 背景色を適用
        .previewLayout(.sizeThatFits)
    }
}
