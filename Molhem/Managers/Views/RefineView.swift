//
//  RefineView.swift
//  Molhem
//
//  Created by eman alejilah on 18/10/1444 AH.
//



import SwiftUI
import OpenAIKit
import UIKit
import Combine


struct RefineView: View {

    @State var customTextContent = ""
    @State var isActive = true
    @State var generatedIdea = ""
    @State var neededString = "refine"
    @State private var showLoader = false
    @State var myText: String = ""
    private let pastboard = UIPasteboard.general
    private let refine = ["Professional" , "Playful"]
    @State private var project: MenuOptionRefine? = nil

    
    @AppStorage("QuestionCount") var questionCount = 10
     let freeQuestionLimit = 10
    @StateObject var viewModel1 = SubViewModel()
    @State private var  showPaywall = false
    @State  var isSubscribed = false
    
    var body: some View {
        
        ScrollView{
            VStack {
          
                    
                Title(titletext: NSLocalizedString ("Refine", comment: ""))
                .accessibility(label: Text("Refine"))
                TextIdea(customTextContent: $customTextContent)

            Title(titletext:  NSLocalizedString ("Make it", comment: ""))
                .accessibility(label: Text("Make it"))

            DropdownMenu(
                selectedOption: self.$project, placholder: NSLocalizedString ("Make it", comment: ""), options: MenuOptionRefine.testAllMenu)
            .accessibility(label: Text("Make it"))
                
                VStack{
                    HStack{
                        Text("Refined text")
                            .accessibility(label: Text("Refined text"))
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
                    
                    if customTextContent.isEmpty || project == nil {
                        Text("Refine")
                            .accessibility(label: Text("Refined text"))
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
                            viewModel1.checkQuestionLimit()
                            viewModel1.askQuestion()
                        }) {
                            Text("Refine")
                                .accessibility(label: Text("Refined text"))
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 48)
                                .background(Color("Spectra"))
                                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        }
                        .disabled(!viewModel1.isSubscribed && questionCount == 0)
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
        }.navigationTitle("Refine")
            .accessibility(label: Text("Refined text"))
    }
    
    
    
    var testContent: some View {
        VStack(spacing: 20) {
            TextField("", text: $customTextContent)
                .textFieldStyle(.roundedBorder)
            
            Button {
                generateIdea()
            } label: {
                Text("Refine")
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
                
                prompts: [" Refine the folowing text \(customTextContent)  make it \(project?.option ?? "")"],
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct RefineView_Previews: PreviewProvider {
    static var previews: some View {
        RefineView()
    }
}
