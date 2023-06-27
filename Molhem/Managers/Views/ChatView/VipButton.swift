//
//  VipButton.swift
//  Chat2
//
//  Created by Norah Abass AlOtaibi on 24/10/1444 AH.
//

import SwiftUI

struct VipButton: View {
    var body: some View {
        
        
        
        Button {

            } label: {
                
                ZStack{
                    Rectangle()
                        .fill(Color("Matrix"))
                        .frame(width: .infinity, height: 49)
//                        .shadow(color: Color(.lightGray), radius:3, x:0, y:2)
                    HStack{
                        
                        Image(systemName: "crown.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.yellow)
                            .frame(width: 19, height: 19)
                            .padding(.trailing)
                        Text("Buy VIP to enjoy more privileges")
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.semibold)

                    }
                   
                }
                
            

   } .frame( height: 33)

}
}
struct VipButton_Previews: PreviewProvider {
    static var previews: some View {
        VipButton()
    }
}
