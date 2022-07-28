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
    @State private var range: Range<Int> = 0..<2
    @State private var mediumRange: Range<Int> = 0..<1
    let randomInt = Int.random(in: 0..<10)
    @Environment(\.widgetFamily) var family
    var body: some View {
        
        switch family {
        case .systemLarge:
            largeSizeWidget()
            
        case .systemMedium:
            mediumSizeWidget()
            
        default:
            Text("Some other WidgetFamily in the future.")
        }
        
    }
    
    @ViewBuilder
    func mediumSizeWidget() -> some View {
        GeometryReader { geo in
            ZStack {
            LinearGradient(colors: [Color("GamePurple"), Color("Fuschia")], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Text("Magic Game 🤐 🕹👇")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.top , 20)
                
                Spacer()
                ForEach(mediumRange , id: \.self) { gameData in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: geo.size.width / 1.05 , height: 75)
                            .foregroundColor(.white)
                        HStack {
                            Image(systemName: "gamecontroller")
                                .foregroundColor(.black)
                            VStack {
                                Text(data.widgetData[gameData + randomInt].title ?? "")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                                
                                Text("Price: \(data.widgetData[gameData + randomInt].worth ?? "")")
                                    .font(.system(size: 13))
                                    .foregroundColor(.green)
                                
                                Text("Status: \(data.widgetData[gameData + randomInt].status?.rawValue ?? "")")
                                    .font(.system(size: 13))
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                                
                                Text("Published Date: \(data.widgetData[gameData + randomInt].publishedDate ?? "")")
                                    .font(.system(size: 8))
                                    .fontWeight(.light)
                                    .foregroundColor(Color("GameIndigo"))
                                    .lineLimit(2)
                            }
                            
                        }
                        .frame(width: 200)
                        
                    }.padding(.bottom , 5)
                }
            }
        }
            
        }
    }
    
    @ViewBuilder
    func largeSizeWidget() -> some View {
        GeometryReader { geo in
            
            ZStack {
                LinearGradient(colors: [Color("GamePurple") , Color("GameIndigo") , Color("GameOrange")], startPoint: .bottomLeading, endPoint: .topTrailing)
                VStack {
                    Text("Some of Games 👾 🎮")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top , 20)
                    Spacer()
                    ForEach(range , id: \.self) { gameData in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: geo.size.width / 1.10 , height: 100)
                                .foregroundColor(.white)
                            HStack {
                                Image(systemName: "gamecontroller")
                                    .foregroundColor(.black)
                                VStack {
                                    Text(data.widgetData[gameData + randomInt].title ?? "")
                                        .font(.system(size: 15))
                                        .foregroundColor(.black)
                                        .lineLimit(2)
                                    
                                    Text("Price: \(data.widgetData[gameData + randomInt].worth ?? "")")
                                        .font(.system(size: 15))
                                        .foregroundColor(.green)
                                    
                                    Text("Status: \(data.widgetData[gameData + randomInt].status?.rawValue ?? "")")
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.black)
                                    
                                    Text("Published Date: \(data.widgetData[gameData + randomInt].publishedDate ?? "")")
                                        .font(.system(size: 10))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("GameIndigo"))
                                        .lineLimit(2)
                                }
                                
                            }.frame(width: 200)
                            
                        }
                    }
                }.padding(.bottom , 30)
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
        .supportedFamilies([.systemLarge , .systemMedium])
        .configurationDisplayName("Gamella Widget 🚀")
        .description("This Widgets shows you some data from Gamella on your home screen.")
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
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetModel>) -> ()) {
        FetchWidgetData.shared.getWidgetData { (data) in
            let date = Date()
            let data = WidgetModel(date: date, widgetData: data)
            
            
            let update = Calendar.current.date(byAdding: .minute, value: 20  , to:  date)
            
            let timeline = Timeline(entries: [data], policy: .after(update!))
            completion(timeline)
        }
    }
}
