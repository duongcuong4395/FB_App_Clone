//
//  FriendCell.swift
//  FaceBookAppClone
//
//  Created by Macbook on 4/3/25.
//

import SwiftUI

struct FriendCell: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("profilePic3")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text("Tommy Shelby")
                    .font(.headline)
                    .fontWeight(.semibold)

                HStack {
                    Button {
                        
                    } label: {
                        Text("Confirm")
                            .foregroundStyle(.white)
                            .frame(width: 120, height: 32)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Delete")
                            .foregroundStyle(.black)
                            .frame(width: 120, height: 32)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}
