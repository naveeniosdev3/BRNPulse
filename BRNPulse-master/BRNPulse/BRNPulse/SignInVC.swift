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
    
    var reqURL:URLRequest?
    var sessionURL : URLSession?
    var dataTask : URLSessionDataTask?
    var allStore : [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpEvent(_ sender: Any) {
        
        let multi = DispatchQueue(label: "one",qos:.userInitiated)
        multi.async {
            
            self.dataGettingFromServer()
        }
        
        performSegue(withIdentifier: "toHome", sender: self)
        
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
            }catch{
                
                print("Something gone wrong")
            }
        })
        dataTask?.resume()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
}
