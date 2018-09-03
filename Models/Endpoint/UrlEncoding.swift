//
//  UrlEncoding.swift
//  iTunesClient
//
//  Created by Radu Albastroiu on 31/08/2018.
//  Copyright © 2018 Radu Albastroiu. All rights reserved.
//

import Foundation

extension String {
    func addingPercentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}

class UrlEncoding {
    static func encodeParametersInUrl(_ parameters: [String: Any]) -> String {
        var components = [(String, String)]()
        
        let sortedKeys = parameters.keys.sorted(by: {$0 < $1 })
        
        for key in sortedKeys {
            let value = parameters[key]!
            let queryComponents = UrlEncoding.queryComponentsWith(key: key, value: value)
            components.append(contentsOf: queryComponents)
        }
        
        let encodedComponents = components.map { "\($0)=\($1)" }
        return encodedComponents.joined(separator: "&")
    }
    
    static func queryComponentsWith(key: String, value: Any) -> [(String, String)] {
        var components = [(String, String)]()
        
        if let dictionary = value as? [String: Any] {
            for(nestedKey, value) in dictionary {
                let nestedComponents = queryComponentsWith(key: "\(key)[\(nestedKey)]", value: value)
                components.append(contentsOf: nestedComponents)
            }
        }
        else if let array = value as? [Any] {
            let nestedComponents = queryComponentsWith(key: "\(key)[]", value: value)
            components.append(contentsOf: nestedComponents)
        }
        else {
            let encodedKey = key.addingPercentEncoding()
            let encodedValue = "\(value)".addingPercentEncoding()
            
            let component = (encodedKey, encodedValue)
            components.append(component)
        }
        
        return components
    }
}






