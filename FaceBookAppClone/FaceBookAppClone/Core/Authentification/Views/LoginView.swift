//
//  LoginView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                
                let size = proxy.size
                VStack(spacing: 70) {
                    Spacer()
                    Image("Facebook_Circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                    VStack(spacing: 24) {
                        TextField("Mobile number or email address", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .customTextFieldViewModifier(width: size.width)
                        SecureField("Password", text: $viewModel.password)
                            .customTextFieldViewModifier(width: size.width)
                        Button(action: {}, label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: size.width - 30, height: 44)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        })
                        Text("Forgotten Password?")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    HStack { Spacer() }
                    Spacer()
                    VStack(spacing: 24) {
                        NavigationLink {
                            AddNameView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Create new account")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(width: size.width - 30, height: 44)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(.blue, lineWidth: 1)
                                }
                        }
                        
                        Button(action: {}, label: {
                            
                        })
                        HStack(spacing: 5) {
                            Image("meta")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 16)
                            Text("Meta")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(Color(.darkGray))
                    }
                }
                .background(Color(.systemGray5))
            }
        }
    }
}

