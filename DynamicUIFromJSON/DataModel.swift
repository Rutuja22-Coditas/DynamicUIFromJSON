//
//  DataModel.swift
//  DynamicUIFromJSON
//
//  Created by Coditas on 15/11/21.
//

import Foundation

struct Application : Codable {
    let screens : [Screen]
}
struct Screen : Codable {
    let id : String
    let title : String
    let type : String
    let rows : [Row]
}
struct Row : Codable {
    var title : String
    let action : AlertAction?
}

struct AlertAction: Codable {
    //let title : String
    let message : String
    let width : Int
    let height : Int
}
struct name {
    let label : String
}


//struct JsonData : Codable {
//    let type : String
//    let data : String
//    let id : String
//}
//struct DataFile : Codable {
//    let views : [JsonData]
//}

//struct user: Codable {
////    let userId: Int
////    let firstName: String
////    let lastName: String
////    let phoneNumber: String
////    let emailAddress: String
//    let type : String
//        let data : String
//        let id : String
//
//}
//struct sampleRecord: Codable {
//    let users: [user]
//}
