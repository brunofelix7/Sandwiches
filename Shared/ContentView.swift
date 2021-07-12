import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: SandwichStore
        
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwichItem: sandwich)
                }
                .onMove(perform: moveSandwiches)
                .onDelete(perform: deleteSandwiches)
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar(content: {
                #if os(iOS)
                EditButton()
                #endif
            })
            .navigationBarItems(leading: Button(action: makeSandwich) {
                Text("Add")
            })
            .listStyle(PlainListStyle())
            Text("Select a sandwich").font(.largeTitle)
            //.foregroundColor(Color.red)
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt",
                ingredientCount: 3 ))
        }
    }
    
    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore).preferredColorScheme(.dark)
    }
}
