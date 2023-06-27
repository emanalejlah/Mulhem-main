//
//  SubViewModel.swift
//  Molhem
//
//  Created by eman alejilah on 14/11/1444 AH.
//


import Foundation
import RevenueCat
import SwiftUI
class SubViewModel: ObservableObject {
    
    @Published var alertTitle = ""
    @Published var alertDescriotion = ""
    @Published var showAlertView = false
    @Published var alertMessage = ""
    @Published  var isSubscribed = false
    @Published  var showLoader = false
    
    let freeQuestionLimit = 10
    
    @AppStorage("QuestionCount") var questionCount = 10
    
    @State  var offerings: Offerings?
    
    func checkSubscriptionStatus() {
        Purchases.shared.getCustomerInfo { customerInfo, error in
            if let info = customerInfo {
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
                self.handleFailure(with: error.localizedDescription)
                return
            }
            
            self.offerings = offerings
            self.showLoader = false
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
        
        Purchases.shared.purchase(package: selectedPackage) { [self] transaction, purchaserInfo, error, userCancelled in
            if let error = error {
                handleFailure(with: error.localizedDescription)
                return
            }
            
            if purchaserInfo?.entitlements["pro"]?.isActive == true {
                self.handleSuccess()
                checkSubscriptionStatus()
            }
        }
    }
    
    func restorePurchases() {
        showLoader = true
        
        Purchases.shared.restorePurchases { purchaserInfo, error in
            self.showLoader = false
            
            if let error = error {
                self.handleFailure(with: error.localizedDescription)
                return
            }
            
            if purchaserInfo?.entitlements["pro"]?.isActive == true {
                self.handleSuccess()
                self.checkSubscriptionStatus()
            } else {
                self.alertTitle = "⚠️ RESTORE FAILED"
                self.alertMessage = "No previous purchases found."
                self.showAlertView = true
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
        alertMessage = "You have unlimited acsess"
        showAlertView = true
        showLoader = false
    }
    
//    func subscribe() {
//        Purchases.shared.getOfferings { offerings, error in
//            if let packages = offerings?.current?.availablePackages {
//                Purchases.shared.purchase(package: packages.first!) { transaction, purchaserInfo, error, userCancelled in
//                    print("TRANSACTION: \(String(describing: transaction))")
//                    print("PURCHASER INFO: \(String(describing: purchaserInfo))")
//                    print("ERROR: \(String(describing: error))")
//                    print("USER CANCELLED: \(userCancelled)")
//
//                    if error != nil {
//                        // failed
//                        self.alertTitle = "❌ PURCHASE FAILED"
//                        self.alertMessage = "There was an error: \(error!.localizedDescription)"
//                        self.showAlertView.toggle()
//                        self.showLoader = false
//                        return
//                    }
//
//                    if purchaserInfo?.entitlements["pro"]?.isActive == true {
//                        self.showLoader = false
//                        print("✅ PURCHASE SUCCESSFUL!")
//
//                     self.alertTitle = "✅ PURCHASE SUCCESSFUL!"
//                        self.alertMessage = "You Pro"
//                        self.showAlertView.toggle()
//                    }
//
//                }
//            }
//
//        }
//
//    }
//    func checkSubscriptionStatus() {
//        Purchases.shared.getCustomerInfo { customerInfo, error in
//            if let info = customerInfo {
//                if info.entitlements["pro"]?.isActive == true {
//
//                    print("Active")
//                    self.isSubscribed = true
//                }
//            }
//        }
//    }
    func askQuestion() {
        questionCount -= 1

        if questionCount > 0 {
            print("You have a free question. Ask away!")
            
//          checkQuestionLimit()
            
        } else {
            print("Yow Pay")
//           subscribe()
        }
    }

    func checkQuestionLimit() {
        if questionCount == 0 {
//           paywall
        }
    }
}

