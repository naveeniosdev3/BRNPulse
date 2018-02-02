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
        
        logInButton.layer.cornerRadius = 24.00
        logInButton.layer.masksToBounds = true
        
        signUpButton.layer.cornerRadius = 24.00
        signUpButton.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpEvent(_ sender: Any) {
        

        self.loadActiveIndicator.isHidden = false
        self.loadActiveIndicator.startAnimating()
        
            self.dataGettingFromServer()
//            print(self.logKnow)
//        if self.logKnow == "yes"{
//        
//
//        }else{
//            
//            self.loadActiveIndicator.isHidden = false
//            self.loadActiveIndicator.startAnimating()
//            print("Not Logged In")
//            //self.loadAttendanceDetails()
//        }
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
                let dataResult = try JSONSerialization.jsonObject(with: data!, options:[]) as! [String:Any]
                print(dataResult)
                let logIn  = dataResult["loggedIn"] as! String
               
                let threatForServerDict = DispatchQueue(label: "server",qos: .userInitiated)
                threatForServerDict.async{
                if( logIn == "no"){
                    
                print("Not Logged in")
                    print("Something gone wrong")
                    DispatchQueue.main.async{
                    let alertControllerForError = UIAlertController(title: "Error", message: dataResult["msg"] as? String, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let alertAct = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertControllerForError.addAction(alertAct)
                    
                    self.present(alertControllerForError, animated: true, completion: nil)
                        self.loadActiveIndicator.isHidden = true
                        self.loadActiveIndicator.stopAnimating()
                    }
               
                }else{
                    
                   
                    self.allStore = dataResult as? [String : String]
                        print(self.allStore!)
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
                    DispatchQueue.main.async{
                    self.performSegue(withIdentifier: "toHome", sender: self)
                    }
                }
                }
            }catch{
                
                print("Something gone wrong")
                let alertControllerForError = UIAlertController(title: "Error", message: "Not Communicated with Server/No Internet", preferredStyle: .actionSheet)
                
                let alertAct = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertControllerForError.addAction(alertAct)
                
                self.present(alertControllerForError, animated: true, completion: nil)
                
                }
        })
        dataTask?.resume()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
}
