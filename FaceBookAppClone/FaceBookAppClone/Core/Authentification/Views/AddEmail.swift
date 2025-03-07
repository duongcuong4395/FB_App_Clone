//
//  AddEmail.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct AddEmail: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var registrationVM: RegistrationViewModel
    
    init(registrationVM: RegistrationViewModel) {
        self._registrationVM = StateObject(wrappedValue: registrationVM)
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your email address?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("Enter the email address at which you can be contacted. No one will see this on your profile.")
                    .font(.footnote)

                TextField("Email address", text: $registrationVM.email)
                    .customTextFieldViewModifier(width: size.width + 5)

                Text("You'lle recieve email from us and can opt out anytime.")
                    .font(.caption) +
                Text("Learn more")
                    .font(.caption)
                    .foregroundStyle(.blue)
                VStack {
                    NavigationLink {
                        AddPassword(registrationVM: registrationVM)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Next")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: size.width - 25, height: 44)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                    }
                    Text("Sign up with Mobile Number")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: size.width - 25, height: 44)
                        .background(.white)
                        .foregroundStyle(Color(.darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
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
