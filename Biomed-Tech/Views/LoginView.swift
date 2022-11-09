//
//  LoginView.swift
//  Biomed-Tech
//
//  Created by Ivan Lorenzana Belli on 08/11/22.
//

import SwiftUI
import Combine
import ActionButton

enum FocusableField: Hashable{
    case email, password
}

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.biomedPrimary
                    .ignoresSafeArea()
                VStack{
                    Image("LogoModificado")
                        .resizable()
                        .frame(width: 115,height: 96)
                        .scaledToFit()
                    Text("BiomedTech")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()

                    SocialLoginButton(image: "apple", text: "Continue with Apple")
                    SocialLoginButton(image: "google", text: "Continue with Google")
                    Group{
                        HStack{
                            VStack {
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.spacerGray)
                                    .padding(.horizontal)
                            }
                            Text("or")
                                .foregroundColor(Color.biomedBlack)
                            VStack {
                                Divider()
                                    .frame(height:1)
                                    .overlay(Color.spacerGray)
                                    .padding(.horizontal)
                            }
                        }
                        LoginForm()
                        Spacer()
                    }
                    Divider()
                        .frame(height: 1)
                        .overlay(Color.spacerGray)
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(Color.biomedBlack)
                        NavigationLink(destination: SignUpView()){
                            Text("Create account")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SocialLoginButton: View {
    var image: String
    var text: String
    var body: some View {
        HStack{
            Image(image)
                .padding(.horizontal)
            Spacer()
            Text(text)
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(50.0)
        .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black,lineWidth: 1))
    }
}

struct LoginForm: View {
    @StateObject private var model = ViewModel()
    @FocusState private var focus: FocusableField?

    var body: some View {
        VStack{
            TextField("Email addres or username", text: $model.email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .submitLabel(.next)
                .focused($focus, equals: .email)
                .onSubmit {
                    focus = .password
                }
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .overlay(RoundedRectangle(cornerRadius: 80).stroke(Color.black,lineWidth: 1))
            SecureTextField(title: "Password",text: $model.password)
                .focused($focus, equals: .password)
                .submitLabel(.go)
                .onSubmit {
                    model.login()
                }
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .overlay(RoundedRectangle(cornerRadius: 80).stroke(Color.black,lineWidth: 1))
            ActionButton(state: $model.buttonState, onTap: {
                model.login()
            }, backgroundColor: .primary)
            .fontWeight(.bold)
            .cornerRadius(50.0)
        }
    }
}
