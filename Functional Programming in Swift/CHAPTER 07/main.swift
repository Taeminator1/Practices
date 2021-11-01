//
//  main.swift
//  CHAPTER 07
//
//  Created by 윤태민 on 11/1/21.
//

import Foundation

// Quick Sort 정의1
// pviot, lesser, greater이 전부 상수(let)로 선언됨:
// - 변경할 수 없어 참조적 투명성이 좋아짐
// - 하지만 qsort를 실행시킬 때마다, 각각의 프로퍼티(tmpArray, pivot, lesser, greater)에 대한 메모리가 필요함
func qsort(_ array: [Int]) -> [Int] {
    guard !array.isEmpty else { return [] }
    
    var tmpArray = array
    let pivot = tmpArray.remove(at: 0)              // 같은 원소가 있는 경우 무한히 반복되는 걸 방지하기 위해 tmpArray의 첫 원소 삭제
    let lesser = tmpArray.filter { $0 < pivot }
    let greater = tmpArray.filter { $0 >= pivot }
    
    return qsort(lesser) + [pivot] + qsort(greater)
}

// Quick Sort 정의2
// inout 매개변수 전달하여, 매개변수로 전달되는 변수를 수정 가능하도록 변경
// lesser, greater이 전부 변수(var)로 선언됨:
// - 변수로 선언되었지만 여전히 참조적으로 투명함
// inout 매개변수도 overloading할 때 적용 됨
func qsort(_ array: inout [Int]) -> [Int] {
    guard !array.isEmpty else { return [] }
    
    var tmpArray = array
    let pivot = tmpArray.remove(at: 0)
    var lesser = tmpArray.filter { $0 < pivot }
    var greater = tmpArray.filter { $0 >= pivot }
    return qsort(&lesser) + [pivot] + qsort(&greater)
}


var arr: [Int] = [5, 2, 1, 3, 5, 7, 1, 22, 3, 1, 63]
print(qsort(arr))
print(qsort(&arr))
print(arr)
