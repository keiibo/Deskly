import SwiftUI

struct OTPInputView: View {
    @Binding var otp: [String] // 6桁のOTPを格納する配列
    var length: Int = 6 // OTPの長さ
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<length, id: \.self) { index in
                OTPCell(text: $otp[index])
            }
        }
    }
}

struct OTPCell: View {
    @Binding var text: String
    var body: some View {
        TextField("", text: $text)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.system(size: 32, weight: .bold))
            .frame(width: 50, height: 60) // 各セルのサイズ
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Colors.darkWhite)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Colors.primary10a, lineWidth: text.isEmpty ? 1 : 2)
            )
            .shadow(color: Colors.black10a, radius: 4, x: 2, y: 2)
            .onReceive(text.publisher.collect()) { value in
                // 1文字を超えないように制限
                if value.count > 1 {
                    text = String(value.last ?? Character(""))
                }
            }
    }
}

// Preview
struct OTPInputView_Previews: PreviewProvider {
    static var previews: some View {
        OTPInputView(otp: .constant(["", "", "", "", "", ""]))
            .padding()
            .background(Colors.white)
            .previewLayout(.sizeThatFits)
    }
}//
//  OTP.swift
//  Deskly
//
//  Created by Keita Kobayashi on 2025/01/16.
//

