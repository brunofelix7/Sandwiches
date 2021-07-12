import SwiftUI

struct SandwichCell: View {
    var sandwichItem: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwichItem)) {
            Image(sandwichItem.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 0, content: {
                Text(sandwichItem.name)
                Text("\(sandwichItem.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            })
        }
    }
}

struct SandwichCell_Previews: PreviewProvider {    
    static var previews: some View {
        SandwichCell(sandwichItem: testData[0])
    }
}
