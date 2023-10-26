//
//  Astronaut_View.swift
//  MoonShot
//
//  Created by Furkan on 23.10.2023.
//

import SwiftUI

struct Astronaut_View: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
