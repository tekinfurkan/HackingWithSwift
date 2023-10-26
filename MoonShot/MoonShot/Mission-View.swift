//
//  Mission-View.swift
//  MoonShot
//
//  Created by Furkan on 21.10.2023.
//

import SwiftUI

struct Mission_View: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(crew, id: \.role) { CrewMember in
                                NavigationLink {
                                    Astronaut_View(astronaut: CrewMember.astronaut)
                                } label: {
                                    Image(CrewMember.astronaut.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 104,height: 72)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                    VStack(alignment: .leading) {
                                        Text(CrewMember.astronaut.name)
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Text(CrewMember.role)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            else {
                fatalError("Cant find the \(member.name)")
            }
        }
    }
}
