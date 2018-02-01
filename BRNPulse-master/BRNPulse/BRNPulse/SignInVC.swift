//
//  SignInVC.swift
//  menuSlider
//
//  Created by Naveen on 1/27/18.
//  Copyright © 2018 Naveen. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var passwordTF: ACFloatingTextfield!
    @IBOutlet weak var userNameTF: ACFloatingTextfield!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    var logKnow = String()
    
    var reqURL:URLRequest?
    @IBOutlet weak var loadActiveIndicator: UIActivityIndicatorView!
    var sessionURL : URLSession?
    var dataTask : URLSessionDataTask?
    var allStore : [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonModify()
        self.loadActiveIndicator.isHidden = true
    }
    
    func buttonModify(){
        
        logInButton.layer.cornerRadius = 20.00
        logInButton.layer.masksToBounds = true
        
        signUpButton.layer.cornerRadius = 20.00
        signUpButton.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpEvent(_ sender: Any) {
        
//        let multi = DispatchQueue(label: "one",qos:.userInitiated)
//          multi.async {
        self.loadActiveIndicator.isHidden = false
        self.loadActiveIndicator.startAnimating()
        
            self.dataGettingFromServer()
            print(self.logKnow)
        //}
        if self.logKnow == "yes"{
        performSegue(withIdentifier: "toHome", sender: self)

        }else{
            
            self.loadActiveIndicator.isHidden = false
            self.loadActiveIndicator.startAnimating()
            print("Not Logged In")
            //self.loadAttendanceDetails()
        }
    }
    func dataGettingFromServer(){
        
        let add = "http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php"
        sessionURL = URLSession(configuration: URLSessionConfiguration.default)
        reqURL = URLRequest(url: URL(string: add)!)
        
        reqURL?.httpMethod = "POST"
        
        print("UserName :\(userNameTF.text!)\nPassword :\(passwordTF.text!)")
        
        let dataToServer = "funcName=verifyLogin&registeredEmail="+userNameTF.text!+"&registeredPassword="+passwordTF.text!+""
        reqURL?.httpBody = dataToServer.data(using: .utf8)
        dataTask = sessionURL?.dataTask(with: reqURL!, completionHandler: { (data, response, error) in
            print(data!)
            do{
                let dataResult = try JSONSerialization.jsonObject(with: data!, options:[])
                //print(dataResult)
                
                self.allStore = dataResult as? [String : String]
                
                DataStore .dStore(data: (self.allStore?["firstName"])!)
                DataStore .dStore(data: (self.allStore?["studentID"])!)
                DataStore .dStore(data: (self.allStore?["profileImagePath"])!)
                DataStore.dStore(data: (self.allStore?["batchID"])!)
                DataStore.dStore(data: (self.allStore?["surName"])!)
                //print(self.sName!)
                print(self.allStore!)
                
                self.logKnow = (self.allStore?["loggedIn"])!
                self.loadActiveIndicator.isHidden = true
                self.loadActiveIndicator.startAnimating()
                
            }catch{
                
                print("Something gone wrong")
            }
        })
        dataTask?.resume()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
}
