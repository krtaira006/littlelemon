//
//  UserProfile.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Environment(\.presentationMode) var presentation
    @State private var isLoggedOut = false
    
    var body: some View {
        VStack {
            Text("Personal information")
                .font(.title)
            Image("Profile")
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
            HStack{
                Text("First Name:")
                Text(firstName)
            }
            .padding(5)
            HStack{
                Text("Last Name: ")
                Text(lastName)
            }
            .padding(5)
            HStack{
                Text("Email:")
                Text(email)
            }
            .padding(5)
            Spacer()
            Button("Log Out") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                isLoggedOut = true
                self.presentation.wrappedValue.dismiss()
            }
            .padding(.bottom)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
