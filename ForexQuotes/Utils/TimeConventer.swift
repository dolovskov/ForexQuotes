//
//  TimeConventer.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation


class TimeConventer {
    
    static func updatedTimeString(from time: Double) -> String {
        if time == 0 {
            return "Не обновлено"
        }
        let currentInterval = Date().timeIntervalSince1970
        let seconds = currentInterval - time
        if seconds == 0 {
            return "Только что"
        }
        if seconds < 60 {
            return "Обновлено \(String(format: "%.0f", seconds)) секунд назад"
        }
        if seconds < 3600 {
            let minutes = Int(seconds / 60)
            return "Обновлено \(minutes) минут назад"
        }
        if seconds < 86400 {
            let minutes = Int(seconds / 60)
            let hours = minutes / 60
            return "Обновлено \(hours) часов назад"
        }
        return "Обновлено более одного дня назад"
    }
    
}
