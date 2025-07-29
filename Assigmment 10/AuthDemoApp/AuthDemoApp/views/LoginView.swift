import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isLogin = true

    var body: some View {
        VStack(spacing: 20) {
            Text(isLogin ? "Login" : "Sign Up")
                .font(.largeTitle).bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button(isLogin ? "Login" : "Sign Up") {
                if isLogin {
                    authVM.login(email: email, password: password)
                } else {
                    authVM.signUp(email: email, password: password)
                }
            }
            .buttonStyle(.borderedProminent)

            Button(isLogin ? "Need an account? Sign Up" : "Already have an account? Login") {
                isLogin.toggle()
            }
            .font(.footnote)
        }
        .padding()
    }
}
