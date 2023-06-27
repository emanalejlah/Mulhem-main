//
//  HistoryChatView.swift
//  Molhem
//
//  Created by eman alejilah on 23/10/1444 AH.
//

import SwiftUI

struct HistoryChatView: View {
    @State var chats: [ChatModel] = []
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        NavigationStack {
            List {
                if chats.isEmpty {
                    Text("No chat history available at the moment")
                } else {
                    ForEach(chats) { chat in
                        Text("\(chat.isGPT ? "👩🏻" : "")：\(chat.message)")
                            .bold(!chat.isGPT)
                            .foregroundColor(chat.isGPT ? Color("Void") : Color("Matrix"))
                            .contextMenu {
                                Button {
                                    UIPasteboard.general.string = chat.message
                                } label: {
                                    Label("copy", systemImage: "doc.on.doc.fill")
                                }
                            }
                    }
                    .onDelete { indexSet in
                        ChatProvider.shared.remove(indexSet)
                    }
                }
            }
            .navigationTitle("Chat History")
            .onAppear {
                chats = ChatProvider.shared.search()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        ChatProvider.shared.clear()
                        chats = ChatProvider.shared.search()
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundColor(Color.accentColor)
                    }
                    .toolbar{
                      ToolbarItem(placement: .navigationBarLeading){
                          Button {
                              presentationMode.wrappedValue.dismiss()
                          } label: {
                              Image(systemName: "x.circle.fill")
                                  .resizable()
                                  .frame(width: 25, height: 25)
                                  .foregroundColor(Color("Matrix"))
                                  .cornerRadius(13)
                          }
                          
                      }
                  }
                }
                
                
            }
        }
    }
}

struct HistoryChatView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryChatView()
    }
}

