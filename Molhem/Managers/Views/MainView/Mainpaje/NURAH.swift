//
//  NURAH.swift
//  molhem
//
//  Created by nura on 25/10/1444 AH.
//

import SwiftUI
import FirebaseFirestore

struct NURAH: View {
    @StateObject var vm = ViewModel()

    let image: String
    let Shade: String
    let Dis: String
    
    var body: some View {
      
   
            
        ZStack{

                Rectangle()
                    .fill(Color(Shade))
                    .frame( height: 100)
                    .cornerRadius(8)
                    .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 2)
                    .padding(.horizontal, 24)
                    

                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 139, height: 104.5)
                    .offset(x: isIPad() ? 300 : 120, y: -30)

                
                VStack (alignment: .leading){
                    HStack{
                        Text("Hi")
                            .accessibility(label: Text("Hi"))
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        if let user = vm.user {
                            Text(user.name)

                                .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))

                        } else {
                            Text("")
                                .font(.title)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))

                        }

                    }
                    .onAppear {
                        vm.getData()
                        
                    }.padding(.horizontal, isIPad() ? 65: 50)
                    
                    HStack{
                        Text(Dis)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)

                            .font(.body)
                            .fontWeight(.semibold)
                        Spacer()
                        
                    }.padding(.horizontal, isIPad() ? 65: 50)

                }

            }.padding(.vertical, 40)
//        attach_file
//        Choose Files
//        tag_faces

    }
}

struct NURAH_Previews: PreviewProvider {
    static var previews: some View {
        NURAH(image: "NURA", Shade: "Matrix", Dis: """
              I’m Nura your AI companion
              wanna chat with me?
              """)
    }
}
