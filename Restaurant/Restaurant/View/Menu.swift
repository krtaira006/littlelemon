//
//  Menu.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    @State var starters = true
    @State var desserts = true
    @State var drinks = true
    @State var mains = true

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Header()
                    Hero()
                    TextField("Search menu...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                        .background(Color(red: 0.2874, green: 0.3701, blue: 0.3425))
                        .padding(.top, -10)
                }
                //

                FetchedObjects(predicate: buildPredicate(),sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        if dishes.count != 0 {
                            ForEach(dishes, id: \.self) { dish in
                                NavigationLink(destination: ItemDetail(dish: dish)){
                                    FoodDetail(dish: dish)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            getMenuData()
        }
    }
    func getMenuData() {

        PersistenceController.shared.clear()

        let url = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let URLData = URL(string: url)!
        let request = URLRequest(url: URLData)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            if let data {
                let jsonDecoder = JSONDecoder()
                let menuList = try? jsonDecoder.decode( MenuList.self, from: data)
                if let menuList {
                    for item in menuList.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = item.price
                        dish.image = item.image
                        dish.category = item.category
                        dish.descriptions = item.descriptions
                    }
                    try? viewContext.save()
                }

            }
        }
        task.resume()
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
            return [NSSortDescriptor(key: "title",
                                      ascending: true,
                                      selector:
                                        #selector(NSString.localizedStandardCompare))]
    }

    func buildPredicate() -> NSCompoundPredicate {
                    let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
                    let starters = !starters ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
                    let mains = !mains ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
                    let desserts = !desserts ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
                    let drinks = !drinks ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

                    let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
                    return compoundPredicate
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
