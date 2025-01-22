//
//  HomePageView.swift
//  Square_Game
//
//  Created by Nimeshika Mandakini  on 2025-01-22.
//


//
//  Untitled.swift
//  Square_Game
//
//  Created by Nimeshika Mandakini  on 2025-01-22.
//

import SwiftUI

struct MainMenuView: View {
    @State private var showExitAlert = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Hey!! Lessgoo ")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.purple)
                    .padding()

                // Start Game Button
                NavigationLink(destination: ContentView()) {
                    Text("Start Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                // User Guide Button
                NavigationLink(destination: UserGuideView()) {
                    Text("User Guide")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }

                // High Score Button
                NavigationLink(destination: HighScoreView()) {
                                    Text("High Scores")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.orange)
                                        .cornerRadius(10)
                                }

                // Exit Button
                Button(action: { showExitAlert = true }) {
                    Text("Exit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .alert("Are you sure you want to exit?", isPresented: $showExitAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Exit", role: .destructive) {
                    exitApp()
                }
            }
        }
    }

    // Function to exit the app
    func exitApp() {
        // Use for testing or development purposes only
        exit(0)
    }
}

// User Guide View
struct UserGuideView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("User Guide")
                    .font(.largeTitle)
                    .padding(.bottom, 10)

                Text("How to Play:")
                    .font(.title2)
                    .bold()
                Text("""
1. Tap the 'Start Game' button to begin the game.
2. Use the arrow keys or on-screen controls to move the square.
3. Avoid obstacles and collect points to increase your score.
4. Reach the target score to win the game.

Enjoy the challenge and improve your skills with every game!
""")
                    .padding(.bottom, 10)

                Text("Tips:")
                    .font(.title2)
                    .bold()
                Text("""
- Keep an eye on moving obstacles.
- Plan your moves ahead to avoid traps.
- Practice regularly to improve your reaction time.
""")
            }
            .padding()
        }
    }
}

// High Score View
struct HighScoreView: View {
    @State private var scores: [ScoreEntry] = []

    var body: some View {
        VStack {
            Text("High Scores")
                .font(.largeTitle)
                .bold()
                .padding()

            List {
                if scores.isEmpty {
                    Text("No high scores yet! Play the game to set a record!")
                } else {
                    ForEach(scores.sorted { $0.score > $1.score }, id: \.date) { score in
                        HStack {
                            Text("Score: \(score.score)")
                            Spacer()
                            Text(score.date, style: .date)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .onAppear {
            loadScores()
        }
    }

    func loadScores() {
        if let data = UserDefaults.standard.data(forKey: "scores"),
           let savedScores = try? JSONDecoder().decode([ScoreEntry].self, from: data) {
            scores = savedScores
        }
    }
}


#Preview {
    MainMenuView()
}
