//
//  ChatConversation.swift
//  FinalProject
//
//  Created by Student on 01/11/23.
//

import SwiftUI
import SDWebImage

struct Msg {
    var content : String
    var type : Int
}

struct ChatConversation: View {
    
    @State var topic: Topic
    @State var imageUrlChar: String
    @State var contQuestions: Int = 0
    @State var contMessages: Int = 0
    @State var contAnswers: Int = 0
    @State var conversation: [Msg] = []
    var body: some View {
        VStack{
            ScrollView{
 
                //AnimatedImage(url: URL(string: "https://i.imgur.com/i4Poniy.gif"))
                
                // Primeira pergunta
                if topic.messages.indices.contains(0) {
                    HStack{
                        
                            Image("avatar1")
                                .resizable().scaledToFit().frame(width: 80, height: 80).cornerRadius(50).offset(x: 60)
                                
                        HStack{
                            
                            Text(topic.messages[0].question).fontWeight(.semibold).font(.title2).padding(10).frame(width: 260).padding(.leading, 20).multilineTextAlignment(.leading)
                        }.padding(.leading, 30).background(Color("LightOrange")).cornerRadius(6).zIndex(-1)
                        Spacer()
                    }.offset(x: -30).offset(y: 20)
                }
                
                // Aqui vai indo o resto, dependendo das escolhas
                
                ForEach(0..<100) { i in
                    
                    if conversation.indices.contains(i) && i <= contMessages {
                        switch conversation[i].type {
                        case 1:
                            HStack{
                                AsyncImage(url: URL(string: imageUrlChar)){
                                    test in
                                    if let aux = test.image {
                                        aux.resizable().scaledToFit().frame(width: 80, height: 80).cornerRadius(50).offset(x: 60)
                                    }
                                }
                                HStack{
                                    
                                    Text(conversation[i].content).fontWeight(.semibold).font(.title2).padding(10).frame(width: 260).padding(.leading, 20).multilineTextAlignment(.leading)
                                }.padding(.leading, 30).background(Color("LightOrange")).cornerRadius(6).zIndex(-1)
                                Spacer()
                            }.offset(x: -30)
                        case 2:
                            HStack{
                                HStack{
                                    
                                    Text(conversation[i].content).fontWeight(.semibold).font(.title2).padding(10).frame(width: 260).padding(.leading, 20).multilineTextAlignment(.leading)
                                }.padding(.leading, 30).background(Color("LightOrange")).cornerRadius(6).zIndex(-1)
                                Image(global.perfil)
                                .resizable().scaledToFill().frame(width: 80, height: 80).cornerRadius(50).offset(x: -50)
                                Spacer()
                            }.offset(x: 30)
                        case 3:
                            HStack{
                                AsyncImage(url: URL(string: imageUrlChar)){
                                    test in
                                    if let aux = test.image {
                                        aux.resizable().scaledToFit().frame(width: 80, height: 80).cornerRadius(50).offset(x: 60)
                                    }
                                }
                                
                                HStack{
                                    ImageViewWithGif(url: URL(string: conversation[i].content))
                                        .aspectRatio(contentMode: .fit).frame(width: 200, height: 200)
                                    
                                    /*AsyncImage(url: URL(string: conversation[i].content)) {
                                        test in
                                        if let aux = test.image {
                                            aux.resizable().scaledToFit().padding(10).frame(width: 200).padding(.leading, 50)
                                        }
                                    }*/
                                }
                                
                                
                                Spacer()
                            }.offset(x: -30)
                        default: Text("ERROR")
                        }
                            
                    }
                    
                    
                }.offset(y: 20)
                
                
            }.navigationTitle(topic.name!).toolbarColorScheme(.dark)
                .toolbarBackground(
                    Color("DarkOrange"),
                    for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
            
            // Opções de escolha. As respostas (cachorro, gato) vem de algum lugar da API
            
            Spacer()
            
            VStack{
                //Text("\(contQuestions)")
                if(contQuestions >= topic.size!){
                    VStack{
                        Text("Parabéns!").font(.system(size: 28)).fontWeight(.bold)
                        Text("Você é muito esperto(a).").font(.system(size: 28)).fontWeight(.bold)
                    }
                    
                } else {
                    Text("Escolha:").font(.system(size: 28)).fontWeight(.bold) .padding(.top,15)
                    HStack{
                        Button(topic.messages[contQuestions].answers[0].answer!) {
                            
                            // Fazer gerar respostas, que vão estar assemalhadas às perguntas (messages, que não serão mais Strings)
                            
                            conversation.append(Msg(content: topic.messages[contQuestions].answers[0].answer!, type: 2))
                            
                            conversation.append(Msg(content: topic.messages[contQuestions].answers[0].librasUrl!, type: 3))
                            
                            
                            if contQuestions <= topic.size! - 1 {
                                contQuestions = contQuestions + 1
                                contMessages = contMessages + 3
                                contAnswers = contAnswers + 1
         
                            }
                            
                            // Adiciona a proxima pergunta
                            if !(contQuestions >= topic.size!) {
                                conversation.append(Msg(content: topic.messages[contQuestions].question, type: 1))
                            }
                            
                            
                            
                        }.frame(width: 160, height: 60).background(Color("LightOrange")).font(.title2).fontWeight(.bold).cornerRadius(10)
                        
                        Button(topic.messages[contQuestions].answers[1].answer!){
                            
                            conversation.append(Msg(content: topic.messages[contQuestions].answers[1].answer!, type: 2))
                            
                            conversation.append(Msg(content: topic.messages[contQuestions].answers[1].librasUrl!, type: 3))
                            
                            
                            if contQuestions <= topic.size! - 1 {
                                contQuestions = contQuestions + 1
                                contMessages = contMessages + 3
                                contAnswers = contAnswers + 1
         
                            }
                            
                            // Adiciona a proxima pergunta
                            if !(contQuestions >= topic.size!) {
                                conversation.append(Msg(content: topic.messages[contQuestions].question, type: 1))
                            }
                            
                        }.frame(width: 160, height: 60).background(Color("LightOrange")).font(.title2).fontWeight(.bold).cornerRadius(10)
                    }
                }
                
            }.frame(maxWidth: 370, minHeight: 120).padding(.bottom, 30).background(Color("DarkOrange")).cornerRadius(50)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("DarkPurple")).foregroundColor(.white)
        
    }
}

struct ChatConversation_Previews: PreviewProvider {
    static var previews: some View {
        ChatConversation(topic: Topic(id: 1, name: "Animais", state: 1, messages: [Message(id: 1, question: "teste1", answers: [Answer(id: 1, answer: "Cachorro", librasUrl: "https://media.tenor.com/ruhiCXS-UgkAAAAd/cachorro-assustado-cachorro.gif"), Answer(id: 2, answer: "Gato")]), Message(id: 2, question: "teste2", answers: [Answer(id: 3, answer: "Cavalo", librasUrl: "https://i.gifer.com/2dpY.gif"), Answer(id: 4, answer: "Zebra")]), Message(id: 3, question: "teste3", answers: [Answer(id: 5, answer: "Coelho", librasUrl: "https://media.tenor.com/5cdf3GNffmMAAAAC/alice-clock.gif"), Answer(id: 6, answer: "Tartaruga")])], size: 3), imageUrlChar: "https://i.redd.it/8znyl93ec8x71.png")
    }
}

struct ImageViewWithGif: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: UIViewRepresentableContext<ImageViewWithGif>) -> UIView {
        let containerView = UIView()
        let imageView = UIImageView()
        containerView.addSubview(imageView)
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ImageViewWithGif>) {
        if let url = url, let imageView = uiView.subviews.first as? UIImageView {
            imageView.sd_setImage(with: url) { _, _, _, _ in
                // Resize the image view to the desired size
                imageView.frame = CGRect(x: 80, y: 0, width: 200, height: 200)
            }
        }
    }
}
