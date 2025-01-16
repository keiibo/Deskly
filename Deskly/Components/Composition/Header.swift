import SwiftUI

struct Header: View {
    var title: String = ""
    
    var showBackButton: Bool = false
    var backAction: (() -> Void)? = nil
    var tag: String? = nil // オプションでタグを表示
    
    var showRightButton: Bool = false // 右側ボタンを表示
    var buttonStyle: CustomButton.ButtonStyleType = .plain // 右側ボタンのスタイル
    var buttonIcon: String? = nil // 右側ボタンのアイコン
    var buttonAction: (() -> Void)? = nil // 右側ボタンのアクション
    var buttonTitle: String = "" // 右側ボタンのテキスト
    
    var logoName: String = "deskly_logo" // ロゴの仮置き
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                // 左側の固定スペース
                if showBackButton, let backAction = backAction {
                    CustomButton(style: .plain, title: "", icon: "arrow.left", action: backAction)
                        .frame(width: .infinity)
                }else {
                    Spacer() // タイトルの左側スペース
                }
                
                // タイトル部分
                if let tag = tag {
                    HStack(spacing: 4) {
                        Tag(text: tag)
                        Text("の付いた投稿一覧")
                            .font(.headline)
                            .foregroundColor(Colors.black)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }.frame(width: .infinity)
                } else if !title.isEmpty {
                    HStack(spacing: 8) {
                        Image(logoName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                        Text(title)
                            .font(.headline)
                            .foregroundColor(Colors.black)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }.frame(width: .infinity)
                } else {
                    Spacer()
                }
                
                if showRightButton, let buttonAction = buttonAction {
                    CustomButton(
                        style: buttonStyle,
                        title: buttonTitle,
                        icon: buttonIcon,
                        action: buttonAction
                    )
                }else {
                    Spacer() // タイトルの右側スペース
                }
                
            }
            .padding()
        }
    }
}

// Preview
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // シンプルなヘッダー
            Header(title: "Deskly")
            
            // 戻るボタン付き
            Header(showBackButton: true, backAction: {
                print("戻るボタンが押されました")
            }, tag: "デスクワーク")
            
            // 右側ボタン付き
            Header(
                title: "Deskly",
                showRightButton: true,
                buttonStyle: .primary,
                buttonIcon: "plus",
                buttonAction: {
                    print("右側ボタンが押されました")
                }, buttonTitle: "追加"
            )
            
            // 戻るボタン、タグ、右側ボタン付き
            Header(
                title: "Deskly", showBackButton: true,
                backAction: {
                    print("戻るボタンが押されました")
                },
                showRightButton: true,
                buttonStyle: .line,
                buttonIcon: "gear",
                buttonAction: {
                    print("右側ボタンが押されました")
                }, buttonTitle: "設定"
            )
        }
        .background(Colors.white)
        .previewLayout(.sizeThatFits)
    }
}
