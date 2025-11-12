import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var userName: String = "Ernesto" // Replace with dynamic auth data

    // Animation states
    @State private var animateGreeting = false
    @State private var animatePlaceholder = false

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)) // #F5F8FA
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                // Greeting
                VStack(spacing: 8) {
                    Text("Hi, \(userName)!")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.11, green: 0.23, blue: 0.36, alpha: 1))) // #1B3B5F
                        .opacity(animateGreeting ? 1 : 0)
                        .offset(y: animateGreeting ? 0 : 20)
                        .animation(.easeOut(duration: 0.6), value: animateGreeting)

                    Text("Welcome to PlayConnect.\nLet’s get started.")
                        .font(.system(size: 18))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1))) // #6B7A8F
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                        .opacity(animateGreeting ? 1 : 0)
                        .offset(y: animateGreeting ? 0 : 20)
                        .animation(.easeOut(duration: 0.6).delay(0.1), value: animateGreeting)
                }

                Spacer()

                // Placeholder box + logout
                VStack(spacing: 16) {
                    Text("Your main app content will appear here")
                        .font(.system(size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.48, blue: 0.56, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0.78, green: 0.83, blue: 0.88, alpha: 1)), lineWidth: 1))
                        .padding(.horizontal, 30)
                        .opacity(animatePlaceholder ? 1 : 0)
                        .offset(y: animatePlaceholder ? 0 : 20)
                        .animation(.easeOut(duration: 0.6).delay(0.3), value: animatePlaceholder)

                    Button(action: {
                        // logout action
                        // Action that most be take before loggin out.
                        
                        appState.userLoggedIn = false
                        appState.path.removeLast(appState.path.count) //Reset to Welcome view
                    }) {
                        Text("Log Out")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.31, green: 0.64, blue: 0.82, alpha: 1))) // #4FA3D1
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 30)
                    .opacity(animatePlaceholder ? 1 : 0)
                    .offset(y: animatePlaceholder ? 0 : 20)
                    .animation(.easeOut(duration: 0.6).delay(0.4), value: animatePlaceholder)
                }

                Spacer()
            }
            .padding(.top, 60)
            .onAppear {
                animateGreeting = true
                animatePlaceholder = true
            }
        }
    }
}

#Preview {
    HomeView()
    .environmentObject(AppState())
}

