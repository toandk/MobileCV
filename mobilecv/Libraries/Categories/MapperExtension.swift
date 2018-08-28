//
//  MapperExtension.swift
//  mobilecv
//
//  Created by Do Toan on 8/27/18.
//  Copyright © 2018 Do Toan. All rights reserved.
//

import Foundation
import ObjectMapper
import FirebaseDatabase

extension Mapper {
    func mapArray(snapshot: DataSnapshot) -> [N] {
        return snapshot.children.map { (child) -> N? in
            if let childSnap = child as? DataSnapshot {
                return N(snapshot: childSnap)
            }
            return nil
            //flatMap here is a trick
            //to filter out `nil` values
            }.flatMap { $0 }
    }
}

extension BaseMappable {
    static var firebaseIdKey : String {
        get {
            return "FirebaseIdKey"
        }
    }
    init?(snapshot: DataSnapshot) {
        guard var json = snapshot.value as? [String: Any] else {
            return nil
        }
        json[Self.firebaseIdKey] = snapshot.key as Any
        
        self.init(JSON: json)
    }
}
