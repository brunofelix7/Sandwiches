import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            //CustomNavigationBar(title: sandwich.name)
            Spacer(minLength: 0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                //.frame(height: 100)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Spacer(minLength: 0)
            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(.all)
                .font(Font.headline.smallCaps())
                .background(Color.red)
                .foregroundColor(.white)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationBarHidden(false)
        .navigationBarTitle(Text(sandwich.name), displayMode: .inline)
        //.edgesIgnoringSafeArea(.bottom)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SandwichDetail(sandwich: testData[0])
                .preferredColorScheme(.dark)
            SandwichDetail(sandwich: testData[1])
        }
    }
}
