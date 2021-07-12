import SwiftUI

struct CustomNavigationBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.white)
            })
            Spacer()
            Text(title)
                .bold()
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding()
        .background(Color.red.ignoresSafeArea())
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(title: "My toolbar")
    }
}
