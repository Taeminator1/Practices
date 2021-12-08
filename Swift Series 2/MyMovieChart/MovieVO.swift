//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by 윤태민 on 12/7/21.
//

import Foundation

// Value Object 패턴: 데이터 저장을 전담하는 클래스를 별도로 분리하는 설계 방식
// - 클래스 인스턴스 내부의 속성에 각각의 데이터들을 담은 다음, 전달할 때에는 클래스 인스턴스 전체를 전달하기 때문에 자연스레 클래스 내부의 변수에 저장된 값도 함께 전달
class MovieVO {
    var thumbnail: String?          // 섬네일 이미지 주소
    var title: String?              // 제목
    var description: String?        // 설명
    var detail: String?             // 상세 정보
    var openDate: String?           // 개봉일
    var rating: Double?             // 평점
    
    init(_ info: (title: String, description: String, openDate: String, rating: Double)) {
        self.title = info.title
        self.description = info.description
        self.openDate = info.openDate
        self.rating = info.rating
    }
}
