//
//  ViewController.swift
//  Test App
//
//  Created by Admin on 13/04/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}




class ViewController: UIViewController {

    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed_1(_ sender: UIButton) {
        
 
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(URL).responseObject { (response: DataResponse<WeatherResponse>) in
            
            let weatherResponse = response.result.value
            print(weatherResponse?.location)
            
            
            
            if let threeDayForecast = weatherResponse?.threeDayForecast {
                for forecast in threeDayForecast {
                    print(forecast.day)
                    print(forecast.temperature)
                }
            }
        }
        
        
        
    }
    
    @IBAction func buttonPressed_2(_ sender: UIButton) {
    }
    
    @IBAction func buttonPressed_3(_ sender: UIButton) {
    }
    

}

