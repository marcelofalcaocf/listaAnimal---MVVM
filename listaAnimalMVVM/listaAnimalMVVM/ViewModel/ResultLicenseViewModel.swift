//
//  ResultLicenseViewModel.swift
//  listaAnimalMVVM
//
//  Created by Marcelo Falcao Costa Filho on 18/12/22.
//

import Foundation

class ResultLicenseViewModel {
    
    private var licensePlate: LicensePlate?
    private var currentData: Date = Date()
    private var day: String?
    
    public func receiveInformationForResult(license: LicensePlate) {
        licensePlate = license
    }
    
    func getDayOfWeek() -> Int {
        let dayToday: Int = currentData.dayofTheWeek
        //        print(dayToday)
        return dayToday
    }
    
    private func validateDay() -> Int {
        guard let license = licensePlate?.licensePlate else { return 6 }
        
        if license.last == "1" || license.last == "2" {
            return 1
        } else if license.last == "3" || license.last == "4" {
            return 2
        } else if license.last == "5" || license.last == "6" {
            return 3
        } else if license.last == "7" || license.last == "8" {
            return 4
        } else if license.last == "9" || license.last == "0" {
            return 5
        } else {
            return 6
        }
    }
    
    func presentingInformation() -> String {
        if getDayOfWeek() == validateDay() {
            return "Hoje"
        } else if getDayOfWeek() + 1 == validateDay() {
            return "Amanha"
        } else if getDayOfWeek() + 2 == validateDay() {
            return "Depois de amanhã"
        } else if getDayOfWeek() + 3 == validateDay() {
            return "Daqui 3 dias"
        } else {
            return "Você não pode usar seu carro nos próximos 3 dias"
        }
    }
}

extension Date {
    var dayofTheWeek: Int {
        let dayNumber = Calendar.current.component(.weekday, from: self)
        // day number starts from 1 but array count from 0
        //         return daysOfTheWeek[dayNumber - 1]
        return dayNumber - 1
    }
    
    var daysOfTheWeek: [String] {
        return  ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sabado"]
    }
}


//    func presentingInformation() -> String {
//        guard let positionDay = currentData.daysOfTheWeek.firstIndex(of: validateDay()) else { return "" }
//        var days: String = ""
//
//        guard let positionDay = currentData
//        for day in currentData.daysOfTheWeek {
//                if day == validateDay() {
//                    if day == getDayOfWeek() {
//                        print("Voce pode sair hj: \(day)")
//                    } else if day == currentData.daysOfTheWeek[positionDay] {
//                        print("Amanha" )
//                               } else if day == currentData.daysOfTheWeek[positionDay + 1] {
//                            print("Depois de amanha")
//                        }
//                    let day = " - Você pode sair com seu carro: \(day)"
//                    days += day
//                } else {
//                let notDay = day
//                days += "- \(notDay)"
//            }
//        }
//        return days
//    }

//    func presentingInformation() {
//        for (index, element) in currentData.daysOfTheWeek.enumerated() {
//            if validateDay() == index {
//                print("Você pode usar seu carro")
//            }
//        }
//    }
