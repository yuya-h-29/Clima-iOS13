//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextFeild: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextFeild.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextFeild.endEditing(true)
        print(searchTextFeild.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFeild.endEditing(true)
        print(searchTextFeild.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type a location!!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // get the weather infor of location
        
        if let city = searchTextFeild.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextFeild.text = ""
    }
}

