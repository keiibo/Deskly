import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    private let pages = [
        "Desklyへようこそ",
        "仲間をフォローしよう",
        "あなたのデスクをシェアしよう",
        "気になるアイテムがすぐに分かります",
        "Desklyで仲間と繋がろう"
    ]
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<pages.count, id: \.self) { index in
                VStack {
                    Spacer()
                    Image("onboarding_\(index)") // Resources/Assets.xcassetsに画像を追加
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    Text(pages[index])
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Button(action: {
                        if currentPage < pages.count - 1 {
                            currentPage += 1
                        }
                    }) {
                        Text(currentPage == pages.count - 1 ? "サインアップ" : "次へ")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 16)
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

// Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
