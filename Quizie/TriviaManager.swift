//
//  TriviaManager.swift
//  belajar swift
//
//  Created by mohammad ichwan al ghifari on 28/01/25.
//

import Foundation

@MainActor
class TriviaManager: ObservableObject{
    
    
    
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    
    @Published var recentPlayed: [RecentPlayedModel] {
        didSet {
            if let encoded = try? JSONEncoder().encode(recentPlayed) {
                UserDefaults.standard.set(encoded, forKey: "recentPlayed")
            }
        }
    }

    
    private var category: String
    //    private var isFetching = false
    
    init(category: String = "random") {
        self.category = category
        if let savedData = UserDefaults.standard.data(forKey: "recentPlayed"),
           let decoded = try? JSONDecoder().decode([RecentPlayedModel].self, from: savedData) {
            self.recentPlayed = decoded
        } else {
            self.recentPlayed = []
        }
    }
    
    func fetchTrivia() async {
        // API
        var apiURL: String {
            switch category {
            case "random":
                return "https://opentdb.com/api.php?amount=10"
            case "sport":
                return "https://opentdb.com/api.php?amount=10&category=21"
            case "geography":
                return "https://opentdb.com/api.php?amount=10&category=22"
            default:
                return ""
            }
        }
        
        guard let url = URL(string: apiURL) else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        do{
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 429 {
                    print("Rate limit exceeded. Please wait and try again.")
                }
                print("Failed to fetch data, status code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                return
            }
            
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async{
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
            
        } catch {
            print("error fetching trivia \(error)")
        }
    }
    
    
    
    func goToNextQuestion(){
        if answerSelected{
            if index + 1 < length{
                index += 1
                setQuestion()
            }else{
                reachedEnd = true
                saveRecentPlayed()
            }
        }
    }
    
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length{
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices = currentTriviaQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect{
            score += 1
        }
    }
    
    func saveRecentPlayed() {
        let categoryIcons: [String: String] = [
                "random": "🧠",
                "geography": "🌎",
                "sport": "⚽️"
            ]
        let icon = categoryIcons[category] ?? "❓"
        let newEntry = RecentPlayedModel(category: category.capitalized, score: score, totalQuestions: length, icon: icon)
        recentPlayed.insert(newEntry, at: 0)
        
        // Batasi jumlah history agar tidak terlalu banyak
        if recentPlayed.count > 5 {
            recentPlayed.removeLast()
        }
    }
    
    func playQuiz(category: String) {
        self.category = category.lowercased() // Pastikan kategori sesuai dengan API
        Task {
            await fetchTrivia() // Ambil pertanyaan baru
        }
    }
}
