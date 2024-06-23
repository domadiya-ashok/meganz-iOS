//
//  AsyncRoundImage.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import SwiftUI

struct AsyncRoundImage: View {
    var imageUrl : URL
    var body: some View {
        AsyncImage(url:imageUrl) { status in
            if let img = status.image {
                img
                    .resizable()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.gray,lineWidth: 1)
                    }
            }else if status.error != nil {
                Image("AppIcon")
                // or
                //Text("An error from loading the image")
            }else {
                ProgressView()
            }
        }
    }
}

#Preview {
    AsyncRoundImage(imageUrl: URL(string: "https://apod.nasa.gov/apod/image/2406/AraDragons_Taylor_960.jpg")!)
}
