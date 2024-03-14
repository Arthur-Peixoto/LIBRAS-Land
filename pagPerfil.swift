
import SwiftUI

struct global {
    static var perfil = "Robô"
}

struct pagPerfil: View {
    
    @State var nickPerfil : String = "Nome"
    @State var emailPerfil: String = "libras@land.com"
    @State var idadePerfil: String = "2 anos"
    @State var escolaPerfil: String = "Hackatruck"
    @State var fotoPerfilvasco = fotoPerfil.FotoPerfil
    @State private var showingSheet = false
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    Image(fotoPerfilvasco).resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 150).clipShape(Circle())
                    TextField("Usuario", text: $nickPerfil).multilineTextAlignment(.center).fontWeight(.bold).font(.system(size: 30)).foregroundColor(.white)
                    ScrollView(.horizontal){
                        HStack(alignment: .center){
                            ForEach(Array(nickPerfil), id: \.self){letra in VStack{
                                Image(letra.uppercased()).resizable().scaledToFit().frame(width: 50, height: 50).background(.white)
                                    Text(letra.uppercased()).foregroundColor(.white)
                                }}
                            }.frame(width: 400, height: 75, alignment: .center)
                            .padding(.horizontal, 10.0)
                        }
                    }
                    HStack{
                        Button("Escolha seu personagem: "){
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet){
                            Sheetview(nome: $fotoPerfilvasco)
                        }.frame(width: 220, height: 25).background(.orange).cornerRadius(4)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        Text(fotoPerfilvasco).foregroundColor(.white)
                
                    }
                    HStack{
                        Spacer(minLength: 65)
                        Text("Email: ").font(.system(size: 20)).foregroundColor(.white).fontWeight(.semibold)
                        TextField("xxxx@xxxx.com", text: $emailPerfil).foregroundColor(.white)
                    }
                HStack{
                    Spacer(minLength: 65)
                    Text("Idade: ").font(.system(size: 20)).foregroundColor(.white).fontWeight(.semibold)
                    TextField("0", text: $idadePerfil ).foregroundColor(.white)
                    
                        .padding(.trailing)
                    
                }
                    HStack{
                        Spacer(minLength: 65)
                        Text("Escola: ").font(.system(size: 20)).foregroundColor(.white).fontWeight(.semibold)
                        TextField("UFERSA", text: $escolaPerfil).foregroundColor(.white)
                    }
            }
            .padding(.bottom, 80.0)
            
            VStack{ //barra de cima com nome da pagina
                HStack{
                    Text("Perfil")
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
            
            }.frame(maxWidth: .infinity,maxHeight: .infinity).background(Color("violeta"))
        }
    }


struct pagPerfil_Previews: PreviewProvider {
    static var previews: some View {
        pagPerfil()
    }
}
