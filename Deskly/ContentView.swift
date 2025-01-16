import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Input(type: .text, placeholder: "メールアドレス", text: .constant(""))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
