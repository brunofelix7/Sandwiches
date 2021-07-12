import SwiftUI

@main
struct SandwichesApp: App {
    
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
