//
//  MenuGenerate2.swift
//  Molhem
//
//  Created by Fatma Gazwani on 03/11/1444 AH.
//

import SwiftUI

struct MenuGenerate2: View {
    // Used to show or hide drop-down menu options
    @State private var isOptionsPresented: Bool = false
    // Used to bind user selection
    @Binding var selectedOption: MenuOptionGenerate2?
    
    let placholder: String
    let options: [MenuOptionGenerate2]
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isOptionsPresented.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption == nil ? placholder : selectedOption!.option)
                        .fontWeight(.medium)
                        .foregroundColor(selectedOption == nil ? .gray : Color("Void"))
                    Spacer()
                    Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .gray : Color("Void"))                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            }
            .padding(.horizontal)
            
            if self.isOptionsPresented {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 2) {
                        ForEach(options) { option in
                            Button(action: {
                                self.isOptionsPresented = false
                                self.selectedOption = option
                            }) {
                                Text(option.option)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(Color("Void"))

                                    .padding(.vertical, 5)
                                    .padding(.horizontal)

                            }

                        }
                    }
//                        .frame(height: CGFloat(self.options.count * 32) > 200 ? 50 : CGFloat(self.options.count * 32))
//                        .frame(width: 365)

//                        .padding(.vertical, 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                    }
                    .padding(.horizontal)

                }
            }
        }
        .padding(.bottom, self.isOptionsPresented ? CGFloat(self.options.count * 32) > 50 ? 0  : CGFloat(self.options.count * 32) : 0)
    }
}

struct MenuGenerate2_Previews: PreviewProvider {
    static var previews: some View {
        MenuGenerate2(selectedOption: .constant(nil), placholder: "Select Your project", options: MenuOptionGenerate2.testAllMenu)
            .accessibility(label: Text("Select Your project"))
    }
}
