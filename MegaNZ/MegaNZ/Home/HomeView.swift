//
//  HomeView.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var nasaModel = NasaModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(nasaModel.nasa) { nasa in
                    NavigationLink{
                        NasaDetail(nasa: nasa)
                    } label: {
                        NasaCard(nasa: nasa)
                    }
                }
            }
            .navigationTitle("MegaNZ")
        }
        .onAppear {
            Task {
                await nasaModel.fetchData()
            }
        }
    }
}

#Preview {
    HomeView(nasaModel: NasaModel())
}
