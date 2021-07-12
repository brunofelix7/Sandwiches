import Foundation

// ViewModel
class SandwichStore : ObservableObject {
    
    @Published var sandwiches: [Sandwich]
    
    init (sandwiches: [Sandwich] = testData) {
        self.sandwiches = sandwiches
    }
}
let testStore = SandwichStore(sandwiches: testData)
