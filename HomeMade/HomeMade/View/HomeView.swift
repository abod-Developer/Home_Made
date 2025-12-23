//
//  HomeView.swift
//  HomeMade
//
//  Created by user1 on 11/06/1447 AH.
//

import SwiftUI

struct HomeView: View {
    let image = ["2","3","4","5","2","3","4","5"]

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("BackgroundColor"))
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(.images1)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .frame(width: 50, height: 50)
                    
                    Text("Hello, Abod")
                        .font(.headline)
                        .foregroundStyle(Color("MainColor"))
                        .padding(.horizontal, 8)
                    
                    Spacer()
                    
                    Button {
                        // action
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 24))
                            .foregroundStyle(Color(red: 0.8, green: 0.3, blue: 0.0))
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal,10)
                
                .padding()
                
                ScrollView(.vertical){
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(image, id: \.self) { item in
                                HStack(spacing:8){
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: 333,height: 150)
                                        .foregroundStyle(Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.8))
                                    
                                    
                                        .overlay {
                                            HStack {
                                                Image("\(item)")
                                                    .resizable()
                                                    .scaledToFit()
                                                //                                        .frame(width: 104,height: 104)
                                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                                Text("Spacial offer on Biryani Limited time")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .foregroundStyle(.orange)
                                                    .lineLimit(2)
                                                    .multilineTextAlignment(.center)
                                            }
                                            .padding(.vertical,10)
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack{
                        Text("Stores")
                            .foregroundStyle(Color.color)
                        Spacer()
                    }
                    .padding()
                    //
                    Stores()
                        .scrollIndicators(.hidden)
                    
                    
                    Spacer()
                        .padding()
                    //
                    ProudectView()
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal)
                .background(Color("BackgroundColor"))
                
            }
            
        }
        
       
    }
}

#Preview {
    HomeView()
}
