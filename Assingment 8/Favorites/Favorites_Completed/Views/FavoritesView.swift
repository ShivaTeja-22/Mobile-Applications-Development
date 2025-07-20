import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    @State private var selectedCategory: Category = .cities
    
    enum Category: String, CaseIterable, Identifiable {
        case cities = "Cities"
        case hobbies = "Hobbies"
        case books = "Books"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Full-width Picker for category selection
                Picker("Select Category", selection: $selectedCategory) {
                    ForEach(Category.allCases) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(maxWidth: .infinity)  // Make Picker full width
                .padding([.top, .horizontal]) // Add padding to the Picker
                
                // Content display for cities, hobbies, books
                List {
                    if selectedCategory == .cities {
                        ForEach(favorites.cities.filter { $0.isFavorite }) { city in
                            CityCardView(city: city)
                                .frame(maxWidth: .infinity) // Ensure CityCardView fills width
                                .padding([.horizontal], 0) // Remove any extra padding
                                .listRowInsets(EdgeInsets()) // Remove default row padding
                        }
                    } else if selectedCategory == .hobbies {
                        ForEach(favorites.hobbies.filter { $0.isFavorite }) { hobby in
                            HobbyRowView(hobby: hobby)
                                .frame(maxWidth: .infinity) // Ensure HobbyRowView fills width
                                .padding([.horizontal], 0) // Remove any extra padding
                                .listRowInsets(EdgeInsets()) // Remove default row padding
                        }
                    } else if selectedCategory == .books {
                        ForEach(favorites.books.filter { $0.isFavorite }) { book in
                            BookRowView(book: book)
                                .frame(maxWidth: .infinity) // Ensure BookRowView fills width
                                .padding([.horizontal], 0) // Remove any extra padding
                                .listRowInsets(EdgeInsets()) // Remove default row padding
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle()) // Use this style for a grouped list
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline) // Keep title centered
                .padding(.horizontal, 0) // Remove horizontal padding for the list
            }
            .background(Color(.systemGroupedBackground)) // Light background color
            .padding(.horizontal, 0) // Remove horizontal padding from the outer VStack
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
