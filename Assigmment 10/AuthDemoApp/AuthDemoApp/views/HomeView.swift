import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(authVM.user?.email ?? "User")!")
                .font(.title)

            Button("Logout") {
                authVM.signOut()
            }
            .buttonStyle(.bordered)
        }
    }
}
#Preview {
    HomeView()
}
