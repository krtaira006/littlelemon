//
//  Onboarding.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                Header()
                Hero()
                    .background(Color("green"))
                    .padding(.bottom)
                VStack(alignment: .leading){
                    NavigationLink(destination: Home(), isActive: $isLoggedIn){
                        EmptyView()
                    }
                    Text("First Name *")
                    TextField("first Name", text: $firstName)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        
                    Text("Last Name *")
                    TextField("Last Name", text: $lastName)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        
                    Text("Email Address *")
                    TextField("Email", text: $email)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.horizontal)
                Spacer()
                Button("Register") {
                    if (!(firstName.isEmpty) && !(lastName.isEmpty) && !(email.isEmpty)){
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                    }
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color("yellow"))
                .foregroundColor(.black)
                .cornerRadius(16)
                .padding()
            }
            .onAppear(){
                if(UserDefaults.standard.bool(forKey: kIsLoggedIn)){
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
