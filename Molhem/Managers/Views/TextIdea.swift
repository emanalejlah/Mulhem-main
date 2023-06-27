//
//  TextIdea.swift
//  Molhem
//
//  Created by Fatma Gazwani on 10/11/1444 AH.
//

import SwiftUI
//import UIKit

struct TextIdea: View {
    @Binding var customTextContent: String
    @State private var isEditing = false
    @State private var isShowingInfo = false

    var wordCount: String {
        let words = customTextContent.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.whitespacesAndNewlines)
            .prefix(101)
        let count = words.count == 1 ? 0 : words.count - 1
        let countString = count == 0 ? "0" : "\(count)"
        return "\(countString)/100"
    }
    

    var body: some View {
        VStack{
            ZStack(alignment: .trailing) {
                TextEditor(text: $customTextContent)
                    .foregroundColor(.gray)

                    .font(.body)
                    .padding(8)
                    .frame(height: 100)

                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Text(wordCount)
                                                .foregroundColor(wordCount == "100/100" ? .red : .gray)
                                                .font(.caption)
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 4)
                                        }
                                    }
                                }
                            )
                    )
                    .disabled(wordCount == "100/100")
                    .onTapGesture {
                        isEditing = true // Set the isEditing state variable to true when the user taps on the TextEditor
                    }
                    .overlay(
                        VStack {
                            HStack {
                                Text("Type here...")
                                    .foregroundColor(customTextContent.isEmpty && !isEditing ? .gray : .clear) // Show the placeholder text when there's no input and the user is not editing
                                    .font(.body)
                                    .padding(8)
                                    .opacity(customTextContent.isEmpty && !isEditing ? 1 : 0) // Show the placeholder text when there's no input and the user is not editing
                                Spacer()
                            }
                            Spacer()
                        }
                            .padding(.leading)
                            .padding(.top, 8)
                        , alignment: .topLeading
                    )
                
                    .overlay(
                        isShowingInfo ?
                            AnyView(Text("To get an accurate response make your sentence more than 3 words")
                                .font(.caption)
                                .padding()
                                .background(Color.white)
                                .frame(maxWidth: 300)
                                .opacity(0.8)
                                .cornerRadius(15)
                                .shadow(radius: 1)) :
                            AnyView(EmptyView())
                    )
                Button(action: {
                    isShowingInfo.toggle()
                }) {
                    Image(systemName: "info.circle")
                        .font(.title2)
                        .padding(.bottom, 60)
                        .padding(.trailing, 8)
                }
                .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                
            }
        }.padding(.bottom, 25)
            .padding(.horizontal, 16)
    }
}

struct TextIdea_Previews: PreviewProvider {
    static var previews: some View {
        TextIdea(customTextContent: .constant(""))
    }
}
