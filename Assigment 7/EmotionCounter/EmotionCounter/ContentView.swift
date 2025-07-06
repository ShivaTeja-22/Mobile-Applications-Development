import SwiftUI

struct ContentView: View {
    // The array of emojis to display
    let emojis = ["😀", "😁", "😎", "😊"]
    
    // State variable to store the counter for each emoji
    @State private var counters: [Int] = Array(repeating: 0, count: 4) // Initialize the counters for each emoji

    var body: some View {
        VStack {
            // Title
            Text("Emoji Counter")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // List to show emojis and counters
            List {
                ForEach(0..<emojis.count, id: \.self) { index in
                    HStack {
                        // Emoji icon
                        Text(emojis[index])
                            .font(.largeTitle)
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        
                        // Display the counter
                        Text("Counter: \(counters[index])")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                        
                        // Increment and decrement buttons
                        HStack {
                            // Increment Button using onTapGesture
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                                .onTapGesture {
                                    counters[index] += 1 // Increment the counter when tapped
                                }

                            // Decrement Button using onTapGesture
                            Image(systemName: "minus.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(25)
                                .shadow(radius: 5)
                                .onTapGesture {
                                    counters[index] -= 1 // Decrement the counter when tapped
                                }
                        }
                        .padding(.horizontal, 5)
                    }
                    .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                    .padding(.horizontal)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top)
        }
        .background(Color(white: 0.95)) // Background color for the app
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
