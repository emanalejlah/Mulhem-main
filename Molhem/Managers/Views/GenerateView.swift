//
//  StimulateView.swift
//  Molhem
//
//  Created by eman alejilah on 18/10/1444 AH.
//



import SwiftUI
import OpenAIKit


struct GenerateView: View {
    private let pastboard = UIPasteboard.general

    @State var generatedIdea = ""
    @State var neededString = "app"
    @State var forAString = "name"
    @State var customTextContent = ""
    @State var customTextContent1 = ""
    @State private var showLoader = false
    
    
    @AppStorage("QuestionCount") var questionCount = 10
     let freeQuestionLimit = 10
    @StateObject var viewModel1 = SubViewModel()
    @State private var  showPaywall = false
    @State  var isSubscribed = false
    
 
//    private let nameOrIdea = ["idea", "name"]
//    private let nameChoices = ["app", "business",  "place","website"]
//
//    private let ideaChoices = [ "app", "art", "book", "business", "game", "gift",  "product", "restaurant", "show", "social media post", "video", "website"]
    
//    private let ideaChoices = [""]
    @State private var project1: MenuOptionGenerate1? = nil
    @State private var project2: MenuOptionGenerate2? = nil


    var body: some View {
     
        ScrollView{
            VStack {
                Title(titletext: NSLocalizedString ("I want", comment: "")).accessibility(label: Text("I want"))
                MenuGenerate1(
                    selectedOption: self.$project1, placholder: NSLocalizedString ("I want", comment: ""), options: MenuOptionGenerate1.testAllMenu)
                .accessibility(label: Text("I want"))
                Title(titletext: NSLocalizedString ("For", comment: "")).accessibility(label: Text("For"))
//                TextIdea(customTextContent: $customTextContent1)
                MenuGenerate2(
                    selectedOption: self.$project2, placholder: NSLocalizedString ("For", comment: ""), options: MenuOptionGenerate2.testAllMenu)
                .accessibility(label: Text("For"))
                
                Title(titletext: NSLocalizedString ("That", comment: ""))
                .accessibility(label: Text("That"))
            TextIdea(customTextContent: $customTextContent)
                VStack{
                    HStack{
                        Text("Generated text")
//                            .accessibility(label: Text("Refined text"))
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
                
                
                if customTextContent.isEmpty
//                    ||  customTextContent.isEmpty
                    || project1 == nil
                ||  project2 == nil
                {
                    Text("Generate")
                        .accessibility(label: Text("Generate"))
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 48)
                    
                        .background(Color("Mist"))
                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                } else {
                    Button(action: {
                        generateIdea()
                        hideKeyboard()
                        viewModel1.askQuestion()
                        viewModel1.checkQuestionLimit()
                        
                    }) {
                        Text("Generate")
                  
                            .accessibility(label: Text("Generate"))
                        
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
   
            }.navigationTitle("Genetate")
        }
//            if showLoader {
//                ProgressView()
//                    .progressViewStyle(.circular)
//            }

    }

    var testContent: some View {
        VStack(spacing: 20) {
            TextField("", text: $customTextContent)
              .textFieldStyle(.roundedBorder)
            
            Button {
                generateIdea()
            } label: {
               Text("generate Idea")
                    .accessibility(label: Text("generate Idea"))
            }
            
            Text(generatedIdea)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
    
    var background: some View {
        Text("hey")

    }

    func beginIdeaGeneration() async {
        do {
            showLoader = true
            let completion = try await openAIClient.completions.create(
                model: Model.GPT3.textDavinci003,
                
                prompts: ["Give me \(project1?.option ?? "") for \(project2?.option ?? "") that \(customTextContent1)"],

                maxTokens: 200
            )
            generatedIdea = "\(completion.choices[0].text)".replacingOccurrences(of: "\n", with: " ")

            showLoader = false
        } catch {
            showLoader = false

        }
        showLoader = false
    }
//
    func generateIdea() {
        Task {
            await beginIdeaGeneration()
        }
        showLoader = true
    }
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
