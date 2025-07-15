//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                Section(header: Text("Cities")) {
                    ForEach(favorites.cities.filter { $0.isFavorite }) { city in
                        CityCardView(city: city)
                    }
                }
                
                Section(header: Text("Hobbies")) {
                    ForEach(favorites.hobbies.filter { $0.isFavorite }) { hobby in
                        HobbyRowView(hobby: hobby)
                    }
                }
                
                Section(header: Text("Books")) {
                    ForEach(favorites.books.filter { $0.isFavorite }) { book in
                        BookRowView(book: book)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())  
}


