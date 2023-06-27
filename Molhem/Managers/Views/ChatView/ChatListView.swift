//
//  ChatListView.swift
//  Molhem
//
//  Created by eman alejilah on 23/10/1444 AH.
//


import Dispatch

// Declare a variable to keep track of the last message timestamp

import SwiftUI

struct ChatListView: View {
//    @AppStorage("NameSwitch") var nameSwitch: Bool = false
    
    @State var currrentMessage = ""
    @State var isLoading = false {
        didSet {
            loadingUUID = nil
        }
    }
    
    
    @State var loadingUUID: UUID?
    @State var chats: [ChatModel] = []
    var lastMessageTimestamp: Date?
    @AppStorage("QuestionCount") var questionCount = 10
     let freeQuestionLimit = 10
    @StateObject var viewModel1 = SubViewModel()
    @State private var  showPaywall = false
    @State  var isSubscribed = false
  
    @State var showingHistory = false
    @Environment(\.presentationMode) private var presentationMode
//    @StateObject var viewModel1 = SubViewModel()
    @State var task: Task<Void, Never>?
    
    let tapGesture = TapGesture()
        .onEnded { _ in
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }

    var body: some View {
//        NavigationView {
            VStack {
                NavigationLink {
                    nn()
                } label: {
                    
                    if !viewModel1.isSubscribed {
                  
    //                        viewModel1.subscribe()
    //                        showPaywall.toggle()
                            
                     
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
                        }
                }

                    
//                    .fullScreenCover(isPresented: $showPaywall) {
//                        PaymentView()
//                    }
                

                
                ScrollView{
                                    VStack(spacing: 10) {
                                        ForEach(chats.indices, id: \.self) { index in
                                            let chat = chats[index]
                                            HStack {
                                                if !chat.isGPT {
                                                    Spacer()
                                                }
                                                if chat.isGPT {
                                                   Text("👩🏻")
                                                        .font(.headline)
//                                                    Image(systemName: "arrowshape.right.fill")
                                                 
                                                }
                                                VStack(alignment: .leading) {
                                                    Text(chat.message)
                                                        .padding()
                                                        .background(chat.isGPT ? Color("Mist") : Color("Spectra"))
                                                        .foregroundColor(chat.isGPT ? Color.black : Color.white)
                                                        .clipShape(RoundedRectangle(cornerRadius: 13.0, style: .continuous))
                                                        .listRowSeparator(.hidden)
                                                        .offset(x: chat.isGPT ? 0 : 25)
                                                    
                                                    Image(systemName: "arrowtriangle.down.fill")
                                                        .font(.title)
                                                        .foregroundColor(chat.isGPT ? Color("Mist") : Color.clear)
                                                        .rotationEffect(chat.isGPT ? .degrees(45) : .degrees(-45))
                                                        .offset(x: chat.isGPT ? -9 : 0, y: -16)
                                                }
                                                if !chat.isGPT {
                                                    Image(systemName: "arrowtriangle.down.fill")
                                                        .font(.title)
                                                        .foregroundColor(Color("Spectra"))
                                                        .rotationEffect(.degrees(-45))
                                                        .offset(y: 9)
                                                }
                                                if  chat.isGPT  {                                                   Spacer()
                                                }

                                            }
                                            .padding(.horizontal , 29)
                                           
                                            
                                        }
                                    }
                                }
                
                .scrollDismissesKeyboard(.interactively)
                .gesture(tapGesture)
              
                    HStack(spacing: 4) {
                        
                        Button(action: {
                            // handle button tap
                        }) {
                            HStack(spacing: 5) {
                             
                                
                                Image(systemName: "arrowshape.right.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 10, height: 9)
                                    .rotationEffect(Locale.current.language.languageCode?.identifier == "ar" ? Angle(degrees: 270) : Angle(degrees: 90))
                                //                                Text("3")
                                if !viewModel1.isSubscribed {
                                    Text("\(questionCount)")
                                        .foregroundColor(.white)
                                        .padding(.leading, 8)
                                }

                                
                               
                            }.onAppear {
                                viewModel1.checkSubscriptionStatus()
                                
                            }
                            .padding(EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                            .background(Color("Matrix"))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        TextField(isLoading ? ChatGPTHelper.MessagePlaceholder : "Type Here...", text: $currrentMessage)
                            .padding(.horizontal, 10)
                            .foregroundColor(Color("Void"))
                            .frame( height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        
                            .disabled(isLoading)
                        
                        HStack{
                            Button(action: {
                                sendMessage()
                                viewModel1.askQuestion()
                                viewModel1.checkQuestionLimit()
                            }) {
                                Image(systemName: "paperplane.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
//                                    .rotationEffect(Angle(degrees: 45))
                                    .rotationEffect(Locale.current.language.languageCode?.identifier == "ar" ? Angle(degrees: 135) : Angle(degrees: 45))
                                    .foregroundColor(currrentMessage.isEmpty ? Color("Photon") : Color("Spectra")) // Here's the modification
                                    .cornerRadius(13)
                            }
                            .disabled(!viewModel1.isSubscribed && questionCount == 0)
                            
//                            if !viewModel1.isSubscribed || questionCount > 0 {
                                //                            VStack {
                                //                               Text("You Have Only \(questionCount)")
                                //                            }
//                            }
                            
                            
                            
                            
                        }  .onAppear {
                            viewModel1.checkSubscriptionStatus()
                            
                        }
                        
                        
                        .buttonStyle(BorderlessButtonStyle())
                        .padding(4)
                    }
                    
                    
                    .padding(.horizontal, 6)
                    .padding(.vertical, 6)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                showingHistory = true
                            } label: {
                                Image(systemName: "clock")
//                                    .padding(.leading)
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                ChatGPTHelper.renew()
                                
                                chats = []
                                task?.cancel()
                            } label: {
                                Image(systemName: "arrow.clockwise")
                            }
                            
                        }
                        
                    }
                    
                    .fullScreenCover(isPresented: $showingHistory) {
                        HistoryChatView()
                    }
                 
                
            } .navigationTitle("Nura")
            .navigationBarTitleDisplayMode(.inline)
            
            .onAppear {
                viewModel1.checkSubscriptionStatus()
                
            }
        }
//    }
        func sendMessage() {
            if isLoading {
                task?.cancel()
    
                if task == nil || task!.isCancelled {
                    isLoading = false
    
                    if chats.last!.isGPT {
                        var last = chats.last!
                        last.message.append(ChatGPTHelper.ChatStopTips)
                        chats[chats.count-1] = last
                    } else {
                        chats.append(ChatModel(isGPT: true, message: ChatGPTHelper.ChatStopTips))
                    }
    
                    ChatProvider.shared.saveOrUpdate(chats.last!)
                }
            } else {
                isLoading = true
    
                chats.append(ChatModel(isGPT: false, message: currrentMessage))
                ChatProvider.shared.saveOrUpdate(chats.last!)
    
                currrentMessage = ""
                task = Task {
                    do {
                        let stream = try await ChatGPTHelper.api.sendMessageStream(text: chats.last?.message ?? "")
                        chats.append(ChatModel(isGPT: true, message: ChatGPTHelper.MessagePlaceholder))
                        loadingUUID = chats.last?.id
    
                        var last = chats.last!
    
                        for try await var line in stream {
                            if line.isEmpty || line == " " {
                                continue
                            }
    
                            if task == nil || task!.isCancelled {
                                break
                            }
    
                            if last.message == ChatGPTHelper.MessagePlaceholder {
                                last.message = ""
    
                                if line.starts(with: " ") {
                                    line.removeFirst()
                                }
                            }
    
                            last.message.append(line)
                            chats[chats.count-1] = last
                        }
                        isLoading = false
    
                        ChatProvider.shared.saveOrUpdate(chats.last!)
                    } catch {
                        if !chats.last!.isGPT {
                            chats.append(ChatModel(isGPT: true, message: "\(ChatGPTHelper.ChatErrorPrefix) [\(error.localizedDescription)]"))
                            isLoading = false
                        }
                    }
                }
            }
        }

}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}

