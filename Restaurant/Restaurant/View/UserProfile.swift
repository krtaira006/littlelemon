//
//  UserProfile.swift
//  Restaurant
//
//  Created by Keiichi Taira on 3/26/23.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State var phoneNumber = ""
    @Environment(\.presentationMode) var presentation
    @State private var isLoggedOut = false
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    @State private var isPressed = false
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                Header()
                    .padding(.vertical, -10)
                Text("Personal information")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 75)
                        .clipShape(Circle())
                    Button(action: {}) {
                        Text("Change")
                            .frame(maxWidth: .infinity, maxHeight: 30)
                            .background(Color("green"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                    .alert("Change made successfully!",
                           isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    Button(action: {}) {
                        Text("Remove")
                            .frame(maxWidth: .infinity, maxHeight: 30)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("green"),lineWidth: 1)
                            )
                            .padding()
                    }
                    .padding(.bottom, -5)
                }
                VStack {
                    Text("First Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.footnote)
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    Text("Last name")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                    Text("E-mail")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("E-mail", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                    Text("Phone number")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Phone number", text: $phoneNumber)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.default)
                }
                Text("Email notifications")
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack{
                    Toggle(isOn: $orderStatuses){Text("Order Statues").font(.footnote)}
    //                    .toggleStyle(.checkbox)
                    Toggle(isOn: $passwordChanges){Text("Password Changes").font(.footnote)}
    //                    .toggleStyle(.checkbox)
                    Toggle(isOn: $specialOffers){Text("Special offers").font(.footnote)}
    //                    .toggleStyle(.checkbox)
                    Toggle(isOn: $newsletter){Text("Newsletter").font(.footnote)}
    //                    .toggleStyle(.checkbox)
                }
                //Spacer()
                Button(action: {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    isLoggedOut = true
                    self.presentation.wrappedValue.dismiss()
                }) {
                    Text("Log out")
                        .frame(width: 350, height: 40)
                        .background(Color("yellow"))
                        .tint(Color("green"))
                        .cornerRadius(16)
                }
                HStack{
                    Button(action: {}) {
                        Text("Discard Changes")
                            .frame(width: 150, height: 40)
                            .background(Color("green"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .padding()
                    }
                    Button(action: {}) {
                        Text("Save Changes")
                            .padding()
                            .frame(width: 150, height: 40)
                            .background(Color("green"))
                            .foregroundColor(.white)
                            .cornerRadius(8)

                    }
                }
            }.padding()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
