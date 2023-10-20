import SwiftUI

struct ValueDescriptionStack: View {
    @State var icon: String
    @Binding var boldText: String
    @State var description: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            
            Text(boldText)
                .fontWeight(.bold)
            
            Text(description)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
