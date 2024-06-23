//
//  NasaDetail.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import SwiftUI

struct NasaDetail: View {
    var nasa : Nasa
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncRoundImage(imageUrl: nasa.hdImageURL!)
                    .frame(width: 300,height: 300)
                
                VStack(alignment: .leading, spacing:10) {
                    
                    Text(nasa.title)
                        .font(.title3)
                    HStack {
                        Text("© \(nasa.copyright ?? "None")")
                        Spacer()
                        Text(nasa.dateString!)
                    }
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    
                    Divider()
                    
                    Text("About \(nasa.title)")
                        .font(.title3)
                    
                    Text(nasa.explanation)
                    
                }
                .padding()
            }
            .navigationTitle(nasa.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NasaDetail(nasa: mockData[0])
}
