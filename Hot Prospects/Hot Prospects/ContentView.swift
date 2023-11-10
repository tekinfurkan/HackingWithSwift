//
//  ContentView.swift
//  Hot Prospects
//
//  Created by Furkan on 6.11.2023.
//

import SwiftUI
import SamplePackage

struct ContentView: View {
    @StateObject var prospects = Prospects()
    
    var body: some View {
        TabView {
            ProspectView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            ProspectView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            ProspectView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        .environmentObject(prospects)
    }
}

#Preview {
    ContentView()
        .environmentObject(Prospects())
}
