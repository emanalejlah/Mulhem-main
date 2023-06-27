//
//  VIPoptions.swift
//  Molhem
//
//  Created by eman alejilah on 15/11/1444 AH.
//

import SwiftUI

struct VIPoptions: View {
    let opt: String


    var body: some View {
            
            HStack{
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("Spectra"))
                    .cornerRadius(13)
                Text(opt)
            
        }
        
        
    }
}

struct VIPoptions_Previews: PreviewProvider {
    static var previews: some View {
        VIPoptions(opt: "")
    }
}
