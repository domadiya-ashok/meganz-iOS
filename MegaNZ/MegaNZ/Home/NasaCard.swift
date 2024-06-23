//
//  PictureCard.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import SwiftUI

struct NasaCard: View {
    var nasa : Nasa
    var body: some View {
        HStack {
            // Image loading from object url.
            AsyncRoundImage(imageUrl: nasa.imageURL!)
                .frame(width: 80,height: 80)
            // title and date
            ZStack(alignment:.bottom){
                VStack(alignment:.leading) {
                    Text(nasa.title)
                        .font(.title3)
                        .bold()
                    Text("Captured on " + (nasa.dateString ?? "No date"))
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    NasaCard(nasa: mockData[0])
        .aspectRatio(3/2,contentMode: .fit)
}
