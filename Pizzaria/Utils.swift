import Foundation

var arrayNomes: [String] = []

class Utils {
    static func getJsonFromUrl(url: URL) {
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "pizzas")!)
                
                //getting the pizza tag array from json and converting it to Array
                if let pizzasArray = jsonObj!.value(forKey: "pizzas") as? NSArray {
                    //looping through all the elements
                    for pizza in pizzasArray {
                        
                        //converting the element to a dictionary
                        if let pizzaDic = pizzas as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let nome = pizzasDic.value(forKey: "nome") {
                                
                                //adding the name to the array
                                arrayNomes.append((nome as? String)!)
                            }
                        }
                    }
                }
            }
        }
    }
}
