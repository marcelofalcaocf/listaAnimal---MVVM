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
    
    func getDayOfWeek() -> String {
        let dayToday: String = currentData.dayofTheWeek
//        print(dayToday)
        return dayToday
    }
    
    func presentingInformation() {
        guard let positionDay = currentData.daysOfTheWeek.firstIndex(of: validateDay()) else { return }
        
        for day in currentData.daysOfTheWeek {
            if day == getDayOfWeek() {
                if day == validateDay() {
                    print("Hoje")
                    break
                }
            } else if validateDay() == currentData.daysOfTheWeek[positionDay] && day == validateDay() {
                print ("Amanha")
                break
            } else if validateDay() == currentData.daysOfTheWeek[positionDay + 1] && day == validateDay(){
                print ("Depois de amanha")
                break
            } else if validateDay() == currentData.daysOfTheWeek[positionDay + 2] && day == validateDay() {
                print ("Daqui a 3 dias")
                break
            }
        }
    }
    
    private func validateDay() -> String {
        guard let license = licensePlate?.licensePlate else { return "Sem validação" }
        
                if license.last == "1" || license.last == "2" {
                    return "Segunda"
                } else if license.last == "3" || license.last == "4" {
                    return "Terça"
                } else if license.last == "5" || license.last == "6" {
                    return "Quarta"
                } else if license.last == "7" || license.last == "8" {
                    return "Quinta"
                } else {
                    return "Sexta"
                }
    }
    
}

extension Date {
    var dayofTheWeek: String {
         let dayNumber = Calendar.current.component(.weekday, from: self)
         // day number starts from 1 but array count from 0
         return daysOfTheWeek[dayNumber - 1]
    }

    var daysOfTheWeek: [String] {
         return  ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sabado"]
    }
 }


//func getDayOfWeek(today: String) -> String {
//    var dayNow: String = currentData.dayofTheWeek
//    print(dayNow)
//    return dayNow
//}
