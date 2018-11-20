
//
//
//  Created by Abuzeid Ibrahim on 11/18/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

/*(1)
 DON'T MARRY YOUR FRAMWORKS
 -> you could also replace it with just one line of code
 */
protocol ImageLoader{
    func loadImage(url:String)
}
extension ImageLoader{
    func loadImage(url:String){
        //Write your favourite framework implementation here..
    }
}
//=============================================================//
/*(2)
 Use internal structs to organize your constants
 //Constants.Api.baseUrl
 //Constants.Validation.firstNameMinChars
 */
struct Constants{
    static let appVersion = "1.0.9"
    
    struct Api{
        static let baseUrl = "http://www.domain.com"
        static let secretKey = "####"
    }
    struct Validation{
        static let passwordMinChars = 10
        static let firstNameMinChars = 3
    }
}


