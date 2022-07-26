//
//  FetchWidgetData.swift
//  Game-WidgetExtension
//
//  Created by Furkan Hanci on 7/26/22.
//

import SwiftUI

final class FetchWidgetData : ObservableObject {
   
    static let shared = FetchWidgetData()
    
    @Published private var games : [GameWidgetModel] = []

    
    private init() { }
    
    
    func getWidgetData(completion: @escaping ([GameWidgetModel]) -> Void) {
        // We are set default price as a 20 dollars / euro etc...
        guard let url = URL(string: "https://www.gamerpower.com/api/giveaways?type=game") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, _, err in
            if err != nil {
                print(err?.localizedDescription as Any)
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode([GameWidgetModel].self, from: data!)
                
                completion(jsonData)
            } catch {
                print(err?.localizedDescription as Any)
            }
        }.resume()
    }
}
