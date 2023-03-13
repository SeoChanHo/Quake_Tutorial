//
//  GeoJSON.swift
//  Earthquakes
//
//  Created by 서찬호 on 2023/03/13.
//

import Foundation

struct GeoJSON: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case features
    }
    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }
    private(set) var quakes: [Quake] = []
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)
        
        // isAtEnd : 컨테이너에서 디코딩할 요소가 더 이상 남아 있지 않은지 여부를 나타내는 부울 값입니다.
        while !featuresContainer.isAtEnd {
            // nestedContainer : 지정된 키 유형으로 키가 지정된 컨테이너에 표시된 대로 지정된 키에 대해 저장된 데이터를 반환합니다.
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)
            
            if let properties = try? propertiesContainer.decode(Quake.self, forKey: .properties) {
                quakes.append(properties)
            }
        }
    }
}
