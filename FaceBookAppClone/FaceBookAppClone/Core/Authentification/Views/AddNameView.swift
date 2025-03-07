//
//  AddNameView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var registrationVM = RegistrationViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("Enter the name you use in real life")
                    .font(.footnote)
                HStack {
                    TextField("First name", text: $registrationVM.firstName)
                        .customTextFieldViewModifier(width: (size.width / 2) + 5)
                    Spacer()
                    TextField("First name", text: $registrationVM.familyName)
                        .customTextFieldViewModifier(width: (size.width / 2) + 5)
                }
                NavigationLink {
                    Text("Age View")
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width - 25, height: 44)
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
