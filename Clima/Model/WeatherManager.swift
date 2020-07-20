//
//  WeatherManager.swift
//  Clima
//
//  Created by Yuya Harada on 2020/07/17.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=bf34339e60550c61392c04f598f14058&units=metric"
    
    func fetchWeather (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest (urlString: String){
        
        // 1. create a url
        if let url = URL(string: urlString) {
            
            //2. create a url session
            let session = URLSession(configuration: .default)
            
            //3. give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            //4. start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            print(decodedData.main.temp)
//            print(decodedData.weather[0].id)
            
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))

        } catch {
            print(error)
        }
    }
    
    func getConditionName (weatherId: Int) -> String{
        switch weatherId {
            
        case 200...232:
            return "cloud.bolt"
            
        case 300...321:
            return "cloud.drizzle"
            
        case 500...531:
            return "cloud.rain"
            
        case 600...622:
            return "cloud.snow"
            
        case 700...781:
            return "cloud.fog"
        
        case 800:
            return "sun.max"
            
        case 801...804:
            return "cloud.bolt"
            
        default:
            return "cloud"
        }
    }
    
}
