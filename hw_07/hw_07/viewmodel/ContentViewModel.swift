//
//  ContentViewModel.swift
//  hw_07
//
//  Created by Dmitry Dementyev on 14.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject{
    
    @Published var validName: Int = 0
    @Published var validPhone: Int = 0
    @Published var validEmail: Int = 0
    @Published var validBirthday: Int = 0
    @Published var validPassword: Int = 0
    
    let usernamePbl = PassthroughSubject<String, Never>()
    let phonePbl = PassthroughSubject<String, Never>()
    let emailPbl = PassthroughSubject<String, Never>()
    let birthdayPbl = PassthroughSubject<String, Never>()
    let passPbl = PassthroughSubject<String, Never>()
    var requaredFieldValidator:AnyCancellable? = nil
    var fieldValidator:AnyCancellable? = nil
    
    init(){
        requaredFieldValidator = Publishers.CombineLatest3(
            self.phonePbl, self.usernamePbl, self.passPbl)
            .map { (phone, username, password) -> Bool in
                self.validPhone = phone.isPhoneValid() ? 1 : -1
                self.validName = phone.isNameValid() ? 1 : -1
                self.validPassword = phone.isPassValid() ? 1 : -1
                return !phone.isEmpty && !username.isEmpty && !password.isEmpty
                && phone.isPhoneValid()
                && username.isNameValid()
                && password.isPassValid()
            }.sink { valid in
                print("credentials valid: \(valid)")
            }
        
        fieldValidator = Publishers.CombineLatest(
            self.emailPbl, self.birthdayPbl)
            .map { email, birthday in
                self.validEmail = email.isEmpty ? 0 : email.isEmailValid() ? 1 : -1
                self.validBirthday = birthday.isEmpty ? 0 : birthday.isDateValid() ? 1 : -1
        }.sink{}
    }
    
    func isNameValid(name:String) -> Bool{
        return false
    }
    
    func isPhoneValid(phone:String) -> Bool{
        return false
    }
    
    func isEmailValid(email:String) -> Bool{
        return false
    }
    
    func isBirthdayValid(birthday:String) -> Bool{
        return false
    }
    
    func isPasswordValid(password:String) -> Bool{
        return false
    }
    

    
}
