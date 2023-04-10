//
//  ItemDetail.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/31/23.
//

import SwiftUI

struct FoodDetail: View {
    let dish: Dish
    
    var body: some View {
        HStack{
            VStack{
                Text(dish.title!)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(dish.descriptions!)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text(dish.price!)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            AsyncImage(url: URL(string: dish.image!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
            .padding(.trailing)
        }
        .frame(maxHeight: 100)
    }
}

struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(dish: PersistenceController.oneDish())
    }
}
