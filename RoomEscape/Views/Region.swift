//
//  Region.swift
//  RoomEscape
//
//  Created by 이은화 on 2022/12/28.
//

import Foundation
struct RegionManager {
    let regions = [Region(bigReg: "강원", smallReg: ["원주", "춘천"]),
                   Region(bigReg: "경기/인천", smallReg: ["고양", "구리", "군포", "김포", "부천", "성남", "수원", "안산", "안양", "의정부", "인천", "일산", "평택", "화성"]),
                   Region(bigReg: "경상", smallReg: ["구미", "대구", "부산", "양산", "울산", "창원", "포항"]),
                   Region(bigReg: "서울", smallReg: ["강남","건대", "노원", "대학로", "수유", "신림", "신촌", "용산", "잠실", "혜화", "홍대"]),
                   Region(bigReg: "전라", smallReg: ["광주", "전주"]),
                   Region(bigReg: "충청", smallReg: ["대전", "아산", "천안", "청주"])]
}
struct Region {
    let bigReg: String
    let smallReg: [String]
}
        
                                                                
