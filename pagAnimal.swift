//
//  pagAnimal.swift
//  LIBRASLand
//
//  Created by Student03 on 09/11/23.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct pagAnimal: View {
    
    @Environment(\.presentationMode) private var presentationMode:Binding<PresentationMode>
    
    @State private var about = false
    @State var isAnimating: Bool = true
    @State var AnimalSelecionado : animais? = nil
    
    @State var anima = [
        animais(img: "Cachorro", giff: "https://i.imgur.com/i4Poniy.gif"),
        animais(img: "Cavalo", giff: "https://i.imgur.com/4VibMM2.gif"),
        animais(img: "Elefante", giff: "https://i.imgur.com/Rj6AJBw.gif"),
        animais(img: "Gato", giff: "https://i.imgur.com/VoPWxVC.gif"),
        animais(img: "Girafa", giff: "https://i.imgur.com/MK5xPpK.gif"),
        animais(img: "Golfinho", giff: "https://i.imgur.com/lzfe9vr.gif"),
        animais(img: "Leão", giff: "https://i.imgur.com/l5zeN7Q.gif"),
        animais(img: "Pássaro", giff: "https://i.imgur.com/VgXPWOy.gif"),
        animais(img: "Peixe", giff: "https://i.imgur.com/PV0Yucn.gif"),
        animais(img: "Zebra", giff: "https://i.imgur.com/98ko5sU.gif")
    ]
    var body: some View {
        ZStack{
            ScrollView{
                HStack{
                    VStack{
                        ForEach(anima.indices, id: \.self) { id in
                            Button{
                                AnimalSelecionado = anima[id]
                                about.toggle()
                            }label: {
                                Image(anima[id].img)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200)
                                    .cornerRadius(10)
                                Text(anima[id].img)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                                    .frame(width: 150, alignment: .leading)
                                    
                            }
                        }
                    }
                }
            }.padding(.top, 25)
            
            VStack{ //barra de cima com nome da pagina
                HStack{
                    Text("Animais")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 25)
                    
                }
                .frame(width:390, height: 100)
                .background(Color(red: 0.9568627450980393, green: 0.34901960784313724, blue: 0.0196078431372549))
                .cornerRadius(100)
                .padding(.bottom, 670.0)
            }
            
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
            
        }.sheet(item: $AnimalSelecionado, content: { sheet in
            //SheetView(chosenNormElement: sheet)
            WebImage(url: URL(string: sheet.giff), isAnimating: $isAnimating) // Animation Control, supports dynamic changes
            // The initial value of binding should be true
                .customLoopCount(1) // Custom loop count
                .playbackRate(2.0) // Playback speed rate
                .playbackMode(.bounce)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("violeta"))
        }).frame(maxWidth: .infinity).background(Color("violeta"))
    }
}

struct pagAnimal_Previews: PreviewProvider {
    static var previews: some View {
        pagAnimal()
    }
}
