//
//  GenderView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct GenderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var registrationVM: RegistrationViewModel

    init(registrationVM: RegistrationViewModel) {
        self._registrationVM = StateObject(wrappedValue: registrationVM)
    }

    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your gender?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("You can change who can see your gender on your profile later")
                    .font(.footnote)
                VStack(alignment: .leading, spacing: 24) {
                    ForEach(registrationVM.genderChoices, id: \.self) { choice in
                        Button(action: {
                            registrationVM.gender = choice
                        }, label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(choice)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    if choice == "More options" {
                                        Text("Select more options to choose another gender or rather not say")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(.darkGray))
                                            .padding(.trailing)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                Spacer()
                                
                                Circle()
                                    .stroke(registrationVM.gender == choice ? .blue : .gray , lineWidth: 1)
                                    .frame(width: 25, height: 25)
                                    .overlay {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(registrationVM.gender == choice ? .blue : .clear)
                                    }
                            }
                        })
                        
                    }
                }
                .padding(20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                NavigationLink {
                    AddEmail(registrationVM: registrationVM)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: size.width - 30, height: 44)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top)
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "arrow.backward")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            .padding()
            .background(Color(.systemGray5))
        }
        
    }
}
