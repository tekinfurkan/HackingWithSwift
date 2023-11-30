//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Furkan on 20.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    @StateObject private var favorites = Favorites()
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        }
        else {
            return resorts.filter { resort in
                resort.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    Image(resort.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )

                    HStack {
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
        }
        .environmentObject(favorites)
    }
}

#Preview {
   ContentView()
}
