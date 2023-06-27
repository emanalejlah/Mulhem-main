//
//  PaymentView.swift
//  Molhem
//
//  Created by eman alejilah on 14/11/1444 AH.
//


//import SwiftUI
//import RevenueCat
//
//struct PaymentView: View {
//    @State private var alertTitle: String?
//    @State private var alertMessage: String?
//    @State private var showAlertView = false
//    @State private var showLoader = true
//
//    @State private var offerings: Offerings?
//    @State private var isSubscribed = false
//    @Environment(\.presentationMode) private var presentationMode
//
//    let packageTexts = [
//        """
//        Yearly
//        549,99 SR
//        """,
//        """
//        Monthly
//        49,99 SR
//        """,
//        """
//        Weekly
//        14,99 SR
//        """
//    ]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                ZStack {
//                    Image("Image1")
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
//
//                    VStack {
//                        Text("""
//                            Revolutionize Your
//                            Communication with the
//                            Ultimate AI Assistant
//                            """)
//                            .foregroundColor(Color("Spectra"))
//                            .font(.title)
//                            .fontWeight(.semibold)
//                            .offset(x: 0, y: 200)
//                            .padding(.trailing)
//
//                        Text("Maximize Your Productivity with AI")
//                            .foregroundColor(Color("Matrix"))
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                            .offset(x: 0, y: 220)
//                            .padding(.trailing)
//
//                        VStack {
//                            VIPoptions(opt: "Unlimited chats with Nura AI")
//                            VIPoptions(opt: "Unlimited access to AI tools")
//                        }
//                        .padding(.vertical, 230)
//                        .padding(.horizontal, -100)
//                    }
//                    .padding(.vertical, -400)
//
//                    VStack {
//                        HStack {
//                            if showLoader {
//                                ProgressView()
//                            } else {
//                                if let packages = offerings?.current?.availablePackages {
//                                    ForEach(packages.indices, id: \.self) { index in
//                                        if let packageText = packageTexts.indices.contains(index) ? packageTexts[index] : nil {
//                                            Button(action: {
//                                                purchaseButtonTapped(index)
//                                            }) {
//                                                ZStack {
//                                                    RoundedRectangle(cornerRadius: 8)
//                                                        .fill(Color("Lumina"))
//                                                        .frame(width: 105, height: 130)
//                                                        .cornerRadius(20)
//                                                        .shadow(color: Color(.lightGray), radius: 3, x: 0, y: 1)
//
//                                                    Rectangle()
//                                                        .fill(Color("Lumina"))
//                                                        .frame(width: 105, height: 130)
//                                                        .cornerRadius(20)
//                                                        .font(.caption2)
//                                                        .fontWeight(.semibold)
//                                                        .foregroundColor(Color("Mist"))
//                                                        .overlay {
//                                                            RoundedRectangle(cornerRadius: 18)
//                                                                .stroke(Color("Matrix"), lineWidth: 2)
//                                                        }
//
//                                                    VStack {
//                                                        if let product = offerings?.current?.availablePackages[index] {
//                                                            Text(getPriceText(for: product))
//                                                                .foregroundColor(Color("Void"))
//                                                                .font(.caption)
//                                                                .fontWeight(.semibold)
//
//                                                            Text(packageText)
//                                                                .foregroundColor(Color("Void"))
//                                                                .font(.caption)
//                                                                .fontWeight(.semibold)
//                                                        }
//                                                    }
//                                                }
//                                            }
//                                            .offset(y: 200)
//                                            .padding(.horizontal, 5)
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                        .padding()
//
//                        if isSubscribed {
//                            Text("You are subscribed!")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .padding(.top, 20)
//                        } else {
//                            Button(action: {
//                                restorePurchases()
//                                checkSubscriptionStatus()
//                            }) {
//                                Text("Restore Purchases")
//                                    .font(.body)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("Lumina"))
//                                    .frame(width: 300, height: 48)
//                                    .background(Color("Spectra"))
//                                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                            }
//                            .padding(.top, 20)
//                            .offset(y: 200)
//                        }
//                    } .onAppear {
//                        checkSubscriptionStatus()
//
//                        subscribe()
//                    }
//                }
//                .alert(isPresented: $showAlertView) {
//                    Alert(title: Text(alertTitle ?? ""), message: Text(alertMessage ?? ""), dismissButton: .default(Text("OK")))
//                }
//                .onAppear {
//                    checkSubscriptionStatus()
//
//                    subscribe()
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button {
//                            presentationMode.wrappedValue.dismiss()
//                        } label: {
//                            Image(systemName: "x.circle.fill")
//                                .resizable()
//                                .frame(width: 25, height: 25)
//                                .foregroundColor(Color("Matrix"))
//                                .cornerRadius(13)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("VIP Subscription")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//
//    func checkSubscriptionStatus() {
//        Purchases.shared.getCustomerInfo { purchaserInfo, error in
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            if let info = purchaserInfo {
//                if info.entitlements["pro"]?.isActive == true {
//                    print("Active")
//                    self.isSubscribed = true
//                }
//            }
//        }
//    }
//
//    func subscribe() {
//        Purchases.shared.getOfferings { offerings, error in
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            self.offerings = offerings
//            showLoader = false
//        }
//    }
//
//    func purchaseButtonTapped(_ index: Int) {
//        guard let packages = offerings?.current?.availablePackages else {
//            return
//        }
//
//        guard index < packages.count else {
//            return
//        }
//
//        let selectedPackage = packages[index]
//
//        Purchases.shared.purchase(package: selectedPackage) { transaction, purchaserInfo, error, userCancelled in
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            if purchaserInfo?.entitlements["pro"]?.isActive == true {
//                handleSuccess()
//                checkSubscriptionStatus()
//            }
//        }
//    }
//
//    func restorePurchases() {
//        showLoader = true
//
//        Purchases.shared.restorePurchases { purchaserInfo, error in
//            showLoader = false
//
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            if purchaserInfo?.entitlements["pro"]?.isActive == true {
//                handleSuccess()
//                checkSubscriptionStatus()
//            } else {
//                alertTitle = "⚠️ RESTORE FAILED"
//                alertMessage = "No previous purchases found."
//                showAlertView = true
//            }
//        }
//    }
//
//    func handleFailure(with errorMessage: String) {
//        alertTitle = "❌ PURCHASE FAILED"
//        alertMessage = "There was an error: \(errorMessage)"
//        showAlertView = true
//        showLoader = false
//    }
//
//    func handleSuccess() {
//        alertTitle = "✅ PURCHASE SUCCESSFUL!"
//        alertMessage = "You have unlimited access"
//        showAlertView = true
//        showLoader = false
//    }
//
//
//    func getPriceText(for package: Package) -> String {
//        // Use RevenueCat's `localizedPriceString` to get the localized price string
//        if let product = offerings?.current?.availablePackages.first(where: {
//            $0.identifier == package.identifier }) {
//            return product.localizedPriceString
//        }
//        return ""
//    }
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentView()
//    }
//}
//
//
//
//







//import SwiftUI
//import RevenueCat
//
//struct PaymentView: View {
//    @State private var alertTitle: String?
//    @State private var alertMessage: String?
//    @State private var showAlertView = false
//    @State private var showLoader = true
//
//    @State private var offerings: Offerings?
//    @State private var isSubscribed = false
//    @Environment(\.presentationMode) private var presentationMode
//
//
//    let packageTexts = ["""
//                        Yearly
//                         549,99 SR
//                        """,
//                            """
//                                                Monthly
//                                                 49,99 SR
//                                                """,
//                                                    """
//                                                                        Weekly
//                                                                         14,99 SR
//                                                                        """]
////    let packageTexts = ["Package A", "Package B", "Package C"]
//
//    var body: some View {
//
//        NavigationStack {
//                ZStack{
//                    Image( "Image1")
//                        .resizable()
////                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
//
//                    VStack(){
//
//
//                        Text("""
//                     Revolutionize Your
//                     Communication with the
//                     Ultimate AI Assistant
//                    """)
//                        .foregroundColor(Color("Spectra"))
//                        .font(.title)
//                        .fontWeight(.semibold)
//                        .padding(.vertical)
//                        .multilineTextAlignment(.leading)
//
//                        Text("Maximize Your Productivity with AI")
//                            .foregroundColor(Color("Void"))
//                            .font(.headline)
//                            .padding(.vertical)
//
//                            VStack{
//                                VIPoptions(opt: "Unlimited chats with Nura AI")
//
//                                VIPoptions(opt: "Unlimited access to AI tools")
//
//
//                            }
////                            .padding(.vertical, 230)
////                            .padding(.horizontal, -100)
//                    }   .offset( y: -110)
//
////                    .padding(.vertical , -400)
//
//                    VStack {
//
//
//                        HStack {
//                            if showLoader {
//                                ProgressView()
//                            } else {
//                                if let packages = offerings?.current?.availablePackages {
//                                    ForEach(packages.indices, id: \.self) { index in
//                                        if let packageText = packageTexts.indices.contains(index) ? packageTexts[index] : nil {
//                                            Button(action: {
//                                                purchaseButtonTapped(index)
//                                            }) {
//
//                                                ZStack{
//                                                    //                                                Text(packageText)
//
//                                                    RoundedRectangle(cornerRadius: 8)
//
//                                                        .fill(Color("Lumina"))
//                                                        .frame(width: 105, height: 130)
//                                                        .cornerRadius(20)
//
//
//                                                        .shadow(color: Color(.lightGray), radius:3, x:0, y:1)
//
//                                                    Rectangle()
//                                                        .fill(Color("Lumina"))
//                                                        .frame(width: 105, height: 130)
//                                                        .cornerRadius(20)
//                                                        .font(.caption2)
//                                                        .fontWeight(.semibold)                                                     .foregroundColor(Color("Mist"))
//                                                        .overlay {
//                                                            RoundedRectangle(cornerRadius: 18)
//                                                                .stroke(Color("Matrix"), lineWidth: 2)
//
//                                                        }
//
//
//
//                                                        Text(packageText)
//
//
//                                                }
//
//
//                                                //
//                                            }
//                                            .offset(y: 150)
//                                            .padding(.horizontal , 5)
//
//                                        }
//                                    }
//                                }
//                            }
//                        }.padding()
//
//                        if isSubscribed {
//                            Text("You are subscribed!")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .padding(.top, 20)
//                        } else {
//                            Button(action: {
//                                restorePurchases()
//                            }) {
//                                Text("Restore Purchases")
//                                    .font(.body)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("Lumina"))
//                                    .frame(width: 300, height: 48)
//
//                                    .background(Color("Spectra"))
//                                    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
//                            }
//                            .padding(.top, 20)
//                            .offset(y: 150)
//                        }
//                    }
//                }
//                .alert(isPresented: $showAlertView) {
//                    Alert(title: Text(alertTitle ?? ""), message: Text(alertMessage ?? ""), dismissButton: .default(Text("OK")))
//                }
//                .onAppear {
//                    checkSubscriptionStatus()
//                    subscribe()
//                }
//
//
//        }.navigationTitle("VIP Subscription")
//            .navigationBarTitleDisplayMode(.inline)
//     }
//
//
//
//    func checkSubscriptionStatus() {
//
//        Purchases.shared.getCustomerInfo { customerInfo, error in
//
//            if let info = customerInfo {
//                if info.entitlements["pro"]?.isActive == true {
//
//                    print("Active")
//                    self.isSubscribed = true
//                }
//            }
//        }
//    }
//    func subscribe() {
//        Purchases.shared.getOfferings { offerings, error in
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            self.offerings = offerings
//            showLoader = false
//        }
//    }
//
//    func purchaseButtonTapped(_ index: Int) {
//        guard let packages = offerings?.current?.availablePackages else {
//            return
//        }
//
//        guard index < packages.count else {
//            return
//        }
//
//        let selectedPackage = packages[index]
//
//        Purchases.shared.purchase(package: selectedPackage) { transaction, purchaserInfo, error, userCancelled in
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            if purchaserInfo?.entitlements["pro"]?.isActive == true {
//                handleSuccess()
//                checkSubscriptionStatus()
//            }
//        }
//    }
//
//    func restorePurchases() {
//        showLoader = true
//
//        Purchases.shared.restorePurchases { purchaserInfo, error in
//            showLoader = false
//
//            if let error = error {
//                handleFailure(with: error.localizedDescription)
//                return
//            }
//
//            if purchaserInfo?.entitlements["pro"]?.isActive == true {
//                handleSuccess()
//                checkSubscriptionStatus()
//
//            } else {
//                alertTitle = "⚠️ RESTORE FAILED"
//                alertMessage = "No previous purchases found."
//                showAlertView = true
//            }
//        }
//    }
//
//    func handleFailure(with errorMessage: String) {
//        alertTitle = "❌ PURCHASE FAILED"
//        alertMessage = "There was an error: \(errorMessage)"
//        showAlertView = true
//        showLoader = false
//    }
//
//
//    func handleSuccess() {
//        alertTitle = "✅ PURCHASE SUCCESSFUL!"
//        alertMessage = "You have unlimited acsess"
//        showAlertView = true
//        showLoader = false
//    }
//
//
//}
//
//struct PaymentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentView()
//    }
//}
