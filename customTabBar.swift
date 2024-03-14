import SwiftUI

enum Tab: String, CaseIterable {
    case map
    case trophy
    case person
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    private var tabColor: Color {
        switch selectedTab {
        case .map:
            return Color("Azul")
        case .trophy:
            return Color("Azul")
        case .person:
            return Color("Azul")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    Image(systemName: selectedTab == tab ? fillImage: tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.3 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor: .white)
                        .font(.system(size: 25))
                        .padding(.horizontal, 22)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                }
            }
            .frame(width: nil, height: 80)
            .background(Color(red: 0.9568627450980393, green: 0.34901960784313724, blue: 0.0196078431372549))
            .cornerRadius(30)
            .padding([.top, .leading, .trailing])
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.map))
    }
}
