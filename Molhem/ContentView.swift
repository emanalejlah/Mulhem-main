//
//  ContentView.swift
//  Molhem
//
//  Created by eman alejilah on 18/10/1444 AH.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        SaveNameView(vm: ViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//VStack{
//    SaveNameView(vm: ViewModel())
//}.onAppear {
//    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
//}
