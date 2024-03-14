//
//  pagAprendizado.swift
//  LIBRASLand
//
//  Created by Student03 on 31/10/23.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct pagAprendizado: View {
    @State private var about = false
    @State var isAnimating: Bool = true
    
    @State private var showAlertBlocked = false
    @State private var showAlertDone = false
    
    @State var LetraSelecionada :  letras? = nil
    
    @State var word = [
        letras(img: "A 1", giff: "https://i.imgur.com/JWUjoe1.gif"),
        letras(img: "B 1", giff: "https://i.imgur.com/A085cvk.gif"),
        letras(img: "C 2", giff: "https://i.imgur.com/JCv7oqJ.gif"),
        letras(img: "D 1", giff: "https://i.imgur.com/0GZWOPj.gif"),
        letras(img: "E 1", giff: "https://i.imgur.com/M4Ct7cR.gif"),
        letras(img: "F 1", giff: "https://i.imgur.com/JCv7oqJ.gif"),
        letras(img: "G 1", giff: "https://i.imgur.com/fMJQX9U.gif"),
        letras(img: "H 1", giff: "https://i.imgur.com/G1UDPKG.gif"),
        letras(img: "I 1", giff: "https://i.imgur.com/VzdEDbK.gif"),
        letras(img: "J 1", giff: "https://i.imgur.com/YLGKqFP.gif"),
        letras(img: "K 1", giff: "https://i.imgur.com/G6UPxp7.gif"),
        letras(img: "L 1", giff: "https://i.imgur.com/eP7hqzg.gif"),
        letras(img: "M 1", giff: "https://i.imgur.com/5aDSkcm.gif"),
        letras(img: "N 1", giff: "https://i.imgur.com/mYuUyLi.gif"),
        letras(img: "O 1", giff: "https://i.imgur.com/cuHb5k4.gif"),
        letras(img: "P 1", giff: "https://i.imgur.com/gNLJ0aZ.gif"),
        letras(img: "Q 1", giff: "https://i.imgur.com/y3eari5.gif"),
        letras(img: "R 1", giff: "https://i.imgur.com/cmaY65Y.gif"),
        letras(img: "S 1", giff: "https://i.imgur.com/FQAI1z1.gif"),
        letras(img: "T 1", giff: "https://i.imgur.com/Mf3el3E.gif"),
        letras(img: "U 1", giff: "https://i.imgur.com/4ckSIhl.gif"),
        letras(img: "V 1", giff: "https://i.imgur.com/wbbt0l8.gif"),
        letras(img: "W 1", giff: "https://i.imgur.com/KwGm95h.gif"),
        letras(img: "X 1", giff: "https://i.imgur.com/GgtmrGp.gif"),
        letras(img: "Y 1", giff: "https://i.imgur.com/pCh0KT7.gif"),
        letras(img: "Z 1", giff: "https://i.imgur.com/kmpksLK.gif")]
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Text("Alfabeto em Libras: ")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding([.top, .leading])
                }
                .padding(.top, 100)
                .padding(.trailing, 170)
                VStack{
                    HStack{
                        ForEach(word[0...4].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                //self.$boolArr[idx]
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    HStack{
                        ForEach(word[5...9].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    HStack{
                        ForEach(word[10...14].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    HStack{
                        ForEach(word[15...19].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    HStack{
                        ForEach(word[20...23].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    HStack{
                        ForEach(word[24...25].indices, id: \.self) { id in
                            Button{
                                LetraSelecionada = word[id]
                                about.toggle()
                            }label: {
                                Image(word[id].img)
                                    .frame(height: 107)
                            }.background(Color("laclaro")).cornerRadius(10)
                        }
                    }
                    
                }
                VStack{
                    Text("Tópicos Aprendidos: ")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding([.top, .leading])
                    
                }
                .padding(.trailing, 160)
                HStack{
                    NavigationLink(destination: pagAnimal()){
                        AsyncImage(url: URL(string: "https://i.imgur.com/sRCG3fr.png")) {
                            test in
                            
                            if let aux = test.image {
                                aux.resizable().frame(width: 50,height: 50).scaledToFit()
                            }
                        }
                      
                            
                        
                        
                        Text("Animais")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            
                        
                    }
                }.frame(width: 230, height: 80)
                    .background(Color.orange)
                    .cornerRadius(10)
                
                HStack{
                    
                    Text("Comidas")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    Image(systemName: "lock").foregroundColor(Color("DarkOrange"))
                }
                .frame(width: 230, height: 80)
                .background(Color("LightGray"))
                .cornerRadius(10)
                .onTapGesture {
                    showAlertBlocked = true
                }.alert(isPresented: $showAlertBlocked) {
                    Alert(title: Text("ATENÇÃO!"),
                          message: Text("Vamos fazer outras atividades primeiro?"),
                          dismissButton: Alert.Button.default(
                            Text("Vamos lá")
                          )
                    )
                }

                HStack{
                    Text("Clima")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    Image(systemName: "lock").foregroundColor(Color("DarkOrange"))
                }
                .frame(width: 230, height: 80)
                .background(Color("LightGray"))
                .cornerRadius(10)
                .onTapGesture {
                    showAlertBlocked = true
                }.alert(isPresented: $showAlertBlocked) {
                    Alert(title: Text("ATENÇÃO!"),
                          message: Text("Vamos fazer outras atividades primeiro?"),
                          dismissButton: Alert.Button.default(
                            Text("Vamos lá")
                          )
                    )
                }

            }.sheet(item: $LetraSelecionada, content: { sheet in
                //SheetView(chosenNormElement: sheet)
                WebImage(url: URL(string: sheet.giff), isAnimating: $isAnimating) // Animation Control, supports dynamic changes
                // The initial value of binding should be true
                    .customLoopCount(1) // Custom loop count
                    .playbackRate(2.0) // Playback speed rate
                    .playbackMode(.bounce)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("violeta"))
            })
            
            VStack{ //barra de cima com nome da pagina
                HStack{
                    Text("Conquistas")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 35.0)
                }
                .frame(width:390, height: 100)
                .background(Color(red: 0.9568627450980393, green: 0.34901960784313724, blue: 0.0196078431372549))
                .cornerRadius(100)
                .padding(.bottom, 645.0)
            }
            
            
            
        }.background(Color("violeta"))
    }
}

struct pagAprendizado_Previews: PreviewProvider {
    static var previews: some View {
        pagAprendizado()
    }
}
