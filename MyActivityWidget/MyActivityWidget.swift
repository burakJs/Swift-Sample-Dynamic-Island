//
//  MyActivityWidget.swift
//  MyActivityWidget
//
//  Created by Burak İmdat on 8.07.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyActivityAttributes.self) { context in
            Text(context.state.startTime, style: .timer)
                .multilineTextAlignment(.center)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    // Dairesel ilerleme göstergesi (Circular Progress Indicator)
                    Text(context.state.startTime, style: .timer)
                        .multilineTextAlignment(.trailing)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text(context.state.startTime, style: .timer)
                    .multilineTextAlignment(.trailing)
            } minimal: {
                Text("M")
            }
            .widgetURL(URL(string: "http://www.example.com"))
            .keylineTint(Color.red)
        }
    }
}
