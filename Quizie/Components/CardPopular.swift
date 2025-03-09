import SwiftUI

struct CardPopular: View {
    @EnvironmentObject var triviaManager: TriviaManager
    @State var quizCategories: [CardPopularModel] = [
        CardPopularModel(name: "Random", description: "Uji pengetahuan umummu dengan berbagai pertanyaan dari kategori acak.", category: "random", isLiked: false, img: "randomIMG", icon: "🧠"),
        CardPopularModel(name: "Geography", description: "Tes wawasan geografi dan pengetahuan tentang berbagai negara di dunia.", category: "geography", isLiked: false, img: "geographyIMG", icon: "🌎"),
        CardPopularModel(name: "Sport", description: "Tantang dirimu dengan pertanyaan seputar dunia olahraga.", category: "sport", isLiked: false, img: "sportsIMG", icon: "⚽️")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let cardWidth = geometry.size.width * 0.8 // Lebar kartu responsif (80% dari layar)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -5) { // Ubah spacing agar lebih rapi
                    ForEach(quizCategories.indices, id: \.self) { index in
                        let quiz = quizCategories[index]
                        
                        Image(quiz.img)
                            .resizable()
                            .scaledToFill()
                            .frame(width: cardWidth, height: 355)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .overlay(
                                VStack(alignment: .leading) {
                                    HStack {
                                        NavigationLink {
                                            QuizConfirmationView(category: quiz.category)
                                                .environmentObject(triviaManager)
                                                .toolbar(.hidden, for: .tabBar)
                                            
                                        } label: {
                                            CardButton(text: "Play")
                                        }
                                        
                                        Spacer()
                                        
                                        Button {
                                            quizCategories[index].isLiked.toggle()
                                        } label: {
                                            Image(systemName: quizCategories[index].isLiked ? "heart.fill" : "heart")
                                                .foregroundStyle(quizCategories[index].isLiked ? Color.red : Color.gray)
                                                .font(.system(size: 22))
                                                .padding(14)
                                                .background(Color.white)
                                                .clipShape(Circle())
                                        }
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text(quiz.name)
                                            .font(Font.custom("Oswald", size: 30))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.white)
                                        
                                        Text(quiz.description)
                                            .font(Font.custom("Teko", size: 18))
                                            .fontWeight(.thin)
                                            .foregroundStyle(Color.white)
                                    }
                                    Spacer()
                                }
                                    .padding()
                                    .frame(width: cardWidth, height: 355)
                            )
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                            }
                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal, (geometry.size.width - cardWidth) / 2)
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .frame(height: 360)
    }
}

#Preview {
    CardPopular()
        .environmentObject(TriviaManager())
}
