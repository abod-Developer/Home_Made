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
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Color("BackgroundColor"))
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        NavigationLink{
                            ProfileView()
                            
                        }label: {
                            Image(.images1)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .frame(width: 50, height: 50)
                                .shadow(radius: 7)
                            
                            Text("Hello, Abod")
                                .font(.headline)
                                .foregroundStyle(Color(.color))
                                .padding(.horizontal, 8)
                        }
                        
                        
                        Spacer()
                        
                        Button {
                            // action
                            
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .font(.system(size: 24))
                                .foregroundStyle(Color(.color))
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.horizontal,10)
                    
                    .padding()
                    
                    ScrollView(.vertical){
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(image, id: \.self) { item in
                                    HStack(spacing:8){
                                        RoundedRectangle(cornerRadius: 30)
                                            .frame(width: 333,height: 150)
                                            .foregroundStyle(.white)
                                            .shadow(color: Color(.color),radius: 6)
                                        
                                        
                                        
                                            .overlay {
                                                HStack{
                                                    Image("\(item)")
                                                        .resizable()
                                                        .scaledToFit()
                                                    //                                        .frame(width: 104,height: 104)
                                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                                    Text("Spacial offer on Biryani Limited time")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.regular)
                                                        .foregroundStyle(.black)
                                                        .lineLimit(2)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(.vertical,10)
                                            }
                                            .padding(.vertical,5)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical,5)
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
                            .padding(5)
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
}

#Preview {
    HomeView()
}
