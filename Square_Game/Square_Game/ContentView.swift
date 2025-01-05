//
//  ContentView.swift
//  Square_Game
//
//  Created by Nimeshika Mandakini  on 2025-01-05.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color.blue, Color.purple, Color.pink,
                                Color.blue, Color.purple, Color.pink,
                                Color.blue, Color.purple, Color.pink].shuffled()
    ]
    @State private var revealedIndices: [Int] = []
    @State private var matchedIndices: Set<Int> = []
    
    var body: some View{
        VStack{
            Text("Fucking Square Game")
                .font(.largeTitle)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15){
                ForEach(buttons.indices, id: \.self) { index in
                    Button(action: {
                        buttonTapped(index)
                    })
                    {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 100, height: 100)
                                .foregroundColor(colorFor(index))
                            
                            Text("?")
                                .font(.largeTitle)
                                .foregroundColor(.indigo)
                        }
                    }
                }
            }
            .padding()
        }
    }
    func colorFor(_ index: Int) -> Color {
        return colors[index % 3] // to rotate the colors - blue,pink and purple
    }
    func buttonTapped(_ index: Int) {
        //Placeholoder for the button action
        print("Button \(index) tapped")
    }

}
