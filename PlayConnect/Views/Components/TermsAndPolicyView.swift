//
//  TermsAndPolicyView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 2/15/26.
//

import SwiftUI

struct TermsAndPolicyView: View {
    @State private var selectedURL: URL?
    @State private var showSafari = false
        
        var body: some View {
            Spacer()
            Divider()
            Text("By continuing, I have read and agree with the [Terms of Use](https://ernestocisnero.vercel.app/) and [Privacy Policy](https://ernestocisnero.vercel.app/)")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundStyle(.appWhiteBackground)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .tint(.blue)
                
                .environment(\.openURL, OpenURLAction { url in
                    self.selectedURL = url
                    self.showSafari = true
                    return .handled
                })
                
                .sheet(isPresented: $showSafari) {
                    if let url = selectedURL {
                            SafariView(url: url)

                    }
                }
        }
}

#Preview {
    TermsAndPolicyView()
}
