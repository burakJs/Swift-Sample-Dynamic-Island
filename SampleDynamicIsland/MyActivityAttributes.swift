//
//  MyActivityAttributes.swift
//  SampleDynamicIsland
//
//  Created by Burak İmdat on 8.07.2024.
//

import Foundation
import ActivityKit

public struct MyActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var startTime: Date
    }
}
