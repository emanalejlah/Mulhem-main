//
//  privacy.swift
//  Molhem
//
//  Created by nura on 02/11/1444 AH.
//

import SwiftUI

struct privacy: View {
    var body: some View {
        
       VStack {
//            Text(" ")
//            Text("privacy policy")
//                .font(.largeTitle)
//                .padding(.top, 50)
//Spacer()
Text ("Welcome to the app Platform The Platform is provided and controlled by insight Pte. Ltd., with its registered address We are committed to protecting and respecting your privacy. This policy explains our practices concerning the personal data we collect from you, or that you provide to us. If you do not agree with this policy, you should not use the Platform.")
.foregroundColor(Color.black)
.font(.body)
.multilineTextAlignment(.leading)
.padding()
Spacer()
}.navigationTitle("privacy policy")
    }
}

struct privacy_Previews: PreviewProvider {
    static var previews: some View {
        privacy()
    }
}
