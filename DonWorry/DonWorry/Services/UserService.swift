//
//  UserService.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/12.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        print("DEBUG: Fetch user info... ")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                completion(user)
                
//                print("DEBUG: Username is \(user.username)")
//                print("DEBUG: Email is \(user.email)")
                
            }
    }
    
    
}
