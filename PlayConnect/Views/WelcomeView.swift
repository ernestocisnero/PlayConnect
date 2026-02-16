//
//  WelcomeView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//


import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var showLogIn: Bool = false
    @State private var showRegister: Bool = false
    
    var body: some View {
        ZStack {
            LoopingPlayerView(videoName: "VideoBackground", videoType: "mov").ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20){
                HStack{
                    Text("CONNECT\nPLAY\nSHINE")
                    Spacer()
                }
                .font(.system(size: 45, weight: .bold, design: .rounded))
                .foregroundStyle(.appWhiteBackground)
                
                Spacer()
                SignButton(type:"google", action: {})

                SignButton(type:"email", action: { showLogIn.toggle() })
              
                HStack{
                    Text("Don't have an account?")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white)
                    Button(action:{
                        showRegister.toggle()
                    }){
                        Text("Sign up")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                    }
                }
               TermsAndPolicyView()
            }
            .padding(.horizontal, 20)
            .safeAreaPadding(.vertical, 30)

        }
        .sheet(isPresented: $showLogIn ){
            LoginView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showRegister ){
            RegisterView()
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    WelcomeView()
        .environmentObject(AppState())
}
