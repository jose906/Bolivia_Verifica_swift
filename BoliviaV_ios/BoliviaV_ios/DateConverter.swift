//
//  DateFormatter.swift
//  BoliviaV_ios
//
//  Created by Jose Estenssoro on 4/1/23.
//

import Foundation


class DateConverter {
    static func convert(_ input: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        if let date = inputFormatter.date(from: input) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateStyle = .medium
            outputFormatter.timeStyle = .short
            outputFormatter.locale = Locale(identifier: "es_ES")

            let outputString = outputFormatter.string(from: date)
            return outputString
        }

        return nil
    }
}
