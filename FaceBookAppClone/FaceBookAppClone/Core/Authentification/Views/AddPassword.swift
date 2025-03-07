//
//  AddPassword.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct AddPassword: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var registrationVM: RegistrationViewModel
    
    init(registrationVM: RegistrationViewModel) {
        self._registrationVM = StateObject(wrappedValue: registrationVM)
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            VStack(alignment: .leading, spacing: 20) {
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("Create a password with at least 6 letters or numbers. It should be something that others can't guess.")
                    .font(.footnote)

                SecureField("Password", text: $registrationVM.password)
                    .customTextFieldViewModifier(width: size.width + 5)
                
                NavigationLink {
                    AgreementView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: size.width - 25, height: 44)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.vertical)
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                    Spacer()
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .background(Color(.systemGray5))
        }
    }
}
