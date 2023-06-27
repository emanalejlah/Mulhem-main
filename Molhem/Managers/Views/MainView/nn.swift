//
//  nn.swift
//  Molhem
//
//  Created by eman alejilah on 17/11/1444 AH.
//
import SwiftUI
import RevenueCat

struct nn: View {
    @State private var alertTitle: String?
    @State private var alertMessage: String?
    @State private var showAlertView = false
    @State private var showLoader = true

    @State private var offerings: Offerings?
    @State private var isSubscribed = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.openURL) var openURL


    let packageTexts = [
        NSLocalizedString("Yearly", comment: ""),
        NSLocalizedString("Monthly", comment: ""),
        NSLocalizedString("Weekly", comment: "")
    ]


    var body: some View {
//        NavigationView {
            ScrollView {
                
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.clear,Color("Spectra").opacity(0.4)]),
                                   startPoint: .bottomLeading, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    
                    
                    Image("Q")
                        .resizable()
                        .frame(width: 128, height: 140)
                        .offset(x: 120, y: -180)
                    
                    Image("T")
                        .resizable()
                        .frame(width: 104.72, height: 111.75)
                        .offset(x: 80, y: -260)
                    Image("T")
                        .resizable()
                        .frame(width: 92, height: 92)
                        .offset(x: -40, y: -274)
                    Image("T")
                        .resizable()
                        .frame(width: 71.9, height: 71.9)
                        .offset(x: 0, y: -220)
                    
                    
                    
                    VStack {
                        Text("Revolutionize Your Communication with the  Ultimate AI Assistant")
                             
                            
                    
                            
                        
                        .foregroundColor(Color("Spectra"))
                        .font(.title)
                        .fontWeight(.semibold)
                        .offset(x: 0, y: 200)
                        .padding(.trailing)
                        
                        Text("Maximize Your Productivity with AI")
                            .foregroundColor(Color("Void"))
                            .font(.headline)
                            .fontWeight(.semibold)
                            .offset(x: 0, y: 220)
                            .padding(.trailing)
                        
                        VStack {
                            VIPoptions(opt:
                                        NSLocalizedString("Unlimited chats with Nura AI", comment: ""))
//                                .accessibility(label: Text("Unlimited chats with Nura AI")))
//
                            
                     
                            VIPoptions(opt:
                                        NSLocalizedString( "Unlimited access to AI tools", comment: ""))

                                
                        }
                        .padding(.vertical, 230)
                       .padding(.horizontal, -100)
                    }
                    
                    
                    VStack {
                        HStack {
                            if showLoader {
                                ProgressView()
                            } else {
                                if let packages = offerings?.current?.availablePackages {
                                    ForEach(packages.indices, id: \.self) { index in
                                        if let packageText = packageTexts.indices.contains(index) ? packageTexts[index] : nil {
                                            Button(action: {
                                                purchaseButtonTapped(index)
                                            }) {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(Color("Lumina"))
                                                        .frame(width: 105, height: 130)
                                                        .cornerRadius(20)
                                                        .shadow(color: Color(.lightGray), radius: 3, x: 0, y: 1)
                                                    
                                                    Rectangle()
                                                        .fill(Color("Lumina"))
                                                        .frame(width: 105, height: 130)
                                                        .cornerRadius(20)
                                                        .font(.caption2)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(Color("Mist"))
                                                        .overlay {
                                                            RoundedRectangle(cornerRadius: 18)
                                                                .stroke(Color("Matrix"), lineWidth: 2)
                                                        }
                                                    
                                                    VStack {
                                                        Text(packageText)
                                                        if let product = offerings?.current?.availablePackages[index] {
                                                            Text(getPriceText(for: product))
                                                            
                                                                .foregroundColor(Color("Void"))
                                                                .font(.caption)
                                                                .fontWeight(.semibold)
                                                            
                                                            
                                                                .foregroundColor(Color("Void"))
                                                                .font(.caption)
                                                                .fontWeight(.semibold)
                                                        }
                                                    }
                                                }
                                            }
                                            .offset(y: 400)
                                            .padding(.horizontal, 5)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        VStack{
                            Button(action: {
                                restorePurchases()
                            }) {
                                Text("Restore Purchases")
//                                    .font(.body)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.white)
//                                    .frame(width: 300, height: 48)
//                                    .background(Color("Spectra"))
//                                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                
                            }
                            
                            .padding(.top, 20)
                            .offset(y: 370)
                            
                        }
                        HStack{
                            Button("Privacy and Security") {
                                openURL(URL(string: "https://www.canva.com/design/DAFlIa0LntI/TI6NZub6CACbwRJLRp1zeA/edit?utm_content=DAFlIa0LntI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton")!)
                                    
                            }
                            .padding(.top, 20)
                            .offset(y: 350)
                        
                            Button(" | Terms of Use") {
                                openURL(URL(string: "https://www.canva.com/design/DAFlIbupkm4/Ai4m_Fj0WSYzvbz72Lq1HQ/edit?utm_content=DAFlIbupkm4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton")!)
                                
                            }
                        .padding(.top, 20)
                        .offset(y: 350)
                        }
                        VStack {
                            Text("Payment will be charged to your iTunes account at confirmation of purchase. Subscriptions will automatically renew unless auto-renew is turned off at least 24 hours before the end of the current period. Your account will be charged according to your plan for renewal within 24 hours prior to the end of the current period. You can manage or turn off auto-renew in your Apple ID account settings at any time after purchase.")
                                .foregroundColor(Color("Void"))
//                                .font(.title)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .padding()
                        } .padding(.top, 5)
                            .offset(y: 330)

                    }
                    .alert(isPresented: $showAlertView) {
                        Alert(title: Text(alertTitle ?? ""), message: Text(alertMessage ?? ""), dismissButton: .default(Text("OK")))
                    }
                    .onAppear {
                        checkSubscriptionStatus()
                        subscribe()
                    }
                
                }

                    .navigationTitle("VIP Subscription")
                    .navigationBarTitleDisplayMode(.inline)
     
            }
//        }
    }
        

    func checkSubscriptionStatus() {
        Purchases.shared.getCustomerInfo { purchaserInfo, error in
            if let error = error {
                handleFailure(with: error.localizedDescription)
                return
            }

            if let info = purchaserInfo {
                if info.entitlements["pro"]?.isActive == true {
                    print("Active")
                    self.isSubscribed = true
                }
            }
        }
    }

    func subscribe() {
        Purchases.shared.getOfferings { offerings, error in
            if let error = error {
                handleFailure(with: error.localizedDescription)
                return
            }

            self.offerings = offerings
            showLoader = false
        }
    }

    func purchaseButtonTapped(_ index: Int) {
        guard let packages = offerings?.current?.availablePackages else {
            return
        }

        guard index < packages.count else {
            return
        }

        let selectedPackage = packages[index]

        Purchases.shared.purchase(package: selectedPackage) { transaction, purchaserInfo, error, userCancelled in
            if let error = error {
                handleFailure(with: error.localizedDescription)
                return
            }

            if purchaserInfo?.entitlements["pro"]?.isActive == true {
                handleSuccess()
                checkSubscriptionStatus()
            }
        }
    }

    func restorePurchases() {
        showLoader = true

        Purchases.shared.restorePurchases { purchaserInfo, error in
            showLoader = false

            if let error = error {
                handleFailure(with: error.localizedDescription)
                return
            }

            if purchaserInfo?.entitlements["pro"]?.isActive == true {
                handleSuccess()
                checkSubscriptionStatus()
            } else {
                alertTitle = "⚠️ RESTORE FAILED"
                alertMessage = "No previous purchases found."
                showAlertView = true
            }
        }
    }

    func handleFailure(with errorMessage: String) {
        alertTitle = "❌ PURCHASE FAILED"
        alertMessage = "There was an error: \(errorMessage)"
        showAlertView = true
        showLoader = false
    }

    func handleSuccess() {
        alertTitle = "✅ PURCHASE SUCCESSFUL!"
        alertMessage = "You have unlimited access"
        showAlertView = true
        showLoader = false
    }

    func getPriceText(for package: Package) -> String {
             // Use RevenueCat's `localizedPriceString` to get the localized price string
             if let product = offerings?.current?.availablePackages.first(where: { $0.identifier == package.identifier }) {
                 return product.localizedPriceString
             }
             return ""
         }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        nn()
    }
}
