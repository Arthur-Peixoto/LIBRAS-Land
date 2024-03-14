import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .map
    @State var nomePag: String = ""
    @State var currentDate = Date.now
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
       
        NavigationStack{
            ZStack {
                Text("\(currentDate)")
                    .onReceive(timer) { input in
                        currentDate = input
                    }
                VStack {
                    TabView(selection: $tabSelected) {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            HStack {
                                switch tab {
                                case Tab.map:
                                    pagMap()
                                case Tab.trophy:
                                    pagAprendizado()
                                case Tab.person:
                                    pagPerfil()
                                        .animation(nil, value: tabSelected)
                                }
                            }
                            .tag(tab)
                        }
                    }
                }
                if(Global.ativar == 1){
                    VStack {
                        Spacer()
                        VStack{ //tabview Customizada
                            CustomTabBar(selectedTab: $tabSelected)
                        }.padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
