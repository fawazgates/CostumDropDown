import SwiftUI

struct ContentView: View {
    private let manufacturers = [
    "Lamborghini",
    "Ferarri",
    "Buggati",
    "Marcedes",
    "BMW"
    ]
    
    private let vehicleTypss = [
    "Coupe",
    "Sedan",
    "SUV"
    ]
    
    @State private var selectedMake: String?
    @State private var selectedTypes: String?
    
    var body: some View {
        VStack(spacing: 16) {
            DropDownView(title: "Make", prompt: "selected", options: manufacturers, selection: $selectedMake)
            DropDownView(title: "Vehicle Types", prompt: "Selected", options: vehicleTypss, selection: $selectedTypes)
        }
    }
}

#Preview {
    ContentView()
}
