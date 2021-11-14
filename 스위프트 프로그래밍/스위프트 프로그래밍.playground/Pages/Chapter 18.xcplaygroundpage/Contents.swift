//: [Home](Untitled%20Page)
//: \
//: [Previous](@previous)

import Foundation

//: ### CHAPTER 18 상속
/*: 329p
 
 매개변수와 반환 타입에 따라 다른 함수로 취급하는지 확인:
 * 함수는 parameter들의 이름과 유무로 구별 됨
    * 와일드 카드이거나 그렇지 않거나만 구분
    * parameter 이름에 따라 구분 가능
    * argument 이름에 따라 구분 불가능
 * 반환값에 따라 구별 됨
    * 함수 호출 시에는 as [Type Name]으로 구분
 
 */

func sampleFunction(a1: Int, a2: String) -> String { "" }
func sampleFunction(a3: Int, a4: String) -> String { "" }
func sampleFunction(_ a1: Int, a2: String) -> String { "" }
func sampleFunction(_ a1: Int, _ a2: String) -> String { "" }
func sampleFunction(_ a1: Int, _ a2: String) {  }

var functionVariable1: ((Int, String) -> String) = sampleFunction(a1:a2:)
var functionVariable2: ((Int, String) -> String) = sampleFunction(a3:a4:)
var functionVariable3: ((Int, String) -> String) = sampleFunction(_:a2:)
var functionVariable4: ((Int, String) -> String) = sampleFunction(_:_:)
var functionVariable5_1: ((Int, String) -> Void) = sampleFunction(_:_:)
var functionVariable5_2: ((Int, String) -> ()) = sampleFunction(_:_:)         // 타입이 (Int, String) 또는 ((Int, String))로는 안 됨 --> 튜플

// 함수의 반환값만 다른 경우, as [Type Name]으로 구분 됨
sampleFunction(0, "") as String
sampleFunction(0, "") as Void

//: [Next](@next)
