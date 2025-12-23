//
//  Stores.swift
//  HomeMade
//
//  Created by user1 on 25/06/1447 AH.
//

import SwiftUI

struct Stores: View {
    @State private var image = ["2","3","4","5","2","3","4","5"]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(image, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 71, height: 80)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundStyle(Color(.color))
                        }
                }
            }
        }
    }
}

#Preview {
    Stores()
}
