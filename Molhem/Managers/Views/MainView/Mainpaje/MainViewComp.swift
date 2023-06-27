//
//  MainViewComp.swift
//  Molhem
//
//  Created by Fatma Gazwani on 04/11/1444 AH.
//

import SwiftUI

struct MainViewComp: View {
    let image: String
    let Shade: String
    let title: String
    let Dis: String

    
    var body: some View {
        VStack(alignment: .leading){
        ZStack{
        Rectangle()
        .fill(Color("Lumina"))
        .frame(height: 100)
        .cornerRadius(8)
        .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 2)

                    .padding(.horizontal, 24)
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color(Shade))
                            .frame(width: 169, height: 22)
                            .cornerRadius(18)
                        
                        
                        Text(title)
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.semibold)
                    } .offset(y: -50)

                    Spacer()
            

                }.padding(.horizontal, 36)
                       

                HStack{
                    Text(Dis)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Void"))
                        .font(.body)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Image(image)
                        .resizable()
                        .frame(width: 80, height: 90)
                        .offset(y: -30)
                }.padding(.horizontal, isIPad() ? 65: 50)
            }
         
        }
        .padding(.vertical, isIPad() ? 30: 20)
        

        
    }
}


func isIPad() -> Bool {
    #if targetEnvironment(macCatalyst)
    return false
    #else
    return UIDevice.current.userInterfaceIdiom == .pad
    #endif
}
struct MainViewComp_Previews: PreviewProvider {
    static var previews: some View {
        MainViewComp(image: "k", Shade: "Spectra", title: "Vision", Dis: """
        Get Inspired for Saudi Vision
        2030 projects
        """)
        }
        }
 

