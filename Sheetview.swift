
import SwiftUI

struct Sheetview: View {
    
    @Environment(\.dismiss) var presentationMode
    
    var opcoes = [
        Sugestoes(id: 1, nome: "Menino"),
        Sugestoes(id: 2, nome: "Menina"),
        Sugestoes(id: 3, nome: "Cãozinho"),
        Sugestoes(id: 4, nome: "Gatinho"),
        Sugestoes(id: 5, nome: "Robô")
    ]
    
    @Binding var nome : String
    
    var body: some View {
        
            ZStack{
                VStack(alignment: .leading){
                    ForEach(opcoes) { opcao in Button(action: {
                        nome = opcao.nome
                        global.perfil = nome
                        presentationMode()
                    }, label: {
                        HStack{
                            Image(opcao.nome).resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60).clipShape(Circle())
                            Text(opcao.nome).font(.system(size: 30)).foregroundColor(.white).fontWeight(.semibold)
                        }.padding()
                        .frame(width: 250,height: 80, alignment: .leading).background(.orange).cornerRadius(8)
                    })
                    }
                }
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color("violeta"))
        }
    
}

