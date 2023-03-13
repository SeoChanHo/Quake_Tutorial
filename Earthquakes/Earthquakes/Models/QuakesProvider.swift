//
//  QuakesProvider.swift
//  Earthquakes
//
//  Created by 서찬호 on 2023/03/13.
//

import Foundation

// 전체 클래스를 @MainActor로 표시하면 이 클래스의 메서드가 메인 스레드에서 실행됩니다
@MainActor
class QuakesProvider: ObservableObject {
    
    @Published var quakes: [Quake] = []
    
    let client: QuakeClient
    
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
