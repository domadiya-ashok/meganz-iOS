//
//  Nasa.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import Foundation

struct Nasa : Decodable, Identifiable {
    
    var id : UUID? = UUID()
    var title : String
    var copyright : String? // no key exists in some objects.
    var date : Date?
    var explanation : String
    var url : String
    var hdurl : String?
    var mediaType : String
    var serviceVersion : String
    
    enum CodingKeys:String,CodingKey {
        case title,copyright,date,explanation,url,hdurl,mediaType,serviceVersion
    }
    
    var dateString : String? {
        get {
            guard let validDate = date else { return "No Date" }
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "dd MMM,yyyy"
            return dateFormat.string(from: validDate)
        }
    }
    
    var hdImageURL : URL? {
        get {
            if let url = hdurl {
                return URL(string: url)
            }
            return nil
        }
    }
    
    var imageURL : URL? {
        get {
            URL(string: url)
        }
    }

}
