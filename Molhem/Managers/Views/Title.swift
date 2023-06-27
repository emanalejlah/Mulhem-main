//
//  Title.swift
//  Molhem
//
//  Created by Fatma Gazwani on 10/11/1444 AH.
//

import SwiftUI

struct Title: View {
    let titletext: String

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(titletext)
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 16)
                //                .padding(.horizontal)
                    .padding(.top, 25)
                Spacer()
                    
            }.padding(.horizontal)
            }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(titletext: "I want")
    }
}
