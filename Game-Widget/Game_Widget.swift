//
//  Game_Widget.swift
//  Game-Widget
//
//  Created by Furkan Hanci on 7/26/22.
//

import WidgetKit
import SwiftUI

struct WidgetModel : TimelineEntry {
    
    var date: Date
    var widgetData : [GameWidgetModel]
    
}

struct Game_WidgetEntryView : View {
     let data : WidgetModel
    @State var range: Range<Int> = 0..<3
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("GameOrange") , Color("GameIndigo") , Color("GamePurple")], startPoint: .bottomLeading, endPoint: .topTrailing)
        VStack {
            ForEach(range , id: \.self) { gameData in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.size.width / 1.25 , height: 100)
                        .foregroundColor(.white)
                    HStack {
                       Image(systemName: "gamecontroller")
                            .foregroundColor(.black)

                        VStack {
                            Text(data.widgetData[gameData].title ?? "")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .lineLimit(2)
                            
                            Text("Price: \(data.widgetData[gameData].worth ?? "")")
                                .font(.system(size: 15))
                                .foregroundColor(.green)
                            
                            Text("Status: \(data.widgetData[gameData].status?.rawValue ?? "")")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .foregroundColor(.black)
                        }
                        
                    }.frame(width: 200)
                    
                }
            }
        }
    }
        
}
    
}

@main
struct Game_Widget: Widget {
    let kind: String = "Game_Widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { data in
            Game_WidgetEntryView(data: data)
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("Gamella Widget 🚀")
        .description("This Widgets shows you some data from Gamella on your home screen ☺️")
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetModel {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameWidgetModel(id: 0, title: "", worth: "", thumbnail: "", image: "", welcomeDescription: "", instructions: "", openGiveawayURL: "", publishedDate: "", type: .other, platforms: "", endDate: "", users: 0, status: .none, gamerpowerURL: "", openGiveaway: ""), count: 2))
        return loadingData
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetModel) -> ()) {
        let loadingData = WidgetModel(date: Date(), widgetData: Array(repeating: GameWidgetModel(id: 0, title: "", worth: "", thumbnail: "", image: "", welcomeDescription: "", instructions: "", openGiveawayURL: "", publishedDate: "", type: .other, platforms: "", endDate: "", users: 0, status: .none, gamerpowerURL: "", openGiveaway: ""), count: 2))
        completion(loadingData)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        FetchWidgetData.shared.getWidgetData { (data) in
            let date = Date()
            let data = WidgetModel(date: date, widgetData: data)
            
            // Update widget datas 10 minutes.
            let update = Calendar.current.date(byAdding: .minute, value: 10  , to:  date)
            
            let timeline = Timeline(entries: [data], policy: .after(update!))
            
            completion(timeline)
        }
    }
}
