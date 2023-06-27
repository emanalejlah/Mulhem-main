//
//  FirebaseManager.swift
//  Molhem
//
//  Created by eman alejilah on 25/10/1444 AH.
//


import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

struct User {
    var name: String
}

class ViewModel: ObservableObject {
    @Published var user: User?
    let db = Firestore.firestore()
    
    func getData() {
        db.collection("Users").document(Auth.auth().currentUser?.uid ?? " ").getDocument { document, error in
            
            if let document = document, document.exists {
                let data = document.data()
                let name = data?["name"] as? String ?? ""
                self.user = User(name: name)
            } else {
                print("")
            }
            
            
        }
            
        ///db.collection("Users").getDocuments { documents, error in
            
//            if let error = error {
//                print("error")
//            } else {
//                guard let documents = documents else { return }
//                for doucment in documents.documents {
//                    db.collection("Users").document(doucment.documentID).getDocument { document, error in
//                        <#code#>
//                    }
//                }
//                //
//            }
            
//            if let document = document, document.exists {
//
//                let data = document.data()
//                let name = data?["name"] as? String ?? ""
//                self.user = User(name: name)
//            } else {
//                print("")
//            }
       // }
    }
    func addData(name: String) {
        Auth.auth().signInAnonymously { user, error in
            let documentRef = self.db.collection("Users").document(user?.user.uid ?? " ")
            let user = User(name: name)
            documentRef.setData(["name": user.name]) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    self.user = user
                }
            }
        }
        
    }
}

