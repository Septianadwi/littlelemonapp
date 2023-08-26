//
//  SwiftUIView.swift
//  Onboarding
//
//  Created by Mac Pro on 15/08/23.
//

import SwiftUI

struct FlagView: View {
    @State private var isWaving = false
        
        var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 250, height: 150, alignment: .center)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 250, height: 150, alignment: .center)
                }
                .rotation3DEffect(.degrees(isWaving ? 50 : 0), axis: (x: -9, y: 5, z: 0))
                .mask(
                    Rectangle()
                        .frame(width: 250, height: 150)
                    
                )
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                    self.isWaving.toggle()
                }
            }
        }
    }

    struct ContentView: View {
        var body: some View {
            VStack {
                Text("Bendera Merah Putih")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                FlagView()
                    .frame(width: 250, height: 150)
            }
        }
    }
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView()
    }
}
