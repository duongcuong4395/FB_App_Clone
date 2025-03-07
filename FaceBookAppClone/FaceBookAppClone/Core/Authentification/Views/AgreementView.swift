//
//  AgreementView.swift
//  FaceBookAppClone
//
//  Created by Macbook on 7/3/25.
//

import SwiftUI

struct AgreementView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            VStack(alignment: .leading, spacing: 28) {
                Text("Agree to Facebook's terms and policies")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("People who use our service may have uploaded your contact information to Facebook.")
                    .font(.caption) +
                Text("Learn more")
                    .font(.caption)
                    .foregroundStyle(.blue)
                Text("By tapping ")
                    .font(.caption) +
                Text("I agree")
                    .font(.caption)
                    .fontWeight(.bold) +
                Text(", you agree to create an account and to Facebook's ")
                    .font(.caption) +
                Text("terms, privacy Policy")
                    .font(.caption)
                    .foregroundStyle(.blue) +
                Text(" and ")
                    .font(.caption) +
                Text("Cookies Policy")
                    .font(.caption)
                    .foregroundStyle(.blue)
                Text("The ")
                    .font(.caption) +
                Text("Privacy Policy")
                    .font(.caption)
                    .foregroundStyle(.blue) +
                Text("describes the way we can use the information we collect when you create an account. For example, we use this information to provide, personalize and improve our products, including ads.")
                    .font(.caption)

                Button {

                } label: {
                    Text("I Agree")
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
                        .foregroundStyle(.blue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
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
