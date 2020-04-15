//
//  ContentView.swift
//  hw_07
//
//  Created by Dmitry Dementyev on 14.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private (set) var content: ContentViewModel
    @State var userName: String = ""
    @State var userPhone: String = ""
    @State var userEmail: String = ""
    @State var userBirthday: String = ""
    @State var userPassword: String = ""
    
    var body: some View {
        VStack{
            HStack (spacing: 10){
                Text("Name *")
                    .frame(width: 100, alignment: .trailing)
                TextField("", text: Binding<String>(get: {
                    self.userName
                }, set: {
                    self.userName = $0
                    self.content.validName = 0
                }))
                    .border(content.validName == 0 ? Color.clear :
                        content.validName == 1 ? Color.green : Color.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            HStack (spacing: 10){
                Text("Phone *")
                    .frame(width: 100, alignment: .trailing)
                TextField("", text: Binding<String>(get: {
                    self.userPhone
                }, set: {
                    self.userPhone = $0
                    self.content.validPhone = 0
                }))
                    .border(content.validPhone == 0 ? Color.clear :
                        content.validPhone == 1 ? Color.green : Color.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            HStack (spacing: 10){
                Text("E-mail")
                    .frame(width: 100, alignment: .trailing)
                TextField("", text: Binding<String>(get: {
                    self.userEmail
                }, set: {
                    self.userEmail = $0
                    self.content.validEmail = 0
                }))
                    .border(content.validEmail == 0 ? Color.clear :
                        content.validEmail == 1 ? Color.green : Color.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            HStack (spacing: 10){
                Text("Birthday")
                    .frame(width: 100, alignment: .trailing)
                TextField("", text: Binding<String>(get: {
                    self.userBirthday
                }, set: {
                    self.userBirthday = $0
                    self.content.validBirthday = 0
                }))
                    .border(content.validBirthday == 0 ? Color.clear :
                        content.validBirthday == 1 ? Color.green : Color.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            HStack (spacing: 10){
                Text("Password *")
                    .frame(width: 100, alignment: .trailing)
                SecureField("", text: Binding<String>(get: {
                    self.userPassword
                }, set: {
                    self.userPassword = $0
                    self.content.validPassword = 0
                }))
                    .border(content.validPassword == 0 ? Color.clear :
                        content.validPassword == 1 ? Color.green : Color.red)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            HStack (spacing: 10){
                Spacer()
                    .frame(width: 100)
                Button(action: {
                    self.content.emailPbl.send(self.userEmail)
                    self.content.usernamePbl.send(self.userName)
                    self.content.phonePbl.send(self.userPhone)
                    self.content.birthdayPbl.send(self.userBirthday)
                    self.content.passPbl.send(self.userPassword)
                    
                    print("email \(self.userEmail.isEmailValid())")
                    print("name \(self.userName.isNameValid())")
                    print("phone \(self.userPhone.isPhoneValid())")
                    print("date \(self.userBirthday.isDateValid())")
                    print("pass \(self.userPassword.isPassValid())")
                }){
                    Text("Submit")
                        .fontWeight(.bold)
                        .padding(10)
                        .frame(width: 120)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .background(Color.orange)
                        .cornerRadius(5)
                        
                }
                Spacer()
                    .frame(width: 80)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
