//
//  ReCreate.swift
//  Molhem
//
//  Created by Fatma Gazwani on 02/11/1444 AH.
//

import SwiftUI
import OpenAIKit
import UIKit

struct ReCreate: View {

    @State var customTextContent1 = ""
    @State var customTextContent2 = ""

    @State private var project: MenuOptionReCreate? = nil

    @State var isActive = true
    
    @State var generatedIdea = ""
    
    @State var neededString = "refine"
    
    @State private var showLoader = false

    @State var myText: String = ""
    private let pastboard = UIPasteboard.general
    private let refine = ["Professional" , "Playful"]

    @AppStorage("QuestionCount") var questionCount = 10
     let freeQuestionLimit = 10
    @StateObject var viewModel1 = SubViewModel()
    @State private var  showPaywall = false
    @State  var isSubscribed = false
    

    var body: some View {
        ScrollView{
            VStack {
 
                
                                   Title(titletext: NSLocalizedString ("About your business", comment: ""))
                                   .accessibility(label: Text("About your business"))
                                   TextIdea(customTextContent: $customTextContent1)
                      
                                   Title(titletext:  NSLocalizedString ("Your markiting goal", comment: "")) .accessibility(label: Text("Your Markiting goal"))
                                   TextIdea(customTextContent: $customTextContent2)

                                   Title(titletext: NSLocalizedString ("Make it", comment: ""))
                                   .accessibility(label: Text("Make it"))
                                   MenuReCreate(
                                       selectedOption: self.$project, placholder: NSLocalizedString ("Make it", comment: ""), options: MenuOptionReCreate.testAllMenu)
                                   .accessibility(label: Text("Make it"))

                               
                
                VStack{
                    HStack{
                        Text(NSLocalizedString ("ReCreated text", comment: ""))
                            .accessibility(label: Text("ReCreated text"))
                        
                            .font(.title3)
                            .bold()
                        Spacer()
                        Button {
                            pastboard.string = generatedIdea
                            hideKeyboard()

                        } label: {
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(.accentColor)
                                .padding(.trailing)
                        }
                    }.padding(.horizontal)
                        .padding(.bottom, 16)
                        .padding(.top, 50)


                    ZStack{
                        if showLoader {
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                        ScrollView {
                             VStack {
                                 Text(generatedIdea)
                                     .font(.system(size: 18))
                                     .multilineTextAlignment(.leading)
//                                     .lineLimit(nil)
                                     .opacity(generatedIdea == "" ? 0.75 : 1.0)
                                     .padding(8)
                                     .padding(.horizontal)
                                     .foregroundColor(.gray)
                                     .font(.system(size: 18))

                                       .lineLimit(nil)
                             }
                        }
                                
                    }.padding(.bottom, 50)
                }

                VStack{
                    
                    if customTextContent1.isEmpty || customTextContent2.isEmpty ||  project == nil{
                        Text("ReCreate")
                            .accessibility(label: Text("ReCreate"))
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 48)
                        
                            .background(Color("Mist"))
                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    } else {
                        Button(action: {
                            hideKeyboard()

                            generateIdea()
                            viewModel1.askQuestion()
                            viewModel1.checkQuestionLimit()
                        }) {
                            Text("ReCreate")
                                .accessibility(label: Text("ReCreate"))
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 48)
                            
                                .background(Color("Spectra"))
                                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        } .disabled(!viewModel1.isSubscribed && questionCount == 0)
                        
                        if !viewModel1.isSubscribed {
                            VStack {
                                Text("You Have Only \(questionCount)")
                                    .padding(.horizontal, 10)
                                    .foregroundColor(Color("Matrix"))
                                    .frame( height: 40)
                                
                            } .onAppear {
                                viewModel1.checkSubscriptionStatus()
                            }
                        }
                        
                        
                    }
                    
                }
            }
        }.navigationTitle("Create")
            .accessibility(label: Text("Create"))
    }
    
    
    
    var testContent: some View {
        VStack(spacing: 20) {
            TextField("", text: $customTextContent1)
                .textFieldStyle(.roundedBorder)
            
            Button {
                generateIdea()
            } label: {
                Text("ReCreate")
            }
            
            Text(generatedIdea)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
    
    
    
    func beginIdeaGeneration() async {
        do {
            showLoader = true
            let completion = try await openAIClient.completions.create(
                model: Model.GPT3.textDavinci003,
                
                prompts: ["My busniss is \(customTextContent1)   and i want a Your markiting text for \(customTextContent2),  make it \(project?.option ?? "")"],
                maxTokens: 200
                
                
            )
            generatedIdea = "\(completion.choices[0].text)".replacingOccurrences(of: "\n", with: " ")
            
            showLoader = false
        } catch {
            showLoader = false
            
        }
        showLoader = false
    }
    
    func generateIdea() {
        Task {
            await beginIdeaGeneration()
        }
        showLoader = true
    }
}




struct ReCreate_Previews: PreviewProvider {
    static var previews: some View {
        ReCreate()
    }
}
