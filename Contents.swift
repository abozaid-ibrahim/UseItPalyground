
//
//
//  Created by Abuzeid Ibrahim on 11/18/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//
import UIKit
import XCTest

/*(1)
 DON'T MARRY YOUR FRAMWORKS
 -> you could also replace it with just one line of code
 */

protocol ImageLoader{
    func loadImage(url:String)
}
extension ImageLoader{
    func loadImage(url:String){
        //you could give a default implementaion here
    }
}

final class ImageLoaderImplementor:ImageLoader{
    //also you could override your favourite framework implementation here..
}

class MyViewController{
    var imageLoader:ImageLoader!
    func viewDidLoad(){
        imageLoader.loadImage(url: "http.....")
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

//Using
Constants.Api.baseUrl


//=============================================================//
/*(3)
 Use private extension to group yor private methods
 */
class ServiceCategoryViewController{
    
}

private extension ServiceCategoryViewController{
    func addServiceCategoriesController() {
        
        
    }
    func updateCategoriesControllerHeight() {
        
        
    }
    func removeServiceCategoriesController() {
        
        
    }
}
//=============================================================//
/*(4)
 Make it faster, add click to button in same line
 */

extension UIButton {
    private func actionHandleBlock(action: (() -> Void)? = nil) {
        struct __ {
            static var action: (() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        actionHandleBlock()
    }
    
    func addAction(control: UIControl.Event, forAction: @escaping () -> Void) {
        actionHandleBlock(action: forAction)
        addTarget(self, action: #selector(UIButton.triggerActionHandleBlock), for: control)
    }
}
//How to use
UIButton().addAction(control: .touchUpInside, forAction: {
    print("here is the action")
})
//=============================================================//
/*(5)
 Derived Data
 
 location where Xcode stores all kinds of intermediate build results, generated indexes,
 ,precompiled module files (.pcm). A module is the way how reusable code is organized and shared. Modules were introduced to Clang (the compiler used by Xcode) several years ago, mainly to ensure reasonable and scalable compile times. It was common that for every single import in the source file, megabytes of additional headers had to be included and parsed by the compiler. Thanks to modules, the headers are parsed and compiled just once.
 
 */


//=============================================================//


//=============================================================//
/*(6)
 Avoid extra mocking when you test
 MVP Architecture
 /// You need to pass the view  in the instructor to make the code compile
 // then it's better to inject the view in a method rather than a constructor
 */
protocol LoginView {
    func showEmailNotValidAlert()
}
class LoginPresenter{
    var view:LoginView
    init(view:LoginView) {
        self.view = view
    }
    func loginClicked(email:String){
        view.showEmailNotValidAlert()
    }
    func isEmailInputsValid(email:String)->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
        
    }
}
class LoginTestCase:XCTest{
    func testLoginValid() {
        let presenter = LoginPresenter(view:DummyView())
        XCTAssertTrue(presenter.isEmailInputsValid(email: "ab@.ads"))
    }
}
class DummyView:LoginView{
    func showEmailNotValidAlert() {
        
    }
}

///

//=============================================================//
/*(7)
 Never use a static method into closure >> to avoid memory leak
 */
typealias SuccessClosure = (Void)->()
class Logger{
    static func log(){}
}
//func callApi(result:SuccessClosure){
//    DispatchQueue.global().asyncAfter(deadline: .now() + 0.2, execute: {[weak self] in
//        Logger.log()//this is the wrong action
//    })
//}

//=============================================================//
/*(8)

For performance reasons, the size of the newly allocated storage might be greater than the requested capacity. Use the array’s capacity property to determine the size of the new storage.
*/

var b = [String]()
print(b.capacity)

b.reserveCapacity(1000)
print(b.capacity)

