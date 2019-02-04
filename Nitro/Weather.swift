//
//  Weather.swift
//  Nitro
//
//  Created by Christian Baltzer on 29.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class Weather{
    

    var city = "Fulda"
    var country = "DE"
    
    ///auslesen der Wetter Daten für Fulda aus der Api von Openwather
    ///Allgemeine Steuerungseinheit
    func loadWeather(){
        try? WeatherService.sharedWeatherService().getCurrentWeather(city + "," + country, completion: { (data) -> () in
            OperationQueue.main.addOperation({ () -> Void in
                if let weatherData = data {
                    main.Weather = weatherData.weather.capitalized
                    main.temp = String(format: "%d", weatherData.temperature) + "\u{00B0}"
                }
            })
        })
    }
    
    
}
