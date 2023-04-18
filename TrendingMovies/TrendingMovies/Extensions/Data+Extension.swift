//
//  Data+Extension.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import Foundation

extension Data {
    var prettyPrintedJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
