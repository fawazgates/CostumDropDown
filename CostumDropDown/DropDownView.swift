import SwiftUI

struct DropDownView: View {
    let title: String
    let prompt: String
    let options: [String]
    
    @State private var isExpanded = false
    
    @Environment(\.colorScheme) var scheme
    
    @Binding var selection: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote).foregroundStyle(.gray).opacity(0.8)
        
        VStack {
            HStack {
                Text(selection ?? prompt)
                
                
                Spacer()
                Image(systemName: "chevron.down").font(.subheadline).foregroundStyle(.gray)
                    .rotationEffect(.degrees(isExpanded ? -100 : 0))
                
                }
            .frame(height: 40).padding(.horizontal)
            .onTapGesture {
                withAnimation(.snappy) { isExpanded.toggle() }
                }
            .background(scheme == .dark ? .black : .white)
            
            if isExpanded {
                VStack {
                    ForEach(options, id: \.self) { option in
                        HStack {
                            Text(option)
                                .foregroundStyle(selection == option ? Color.primary : .gray)
                            Spacer()
                            if selection == option {
                                Image(systemName: "checkmark").font(.subheadline)
                            }
                        }
                        .frame(height: 40)
                        .padding(.horizontal)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selection = option
                                isExpanded.toggle()
                            }
                        }
                    }
                }
                .transition(.move(edge: .bottom))
            }
            }
        .background(scheme == .dark ? .black : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .frame(width: 140)
        }
    }
}

#Preview {
    DropDownView(title: "Make", prompt: "Select", options: [
    "Lambo",
    "Ferrari",
    "Aston Martin"
    ], selection: .constant("Ferrari"))
}
