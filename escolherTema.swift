//
//  Chat.swift
//  FinalProject
//
//  Created by Student on 30/10/23.
//

import SwiftUI

struct Character : Identifiable, Codable {
    let id: Int
    let name: String?
    let imageUrl: String?
    let region: String?
    let contents: [Topic]?
}

struct Topic : Identifiable, Codable {
    var id: Int?
    var name: String?
    var state: Int?
    var messages: [Message]
    var iconUrl : String?
    var size: Int?
}

struct Message : Identifiable, Codable {
    var id: Int?
    var question: String
    var answers: [Answer]
}

struct Answer : Identifiable, Codable {
    var id: Int?
    var answer: String?
    var librasUrl: String?
}

struct escolherTema: View {
    
    @Environment(\.presentationMode) private var presentationMode:Binding<PresentationMode>
    
    @Binding var currentCharacter : Character
    @State var message : String = "Olá! Eu sou o José"
    @State private var showAlertBlocked = false
    @State private var showAlertDone = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("violeta")
                    .ignoresSafeArea()
                VStack{ //barra de cima com nome da pagina
                    HStack{
                        Text("Nordeste")
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 35.0)
                    }
                    .frame(width:390, height: 100)
                    .background(Color(red: 0.9568627450980393, green: 0.34901960784313724, blue: 0.0196078431372549))
                    .cornerRadius(100)
                    .padding(.bottom, 680.0)
                }
                //botao back modificado
                .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem (placement: .navigationBarLeading)  {
                        
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            Global.ativar = 1
                        }, label: {
                            Image(systemName: "arrowtriangle.backward.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        })
                    }
                }).frame(width:10, height: 50)
                
                ScrollView{
                    VStack{
                        
                        VStack{
                            HStack{
                                Image("avatar1")
                                    .resizable().scaledToFit().frame(width: 80, height: 80).cornerRadius(50).offset(x: 60)
                                
                                HStack{
                                    Text(message).fontWeight(.semibold).font(.title2).padding(10).frame(width: 280)
                                }.padding(.leading, 30).background(Color("LightOrange")).cornerRadius(6).zIndex(-1)
                                Spacer()
                            }.offset(x: -30)
                            
                            HStack{
                                Image("avatar1")
                                    .resizable().scaledToFit().frame(width: 80, height: 80).cornerRadius(50).offset(x: 60)
                                
                                HStack{
                                    Text("Vamos aprender sobre o que?").fontWeight(.semibold).font(.title2).padding(10).frame(width: 280)
                                }.padding(.leading, 30).background(Color("LightOrange")).cornerRadius(6).zIndex(-1)
                                Spacer()
                            }.offset(x: -30)
                        } // : Perguntas Topicos
                        
                        VStack{
                            ForEach(currentCharacter.contents!){ con in
                                //ForEach(0..<100){ i in
                                // if currentCharacter.contents!.indices.contains(i) { // Verificar Tamanho Array
                                
                                switch(con.state){
                                case 1:
                                    
                                    NavigationLink(destination: ChatConversation(topic: con, imageUrlChar: currentCharacter.imageUrl!)){
                                        HStack{
                                            VStack(alignment: .leading){
                                                AsyncImage(url: URL(string: con.iconUrl!)){ image in
                                                    image.resizable()
                                                    .scaledToFit()
                                                } placeholder: {
                                                    ProgressView()
                                                        .progressViewStyle(.circular)
                                                }
                                                
                                               
                                            } .frame(width: 50, height: 50)
                                            
                                          
                                            
                                            VStack(alignment: .leading){
                                                Text(con.name!).fontWeight(.semibold).font(.title2)
                                            }.padding(.leading, 30)
                                            Spacer()
                                        }.padding(10).frame(width: 250, height: 80)
                                            .background(Color("LightOrange")).cornerRadius(6)
                                            
                                    }
                                    
                                    
                                    
                                case 2:
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: con.iconUrl!)){ image in
                                            image.resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                        } placeholder: {
                                            ProgressView()
                                                .progressViewStyle(.circular)
                                        }
                                        
                                        
                                        Text(con.name!).fontWeight(.semibold).font(.title2)
                                        .padding(.leading, 20)
                                        Image(systemName: "checkmark").foregroundColor(.green)
                                        
                                    }.padding(10).frame(width: 250, height: 80)
                                        .background(Color("LightOrange")).cornerRadius(6).onTapGesture {
                                            showAlertDone = true
                                        }.alert(isPresented: $showAlertDone) {
                                            Alert(title: Text("ATENÇÃO!"),
                                                  message: Text("Você já realizou essa atividade"),
                                                  dismissButton: Alert.Button.default(
                                                    Text("Ok")
                                                  )
                                            )
                                        }
                                    
                                    
                                case 3:
                                    HStack{
                                        AsyncImage(url: URL(string: con.iconUrl!)){ image in
                                            image.resizable()
                                                .scaledToFit()
                                                .frame(width: 50, height: 50)
                                        } placeholder: {
                                            ProgressView()
                                                .progressViewStyle(.circular)
                                        }
                                        
                                        Text(con.name!).fontWeight(.semibold).font(.title2)
                                            .padding(.leading, 20)
                                        Image(systemName: "lock").foregroundColor(Color("DarkOrange"))
                                        
                                    }.padding(10).frame(width: 250, height: 80)
                                        .background(Color("LightGray")).cornerRadius(6)
                                        .onTapGesture {
                                            showAlertBlocked = true
                                        }.alert(isPresented: $showAlertBlocked) {
                                            Alert(title: Text("ATENÇÃO!"),
                                                  message: Text("Vamos em outras atividades primeiro?"),
                                                  dismissButton: Alert.Button.default(
                                                    Text("Vamos lá")
                                                  )
                                            )
                                        }
                                    
                                    
                                default:
                                    NavigationLink(destination: ChatConversation(topic: con, imageUrlChar: "https://i.redd.it/8znyl93ec8x71.png")){
                                        Text(con.name!).fontWeight(.semibold).font(.title2).frame(width: 200, height: 80)
                                            .background(Color("LightOrange")).cornerRadius(6)
                                    }
                                    
                                }
                                
                            }
                            
                        } // : For Categorias
                        
                    }
                    .onAppear(){
                        Global.ativar = 0
                    }
                }.padding(20).foregroundColor(.white)
                
            }
            
            
        }
        
    }
    //}
}

struct escolherTema_Previews: PreviewProvider {
    static var previews: some View {
        escolherTema(currentCharacter: .constant(Character(id: 1, name: "Sudayn", imageUrl: "https://i.redd.it/8znyl93ec8x71.png", region: "Sudeste", contents:  [
            Topic(id: 1, name: "Animais", state: 1, messages: [], iconUrl: "https://i.imgur.com/sRCG3fr.png"),
            Topic(id: 2, name: "Comidas", state: 3, messages: [], iconUrl: "https://i.imgur.com/8JdJLCC.png"),
            Topic(id: 3, name: "Clima", state: 3, messages: [], iconUrl: "https://i.imgur.com/Row0lgx.png"),
            Topic(id: 4, name: "Profissões", state: 3, messages: [], iconUrl: "https://i.imgur.com/041jmlc.png")])))
    }
}


