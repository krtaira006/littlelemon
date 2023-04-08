//
//  ItemDetail.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/31/23.
//

import SwiftUI

struct ItemDetail: View {
    @Environment(\.managedObjectContext) private var viewContext
    let dish: Dish
    
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Rectangle())
                .frame(minHeight: 150)
                .padding()
                Text(dish.title ?? "")
                    .font(.largeTitle)
                    .foregroundColor(Color("green"))
                Spacer(minLength: 20)
                Text(dish.descriptions ?? "")
                    .font(.body)
                Spacer(minLength: 10)
                Text("$" + (dish.price ?? ""))
                    .font(.body)
                    .foregroundColor(Color("green"))
                    .monospaced()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(dish: PersistenceController.oneDish())
    }
}
