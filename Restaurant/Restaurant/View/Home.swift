//
//  Home.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

//import SwiftUI
//
//struct Home: View {
//    let persistence = PersistenceController.shared
//    var body: some View {
//        TabView {
//            Menu()
//                .environment(\.managedObjectContext, persistence.container.viewContext)
//                .tabItem{ Label("Menu", systemImage: "list.dash") }
//            UserProfile()
//                .tabItem{Label("User", systemImage: "square.and.pencil")}
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}


import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu().environment(\.managedObjectContext, persistence.container.viewContext).tabItem({Label("Menu", systemImage: "list.dash")})
            UserProfile().tabItem({Label("Profile", systemImage: "square.and.pencil")})
            
        }.navigationBarBackButtonHidden(true)
    }
    let persistence = PersistenceController.shared
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
