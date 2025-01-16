import SwiftUI

struct Tag: View {
    var text: String // タグのテキスト
    
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(.vertical, 4) // 上下のパディング
            .padding(.horizontal, 8) // 左右のパディング
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Colors.black30a)
            )
            .foregroundColor(Colors.darkWhite)
            .shadow(color: Colors.shadow, radius: 4, x: 2, y: 2) // 影のスタイル
    }
}

// Preview
struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Tag(text: "#デスクワーク")
            
            // カスタムカラーのタグ
            Tag(text: "#SwiftUI")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
