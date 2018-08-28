//
//  APIController.swift
//  NoteSwift
//
//  Created by ToanDK on 7/20/18.
//  Copyright © 2018 ToanDK. All rights reserved.
//

import Foundation
import RxFirebase
import RxSwift
import ObjectMapper
import FirebaseDatabase

class APIController {
    static let sharedController = APIController()
    
    func getListCategory() -> Observable<[CategoryModel]> {
        let ref = Database.database().reference()
        
        return ref.child("categories")
                .rx
                .observeSingleEvent(.value)
                .map { Mapper<CategoryModel>().mapArray(snapshot: $0) }
    }
    
    func getListResume(in category: String, startAt: String?, limit: Int) -> Observable<[ResumeModel]> {
        let ref = Database.database().reference()
        
        return ref.child("resumes")
            .queryOrdered(byChild: "categoryId")
            .queryEqual(toValue : category)
            .queryLimited(toFirst: UInt(limit))
            .rx
            .observeSingleEvent(.value)
            .map { Mapper<ResumeModel>().mapArray(snapshot: $0) }
    }
    
    func getResume(with userId: String) -> Observable<ResumeModel> {
        let ref = Database.database().reference()
        
        return ref.child("resumes")
            .queryOrdered(byChild: "userId")
            .queryEqual(toValue : userId)
            .rx
            .observeSingleEvent(.value)
            .map { ResumeModel(snapshot: $0)! }
    }
}
