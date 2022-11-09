//
//  LoginViewModel.swift
//  Biomed-Tech
//
//  Created by Ivan Lorenzana Belli on 09/11/22.
//

import Foundation
import ActionButton
import Combine
import SwiftUI


class ViewModel: ObservableObject{
    @Published var buttonState: ActionButtonState = .disabled(title: "Fill out all fields to login", systemImage: "")
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var emailIsValidPublisher: AnyPublisher<Bool, Never>{
        $email
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
    }
    private var passwordIsValidPublisher: AnyPublisher<Bool, Never>{
        $password
            .map{value in
                !value.isEmpty
            }
            .eraseToAnyPublisher()
    }
    init(){
        emailIsValidPublisher
            .combineLatest(passwordIsValidPublisher)
            .map{value1, value2 in
                value1 && value2
            }
            .map{fieldsValid -> ActionButtonState in
                if fieldsValid{
                    return .enabled(title: "Login", systemImage: "checkmark.circle")
                }
                return .disabled(title: "Fill out all fields to login", systemImage: "")
            }
            .assign(to: \.buttonState, on: self)
            .store(in: &cancellables)
    }
    
    func login(){
        buttonState = .loading(title: "Loading", systemImage: "person")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            [weak self] in self?.buttonState = .enabled(title: "Login", systemImage: "")
        }
    }
}
