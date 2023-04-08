//
//  Header.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/31/23.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        VStack{
            ZStack{
                Image("Logo")
                HStack{
                    Spacer()
                    if isLoggedIn {
                        Image("Profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 50)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
        }
        .frame(maxHeight: 60)
        .padding(.bottom)
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
