//
//  SecureTextField.swift
//  Biomed-Tech
//
//  Created by Ivan Lorenzana Belli on 08/11/22.
//

import SwiftUI

struct SecureTextField: View {
    let title: String
    @Binding var text: String
    @State var isSecureField: Bool = true
    var body: some View {
        HStack{
            if isSecureField{
                SecureField("Password", text: $text)
            }else {
                TextField(text, text: $text)
            }
        }
        .overlay(Image(systemName: isSecureField ? "eye.slash": "eye")
            .onTapGesture {
                isSecureField.toggle()
            }.foregroundColor(Color.biomedBlack),alignment: .trailing
            )
        
    }
}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField(title: "Password",text: .constant("Hola"))
    }
}
