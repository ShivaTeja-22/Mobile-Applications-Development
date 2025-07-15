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
                HStack {
                    Picker("Select Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.top, .trailing])
                    .frame(width: 200)
                    .padding(.horizontal, 20) // Add some horizontal padding
                }
                .background(Color.clear)
                
                // Full-width content display
                List {
                    if selectedCategory == .cities {
                        ForEach(favorites.cities.filter { $0.isFavorite }) { city in
                            CityCardView(city: city)
                                .listRowInsets(EdgeInsets()) // Removes extra padding
                                .frame(maxWidth: .infinity) // Ensure full width
                        }
                    } else if selectedCategory == .hobbies {
                        ForEach(favorites.hobbies.filter { $0.isFavorite }) { hobby in
                            HobbyRowView(hobby: hobby)
                                .listRowInsets(EdgeInsets()) // Removes extra padding
                                .frame(maxWidth: .infinity) // Ensure full width
                        }
                    } else if selectedCategory == .books {
                        ForEach(favorites.books.filter { $0.isFavorite }) { book in
                            BookRowView(book: book)
                                .listRowInsets(EdgeInsets()) // Removes extra padding
                                .frame(maxWidth: .infinity) // Ensure full width
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline) // Centers the title
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
