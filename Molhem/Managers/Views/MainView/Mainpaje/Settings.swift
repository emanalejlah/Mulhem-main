//
//  Settings.swift
//  Molhem
//
//  Created by nura on 02/11/1444 AH.
//

import SwiftUI

struct Settings: View {
    @Environment(\.openURL) var openURL

    var body: some View {
            VStack(alignment: .leading){

                ZStack {
                    
                    Form  {
                        Section {
                            HStack {
                                Image(systemName: "shield.righthalf.filled")
                                    .frame(width: 20.83, height: 25)
                                
                                    .foregroundColor(Color("Spectra"))
                                
                                
                                //                                    Text("Privacy and Security ")
                                //                                        .font(.system(size: 17, weight: .regular))
                                
                                Button("Privacy and Security ") {
                                    openURL(URL(string: "https://www.canva.com/design/DAFlIa0LntI/TI6NZub6CACbwRJLRp1zeA/edit?utm_content=DAFlIa0LntI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton")!)
                                } .foregroundColor(Color("Void"))
                                
                                
                               
                                
                            }
                            HStack{
                                Image(systemName: "hand.app.fill")
                                    .frame(width: 20.83, height: 25)
                                
                                    .foregroundColor(Color("Spectra"))
                                Button("Terms of Use") {
                                    openURL(URL(string: "https://www.canva.com/design/DAFlIbupkm4/Ai4m_Fj0WSYzvbz72Lq1HQ/edit?utm_content=DAFlIbupkm4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton")!)
                                    
                                } .foregroundColor(Color("Void"))
                                
                            }
                         

                                .font(.system(size: 17, weight: .regular))
//                                NavigationLink(destination:privacy()) {}
                           
                            
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                    .frame(width: 20.83, height: 25)

                                    .foregroundColor(Color("Spectra"))

                                Button("Contact Us") {
                                    openURL(URL(string: "mailto:molhem.qimma@gmail.com")!)
                                } .foregroundColor(Color("Void"))

                            }
                        }
                        
                        
                    }
                    
                }
                
                
            }
//        }.navigationViewStyle(.stack)
            .navigationTitle("Settings")
            
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
