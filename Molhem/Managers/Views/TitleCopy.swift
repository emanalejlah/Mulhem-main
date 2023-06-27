//
//  TitleCopy.swift
//  Molhem
//
//  Created by Fatma Gazwani on 10/11/1444 AH.
//

import SwiftUI

struct TitleCopy: View {
    @State var generatedIdea = ""
    private let pastboard = UIPasteboard.general
    let finaltitle: String
    

    var body: some View {
        HStack{
            Text(finaltitle)
                .font(.title3)
                .bold()
            Spacer()
            Button {
                pastboard.string = generatedIdea
                hideKeyboard()
                
            } label: {
                Image(systemName: "doc.on.doc")
                    .foregroundColor(.accentColor)
                    .padding(.trailing)
            }
        }.padding(.horizontal)
            .padding(.bottom, 16)
            .padding(.top, 50)
        
    }
}

struct TitleCopy_Previews: PreviewProvider {
    static var previews: some View {
        TitleCopy(finaltitle:"Refined text")
    }
}
