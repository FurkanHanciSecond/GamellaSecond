//
//  Game_Widget.swift
//  Game-Widget
//
//  Created by Furkan Hanci on 7/26/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Game_WidgetEntryView : View {
    var body: some View {
        Text("Hi This Is Widget!")
    }
    
}

@main
struct Game_Widget: Widget {
    let kind: String = "Game_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            Game_WidgetEntryView()
        }
        .configurationDisplayName("Gamella Widget 🚀")
        .description("Power Widgets")
    }
}

struct Game_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Game_WidgetEntryView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
