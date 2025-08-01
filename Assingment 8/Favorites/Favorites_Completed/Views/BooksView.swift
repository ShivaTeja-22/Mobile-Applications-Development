//
//  BooksView.swift
//  Favorites_Completed
//
//  Created by Auburn University Student on 7/15/25.
//

import SwiftUI

struct BooksView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                    BookRowView(book: book)
                }
            }
            .padding()
        }
    }
}



#Preview {
    BooksView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
