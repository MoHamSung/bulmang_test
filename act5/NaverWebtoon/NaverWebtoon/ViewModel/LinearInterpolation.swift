//
//  LinearInterpolation.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/09.
//

import SwiftUI

class LinearInterpolation {
    private var length: Int
    private var inputRange: [CGFloat]
    private var outputRange: [CGFloat]
    
    init(inputRange: [CGFloat], outputRange: [CGFloat]) {
        assert(inputRange.count == outputRange.count)
        self.length = inputRange.count - 1
        self.inputRange = inputRange
        self.outputRange = outputRange
    }
    
    func calculate(for x: CGFloat) -> CGFloat {
        // 값이 초기 입력 범위보다 작은 경우
        if x <= inputRange[0] { return outputRange[0] }
        
        for index in 1...length {
            let x1 = inputRange[index - 1]
            let x2 = inputRange[index]
            
            let y1 = outputRange[index - 1]
            let y2 = outputRange[index]
        
            // 선형 보간 공식 : y1 + {(y2-y1)/(x2-x1) * (x-x1))
            if x <= inputRange[index] {
                let y = y1 + ((y2-y1)/(x2-x1) * (x-x1))
                    return y
            }
        }
        
        // 값이 최대 입력 범위를 초과하는 경우
        return outputRange[length]
    }
}
