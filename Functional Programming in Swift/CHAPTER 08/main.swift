//
//  main.swift
//  CHAPTER 08
//
//  Created by 윤태민 on 11/2/21.
//

import Foundation

print("Hello, World!")

// MARK:- 옵셔널에 저장된 값 출력
// - 옵셔널에 nil이 저장되어 있는 경우 아무 메세지를 받을 수 없음
let cities = ["Paris": 2243, "Madrid": 3216, "Amsterdam": 881, "Berlin": 3397]
let capitals = ["France": "Paris", "Spain": "Madrid", "The Netherlands": "Amsterdam", "Belgium": "Brussels", "Korea": "Seoul"]

func populationOfCapital1(country: String) -> Int? {
    guard let capital = capitals[country], let population = cities[capital] else {
        return nil
    }
    return population
}

func findPopulationOfCapital1(country: String) {
    guard let population = populationOfCapital1(country: country) else {
        return
    }
    print("\(country)'s capital has \(population) thousand inhabitants")
}

findPopulationOfCapital1(country: "Spain")
findPopulationOfCapital1(country: "Korea")

// MARK:- enum을 이용한 오류 처리를 통해, 옵셔널에 저장된 값이 nil인 경우 처리
// - 옵셔널에 nil이 저장되어 있는 경우 오류 메세지를 받을 수 있음
enum ContryError: Error {
    case CapitalNotFound
    case PopulationNotFound
}

enum PopulationResult {
    case Success(Int)
    case Error(ContryError)
}

let exampleSuccess: PopulationResult = .Success(1000)

func populationOfCapital2(country: String) -> PopulationResult {
    guard let capital = capitals[country] else {
        return .Error(.CapitalNotFound)
    }
    
    guard let population = cities[capital] else {
        return .Error(.PopulationNotFound)
    }
    
    return .Success(population)
}

func findPopulationOfCapital2(country: String) {
    switch populationOfCapital2(country: country) {
    case let .Success(population):
        print("\(country)'s capital has \(population) thousand inhabitants")
    case let .Error(error):
        print("Error: \(error)")
    }
}

findPopulationOfCapital2(country: "Spain")
findPopulationOfCapital2(country: "Korea")

// MARK:- cities와 capitals에 이어, 새로운 프로퍼티 mayors가 추가되었을 경우
// - MayorResult는 기존에 정의한 PopulationResult와 거의 유사함
let mayors = ["Paris": "Hidalgo", "Madrid": "Carmena", "Amsterdam": "van der laan", "Berlin" : "Müller"]
func mayorOfCaptal(country: String) -> String? {
    return capitals[country].flatMap { mayors[$0] }
}

enum MayorResult {
    case Success(Int)
    case Error(Error)
}
