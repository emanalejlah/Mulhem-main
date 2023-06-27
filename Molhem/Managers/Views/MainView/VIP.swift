//
//  VIP.swift
//  Molhem
//
//  Created by eman alejilah on 17/11/1444 AH.
//


//import SwiftUI
//
//struct VIP: View {
//    @State private var didTap1 = false
//    @State private var didTap2 = false
//    @State private var didTap3 = false
//    var body: some View {
////        NavigationView {
//            
//            ScrollView{
//                
//                ZStack{
//                    LinearGradient(gradient: Gradient(colors: [Color.clear,Color("Spectra").opacity(0.4)]),
//                                   startPoint: .bottomLeading, endPoint: .topLeading)
//                    .edgesIgnoringSafeArea(.all)
//                    
//                    
//                    
//                    
//                    Image("Q")
//                        .resizable()
//                        .frame(width: 128, height: 140)
//                        .offset(x: 120, y: -180)
//                    
//                    Image("T")
//                        .resizable()
//                        .frame(width: 104.72, height: 111.75)
//                        .offset(x: 80, y: -260)
//                    Image("T")
//                        .resizable()
//                        .frame(width: 92, height: 92)
//                        .offset(x: -40, y: -274)
//                    Image("T")
//                        .resizable()
//                        .frame(width: 71.9, height: 71.9)
//                        .offset(x: 0, y: -220)
//                    
//                    
//                    
//                    //                        .padding(.leading,200)
//                    //                        .padding(.bottom)
//                    
//                    
//                    VStack{
//                        
//                        
//                        
//                        Text("""
//                             Revolutionize Your
//                             Communication with the
//                             Ultimate AI Assistant
//                            """)
//                            .foregroundColor(Color("Spectra"))
//                            .font(.title)
//                            .fontWeight(.semibold)                          //                            .padding(.top,100)
//                            .offset(x: 0, y: 200)
//                            .padding(.trailing)
//                        
//                        
//                        //                            .padding(.trailing,50)
//                        //                            .padding(.bottom,10)
//                        
//                        Text("Maximize Your Productivity with AI")
//                            .foregroundColor(Color("Matrix"))
//                            .font(.headline)
//                            .fontWeight(.semibold)                              .offset(x: 0, y: 220)
//                            .padding(.trailing)
//                        
//                        
//                        
//                        
//                        Text("""
//-Unlimited Chat
//-Advanced Lab Features
//-Experience Ad-Free
//-Distraction-Free
//""")
//                            .font(.body)
//                            .fontWeight(.semibold)                            .offset(x: 20, y: 250)
//                        VStack{
//                            HStack{
//                                Button {
//                                    didTap1.toggle()
//                                    didTap2 = false
//                                    didTap3 = false
//                                    
//                                } label: {
//                                    if didTap1 == false{
//                                        ZStack{
//                                            
//                                            RoundedRectangle(cornerRadius: 8)
//                                            
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                            //                                .background(Color("B"))
//                                            
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                            
//                                            
//                                            Rectangle()
//                                            
//                                                .fill(Color("Mist"))
//                                                .frame(width: 90, height: 20)
//                                                .cornerRadius(18)
//                                                .padding(.bottom,130)
//                                            Text("Cost-effective")
//                                                .foregroundColor(.white)
//                                                .font(.caption2)
//                                                .fontWeight(.semibold)                                                .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Yearly")
//                                                    .foregroundColor(Color("Mist"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("99.99 SAR")
//                                                    .font(.body)
//                                                    .fontWeight(.heavy)                                                    .foregroundColor(Color("Mist"))
//                                                Text("SAR 857.99 ")
//                                                    .strikethrough()
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                      .foregroundColor(Color("Mist"))
//                                                Text("SAR 0.27 per day ")
//                                                    .strikethrough()
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                      .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    } else{
//                                        ZStack{
//                                            
//                                            Rectangle()
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                                .overlay {
//                                                    RoundedRectangle(cornerRadius: 20)
//                                                        .stroke(Color("Matrix"), lineWidth: 2)
//                                                        
//                                                }
//                                            
//                                            
//                                            Rectangle()
//                                            
//                                                .fill(Color("Matrix"))
//                                                .frame(width: 90, height: 20)
//                                                .cornerRadius(18)
//                                                .padding(.bottom,130)
//                                            Text("Cost-effective")
//                                                .foregroundColor(.white)
//                                                .font(.caption2)
//                                                .fontWeight(.semibold)                                                  .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Yearly")
//                                                    .foregroundColor(Color("Matrix"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("99.99 SAR")
//                                                    .font(.headline)
//                                                    .fontWeight(.heavy)                                                      .foregroundColor(Color("Matrix"))
//                                                Text("SAR 857.99 ")
//                                                    .strikethrough()
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                    .foregroundColor(Color("Mist"))
//                                                Text("SAR 0.27 per day ")
//                                                    .strikethrough()
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                      .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    }
//                                }
//                                Button {
//                                    didTap2.toggle()
//                                    didTap1 = false
//                                    didTap3 = false
//                                    
//                                    
//                                } label: {
//                                    if didTap2 == false{
//                                        ZStack{
//                                            
//                                            Rectangle()
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                            
//                                            
//                                            //                            Rectangle()
//                                            //
//                                            //                                .fill(Color("G"))
//                                            //                                .frame(width: 90, height: 20)
//                                            //                                .cornerRadius(18)
//                                            //                                .padding(.bottom,130)
//                                            //                            Text("Cost-effective")
//                                            //                                .foregroundColor(.white)
//                                            //                                .font(.system(size: 10, weight: .semibold))
//                                            //                                .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Monthly")
//                                                    .foregroundColor(Color("Mist"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("SAR 39.99 ")
//                                                    .font(.body)
//                                                    .fontWeight(.heavy)                                                    .foregroundColor(Color("Mist"))
//                                                Text("SAR 70.57 ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                      .foregroundColor(Color("Mist"))
//                                                Text("SAR 1.33 per day ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.system(size: 10, weight: .semibold))
//                                                    .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    } else{
//                                        ZStack{
//                                            
//                                            Rectangle()
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                                .overlay {
//                                                    RoundedRectangle(cornerRadius: 20)
//                                                        .stroke(Color("Matrix"), lineWidth: 2)
//                                                        
//                                                }
//                                            
//                                            
//                                            //                            Rectangle()
//                                            //
//                                            //                                .fill(Color("B"))
//                                            //                                .frame(width: 90, height: 20)
//                                            //                                .cornerRadius(18)
//                                            //                                .padding(.bottom,130)
//                                            //                            Text("Cost-effective")
//                                            //                                .foregroundColor(.white)
//                                            //                                .font(.system(size: 10, weight: .semibold))
//                                            //                                .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Monthly")
//                                                    .foregroundColor(Color("Matrix"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("SAR 39.99 ")
//                                                    .font(.body)
//                                                    .fontWeight(.heavy)                                                     .foregroundColor(Color("Matrix"))
//                                                Text("SAR 70.57 ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                                Text("SAR 1.33 per day ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    }
//                                }
//                                Button {
//                                    didTap3.toggle()
//                                    didTap1 = false
//                                    didTap2 = false
//                                    
//                                } label: {
//                                    if didTap3 == false{
//                                        ZStack{
//                                            
//                                            Rectangle()
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                            
//                                            
//                                            //                            Rectangle()
//                                            //
//                                            //                                .fill(Color("G"))
//                                            //                                .frame(width: 90, height: 20)
//                                            //                                .cornerRadius(18)
//                                            //                                .padding(.bottom,130)
//                                            //                            Text("Cost-effective")
//                                            //                                .foregroundColor(.white)
//                                            //                                .font(.system(size: 10, weight: .semibold))
//                                            //                                .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Weekly")
//                                                    .foregroundColor(Color("Mist"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("SAR 12.99 ")
//                                                    .font(.body)
//                                                    .fontWeight(.heavy)                                                     .foregroundColor(Color("Mist"))
//                                                Text("SAR 16.24 ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                    .foregroundColor(Color("Mist"))
//                                                Text("SAR 1.86 per day ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    } else{
//                                        ZStack{
//                                            
//                                            Rectangle()
//                                                .fill(Color("Lumina"))
//                                                .frame(width: 105, height: 130)
//                                                .cornerRadius(20)
//                                                .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//                                                .overlay {
//                                                    RoundedRectangle(cornerRadius: 20)
//                                                        .stroke(Color("Matrix"), lineWidth: 2)
//                                                        
//                                                }
//                                            
//                                            //
//                                            //                            Rectangle()
//                                            //
//                                            //                                .fill(Color("B"))
//                                            //                                .frame(width: 90, height: 20)
//                                            //                                .cornerRadius(18)
//                                            //                                .padding(.bottom,130)
//                                            //                            Text("Cost-effective")
//                                            //                                .foregroundColor(.white)
//                                            //                                .font(.system(size: 10, weight: .semibold))
//                                            //                                .padding(.bottom,127)
//                                            //.padding(.trailing,160)
//                                            VStack{
//                                                Text("Weekly")
//                                                    .foregroundColor(Color("Matrix"))
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                Text("SAR 12.99 ")
//                                                    .font(.body)
//                                                    .fontWeight(.heavy)                                                     .foregroundColor(Color("Matrix"))
//                                                Text("SAR 16.24 ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                                Text("SAR 1.86 per day ")
//                                                    .strikethrough()
//                                                
//                                                    .font(.caption2)
//                                                    .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                            }
//                                        }
//                                    }
//                                }
//                                
//                                
//                                
//                                
//                            }
//                        }  .offset(x: 1, y: 280)
//                        
//                        
//                        
//                        //                    Text("Advanced Lab Features")
//                        //                        .padding(.trailing,90)
//                        //                        .padding(.bottom,2)
//                        //
//                        //                    Text("Experience Ad-Free ")
//                        //                        .padding(.trailing,90)
//                        //                        .padding(.bottom,2)
//                        //
//                        //                    Text("Distraction-Free ")
//                        //                        .padding(.trailing,90)
//                        //                        .padding(.bottom,2)
//                        
//                        
//                        //                    Button action: {
//                        //                    self.didTap = true
//                        //                    } {
//                        //                    Text ("My custom button")
//                        //                    •font (.system (size: 24))
//                        //                    }
//                        //                    .frame (width: 300, height: 75, alignment: center)
//                        //                    •padding (.all, 20)
//                        //                    .background (didTap ? Color.blue : Color.yellow)
//                        //                    }
//                        //                    }
//                        //
//                        
//                        //                    Button (action: {
//                        //                        self.didTap = true
//                        //                    }) {
//                        //                    Text ("My custom button")
//                        //                            .font (.system (size: 24))
//                        //                    }
//                        //                    .frame (width: 300, height: 75, alignment: .center)
//                        //                    .padding (.all, 20)
//                        //                    .background (didTap ? Color.blue : Color.yellow)
//                        //                    }
//                        Button {
//                            
//                        } label: {
//                            
//                            ZStack{
//                                Rectangle()
//                                    .fill(Color("Spectra"))
//                                    .frame(width: 300, height: 47)
//                                    .cornerRadius(8)
//                                Text("Buy Now")
//                                    .foregroundColor(.white)
//                                    .font(.title2)
//                                    .fontWeight(.medium)
//                            }.offset(x: 1, y: 90)}.padding(.top,200)
//                        Button {
//                            
//                        } label: {
//                            
//                            ZStack{
//                                
//                                Text("Restore")
//                                    .underline()
//                                    .foregroundColor(Color("Matrix"))
//                                    .font(.body)
//                                    .fontWeight(.medium)                             }.offset(x: 1, y: 90)}
//                        
//                    }
////                    }.navigationTitle("VIP Subscription")
////                        .navigationBarTitleDisplayMode(.inline)
////
//                    //                        .navigationBarItems(
//                    //                            leading: NavigationLink(destination: VIP(), label: {Image(systemName: "chevron.left");Text("Back")}),
//                    //                            trailing: Text(""))
//                    //                        .accentColor(Color("B"))
//                    
//                    
//                
//                
//            }.navigationTitle("VIP Subscription")
//                .navigationBarTitleDisplayMode(.inline)
//                
////            }
////            .ignoresSafeArea(.all)
//
//        }
//    }
//}
//
//struct VIP_Previews: PreviewProvider {
//    static var previews: some View {
//        VIP()
//    }
//}
