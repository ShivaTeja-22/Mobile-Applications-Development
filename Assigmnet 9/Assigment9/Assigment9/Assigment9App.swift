import SwiftUI

@main
struct Assigment9App: App {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

