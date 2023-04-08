//
//  Hero.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/28/23.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .foregroundColor(Color("yellow"))
                .font(.system(size: 40))
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Chicago")
                        .font(.title)
                        .padding(.bottom, 8)
                    Text("""
                         We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                         """)
                    .font(.body)
                }
                .foregroundColor(.white)
                Image("Hero image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 140, maxHeight: 150)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
                    .padding(.leading)
            }
            .padding(.top, -30)
        }
        .padding()
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          alignment: .topLeading
        )
        .background(Color("green"))
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
