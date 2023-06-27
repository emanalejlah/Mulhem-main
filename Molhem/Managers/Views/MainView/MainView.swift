//
//  MainView.swift
//  Molhem
//
//  Created by eman alejilah on 26/10/1444 AH.
//


import SwiftUI
import FirebaseFirestore

struct MainView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {



    NavigationView{
  
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: Settings(), label: {
                        Image("set")
                            .font(.title)
                            .padding(.horizontal)
                        
                    })
                }.padding()
                
                NavigationLink(destination: nn(), label: {
                    ZStack{
                    Rectangle()
                    .fill(Color("Spectra"))
                    .frame( height: 96)
                    .cornerRadius(8)
                    .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 2)
                    .padding(.horizontal, 24)

                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "crown.fill")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .foregroundColor(Color("Solar"))
                                                    .frame(width: 25, height: 25)
                                                    .padding(.horizontal)
                                                Text("VIP")
                                                    .foregroundColor(.white)
                                                    .font(.subheadline)
                                                    .fontWeight(.semibold)

                                                Spacer()
                                            }
                                            
                                            
                                            Text("Buy VIP to enjoy more privileges")
                                                .accessibility(label: Text("Buy VIP to enjoy more privileges"))
                                            
                                                .foregroundColor(.white)
                                                .font(.body)
                                                .fontWeight(.semibold)
                                            
                                        }.padding(.horizontal, isIPad() ? 65: 50)
                                        
                                        
                                        
                                        
                                    }.padding(.top,20)
        

                }
                )
                ScrollView{

                
         
                    ZStack{
                        NavigationLink(destination: ChatListView()) {
                            NURAH(image: "NURA", Shade: "Matrix", Dis:
//isIPad() ? "I’m Nura your AI companion wanna chat with me?":
                                    NSLocalizedString("    I’m Nura your AI companion wanna \n chat with me?", comment: "")
                                  
                                  
                  ).accessibility(label: Text("I’m Nura your AI companion wanna chat with me?"))
                        }//                        if let user = vm.user {
//                            Text(user.name)
////
//                                .multilineTextAlignment(.leading)
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 18, weight: .semibold))
//                                    .padding(.trailing, 90)
//                                    .offset(x: -60 , y: -22)
//                        } else {
//                            Text("")
//                                .font(.title)
//                                .foregroundColor(.white)
//                                .font(.system(size: 16, weight: .semibold))
//                                .padding(.bottom,100)
//                                .padding(.trailing,160)
//                        }
                    }
//                    .onAppear {
//                        vm.getData()
//                    }

                    NavigationLink(destination: GenerateView()) {
                        
                        MainViewComp(image: "04P", Shade: "Spectra", title: NSLocalizedString("Generate", comment: ""), Dis:
//                            isIPad() ? """
//                                     Generate Ideas using AI and  get inspiration from it
//                                     """:
                                        NSLocalizedString( " Generate Ideas using AI and get inspiration from it", comment: "")
                            ).accessibility(label: Text("Generate"))
                        .accessibility(label: Text("Generate Ideas using AI and get inspiration from it"))
                    }
                    
                    
                    NavigationLink(destination: ReCreate()) {
                        
                        MainViewComp(image: "03G", Shade: "Matrix", title: NSLocalizedString("Create", comment: ""), Dis:
//isIPad() ? "Make your ads better and recreate it with our AI":
NSLocalizedString("Make your ads better and recreate it with our AI", comment: "")
).accessibility(label: Text("Create"))
.accessibility(label: Text("Make your ads better and recreate it with our AI"))
                        
                    }
                   
                   
                    
                    NavigationLink(destination: RefineView()) {
                        
                        MainViewComp(image: "02P", Shade: "Spectra", title: NSLocalizedString("Refine", comment: ""), Dis:
//isIPad() ? "Refine your Ideas and touch up your sentences":
                                        NSLocalizedString("Refine your Ideas and touch up your sentences", comment: "")
).accessibility(label: Text("Refine"))
.accessibility(label: Text("Make your ads better and recreate it with our AI"))
                    }
                    
                    
                    
                    
                    
                    NavigationLink(destination: RefineView()) {
                        
                        MainViewComp(image: "01G", Shade: "Matrix", title: NSLocalizedString("About Saudi", comment: ""), Dis:
//isIPad() ? "Learn and get more info about Saudi Arabia":

                                        NSLocalizedString("Learn and get more info about Saudi Arabia", comment: "")).accessibility(label: Text("About Saudi"))
                            .accessibility(label: Text("Learn and get more info about Saudi Arabia"))
                    }



                    
                }
            }
            
        }.navigationViewStyle(.stack)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}






