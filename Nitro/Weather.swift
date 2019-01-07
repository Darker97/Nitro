//
//  Weather.swift
//  Nitro
//
//  Created by Christian Baltzer on 29.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
class Weather{
    
    //Wetter Daten aus der OpenWather laden
    //Nice to have falls wir noch Zeit haben...
    var city = "Fulda"
    var country = "DE"
    
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
