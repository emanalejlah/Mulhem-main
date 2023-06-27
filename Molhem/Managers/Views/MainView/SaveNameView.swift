//
//  SaveNameView.swift
//  Molhem
//
//  Created by eman alejilah on 25/10/1444 AH.
//

import SwiftUI

struct SaveNameView: View {
    @StateObject var vm: ViewModel
    @State private var name: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State var displayNameView: Bool = false
    
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
    
  
    @SceneStorage("hasLaunchedBefore") var sceneHasLaunchedBefore: Bool?
    
    var body: some View {
        Group {
            if !hasLaunchedBefore {
                NavigationView {
                    ZStack {
                        VStack(alignment: .center) {
                            Image("NURA")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .padding(.vertical)
                            Text("Hey I'M Nora")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Void"))
                            Text("What is your name?")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Void"))
                            TextField("Enter name", text: $name)
                                .padding(.horizontal)
                                .frame(width: 300, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("Matrix"), lineWidth: 1))
                                .padding(.bottom, 258)
                            
                            VStack {
                                if name.isEmpty {
                                    Text("Save")
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 48)
                                        .background(Color("Mist"))
                                        .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                } else {
                                    Button(action: {
                                        vm.addData(name: name)
                                        presentationMode.wrappedValue.dismiss()
                                        displayNameView.toggle()
                                    }) {
                                        Text("Save")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("Lumina"))
                                            .frame(width: 300, height: 48)
                                            .background(Color("Spectra"))
                                            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                    }
                                }
                            }
                        }
                        .onAppear {
                            if let sceneHasLaunchedBefore = sceneHasLaunchedBefore, sceneHasLaunchedBefore {
                                hasLaunchedBefore = true
                            } else {
                                sceneHasLaunchedBefore = true
                            }
                            
                            name = vm.user?.name ?? ""
                        }
                    }
                }
                .navigationViewStyle(.stack)
                .fullScreenCover(isPresented: $displayNameView) {
                    MainView()
                }
                .onDisappear {
                    UserDefaults.standard.set(hasLaunchedBefore, forKey: "hasLaunchedBefore")
                }
            } else {
                MainView()
            }
        }
    }
}
struct SaveNameView_Previews: PreviewProvider {
    static var previews: some View {
        SaveNameView(vm: ViewModel())
    }
}
