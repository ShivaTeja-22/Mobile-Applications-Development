//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Auburn University Student on 7/15/25.
//

import SwiftUI

struct BookRowView: View {
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.bookTitle)
                    .font(.body)
                    .fontWeight(.bold)
                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "1984", bookAuthor: "George Orwell"))
}
