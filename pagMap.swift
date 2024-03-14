//
//  pagMap.swift
//  LIBRASLand
//
//  Created by Student03 on 31/10/23.
//

import SwiftUI

struct pagMap: View {
    @State var ativarEscolherTema = 0;
    @State var testCharacter : Character = Character(id: 1, name: "Sudayn", imageUrl: "https://i.redd.it/8znyl93ec8x71.png", region: "Sudeste", contents: [Topic(id: 1, name: "Animais", state: 1, messages: [Message(id: 1, question: "teste1", answers: [Answer(id: 1, answer: "Cachorro"), Answer(id: 2, answer: "Gato")]), Message(id: 2, question: "teste2", answers: [Answer(id: 3, answer: "Zebra"), Answer(id: 4, answer: "Cavalo")]), Message(id: 3, question: "teste3", answers: [Answer(id: 5, answer: "Coelho"), Answer(id: 6, answer: "Abelha")])], size: 3), Topic(id: 2, name: "Comidas", state: 2, messages: [], size: 0), Topic(id: 3, name: "Clima", state: 3, messages: [], size: 0)])
    @State var data : [Character] = []
    
    var body: some View {
        
        NavigationStack{
            if data.indices.contains(0) {
                ZStack{
                    HStack {
                        ScrollView(){
                            ScrollView(.horizontal){
                                ZStack{//mapa do Brasil
                                    Image("mapaBrasil")
                                        .frame(width: nil)
                                    
                                    VStack{//personagens
                                        NavigationLink(destination:escolherTema(currentCharacter: $data[0])){ //Joaozinho
                                            Image("avatar1")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(40)
                                                .overlay(Circle().stroke(Color.red,lineWidth: 5))
                                                .frame(width: 80,height: 80)
                                        } .offset(x:700,y:-400)
                                     
                                            //Aninha
                                            Image("avatar2")
                                                .resizable()
                                                .scaledToFit()
                                                .cornerRadius(40)
                                                .overlay(Circle().stroke(Color.red,lineWidth: 5))
                                                .frame(width: 80,height: 80)
                                                .offset(x:680,y:-370)
                                        
                                        Image("avatar3")
                                            .resizable()
                                            .scaledToFit()
                                        
                                        .frame(width: 70,height: 70)
                                            .cornerRadius(40)
                                            .overlay(Circle().stroke(Color.red,lineWidth: 6))
                                            .offset(x:530,y:-410)
                                    
                                        Image("avatar4")
                                            .resizable()
                                            .scaledToFit()
                                        
                                        .frame(width: 80,height: 75)
                                            .cornerRadius(80)
                                            .overlay(Circle().stroke(Color.red,lineWidth: 5))
                                            .offset(x:550,y:-650)
                                    
                                    }
                                }
                            }
                        }
                    } .ignoresSafeArea()
                    
                    /*
                    if(Global.ativar == 1){
                        escolherTema()
                    }
                    */
                    
                    VStack{ //barra de cima com nome da pagina
                        HStack{
                            Text("LIBRASLand")
                                .font(.title2)
                                .fontWeight(.black)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .padding(.top, 35.0)
                        }
                        .frame(width:390, height: 100)
                        .background(Color(red: 0.9568627450980393, green: 0.34901960784313724, blue: 0.0196078431372549))
                        .cornerRadius(100)
                        .padding(.bottom, 645.0)
                        
                    }
                }
            } else {
                Image("Slogan").resizable().scaledToFill().ignoresSafeArea()
            }
        }.onAppear {
            fetchData()
        }
    }
    func fetchData() {
            guard let url = URL(string: "http://192.168.128.237:1880/getCharacters") else { return }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let characters = try JSONDecoder().decode([Character].self, from: data)
                    DispatchQueue.main.async {
                        self.data = characters
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
}

struct pagMap_Previews: PreviewProvider {
    static var previews: some View {
        pagMap()
    }
}
