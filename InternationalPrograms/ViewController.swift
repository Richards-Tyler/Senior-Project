//
//  ViewController.swift
//  InternationalPrograms
//
//  Created by Tyler Richards on 2/13/17.
//  Copyright © 2017 Tyler Richards. All rights reserved.
//

import UIKit
import MessageUI


class Task: NSObject{
    var Name: String = ""
    var MailingAddress: String = ""
    var Email: String = ""
    var Major: String = ""
    var City: String = ""
    var tripCode: String = ""
    var How : String = ""
    var When : String = ""
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var MailingAddress: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Major: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var tripCode: UITextField!
    @IBOutlet weak var How: UITextField!
    @IBOutlet weak var When: UITextField!
    var arrayOfStudents = [Task]()
    var permTripCode: String = "0000"
    var defaults = UserDefaults.standard
    var task: Task!
    var csvText: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        task = Task()
        
        if UserDefaults.standard.value(forKey: "user_auth_token") != nil {
            csvText = UserDefaults.standard.value(forKey: "user_auth_token") as! String
        } else{
            csvText = "Name,Address,City,Email,Major,Referral,Planned Attendance,Trip Code\n"
            return
        }
        if UserDefaults.standard.value(forKey: "user_trip_token") != nil {
            permTripCode = UserDefaults.standard.value(forKey: "user_auth_token") as! String
        } else{
            return
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitForm(_ sender: Any) {

        if Name.text != "" && MailingAddress.text != "" && Email.text != "" && Major.text != "" && City.text != "" && Name.text != "" && How.text != "" && When.text != ""{
            
            task.Name=Name.text!
            task.MailingAddress=MailingAddress.text!
            task.Email=Email.text!
            task.Major=Major.text!
            task.City=City.text!
            task.tripCode=permTripCode
            task.How=How.text!
            task.When=When.text!
            arrayOfStudents.append(task)
            
            
            for task in arrayOfStudents {
                let newLine = "\(task.Name),\(task.MailingAddress),\(task.City),\(task.Email),\(task.Major),\(task.How),\(task.When),\(task.tripCode)\n"
                csvText.append(newLine)
                UserDefaults.standard.setValue("", forKey: "user_auth_token")
                UserDefaults.standard.setValue(csvText, forKey: "user_auth_token")
            }

            
            let alert = UIAlertController(title: "Submission Complete", message: "Thank you", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alertNew = UIAlertController(title: "Submission Incomplete", message: "Please input a value for all fields", preferredStyle: UIAlertControllerStyle.alert)
            alertNew.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertNew, animated: true, completion: nil)
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let emailController = MFMailComposeViewController()
        //emailController.mailComposeDelegate = self
        emailController.setSubject("CSV File")
        emailController.setMessageBody("", isHTML: false)
        let data = csvText.data(using: String.Encoding.utf8, allowLossyConversion: false)
        emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Sample.csv")
        
        return emailController
    }

    
    @IBAction func Clear(_ sender: Any) {
        Name.text=""
        MailingAddress.text=""
        Email.text=""
        Major.text=""
        City.text=""
        How.text=""
        When.text=""
    }
    @IBAction func clearSpreadSheet(_ sender: Any) {
        UserDefaults.standard.setValue("", forKey: "user_auth_token")
        csvText = "Name,Address,City,Email,Major,Referral,Planned Attendance,Trip Code\n"
        UserDefaults.standard.setValue(csvText, forKey: "user_auth_token")
    }
    
    @IBAction func changeTripCode(_ sender: Any) {
        permTripCode = tripCode.text!
        UserDefaults.standard.setValue(permTripCode, forKey: "user_trip_token")
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    @IBAction func export(_ sender: Any) {
        
        let path = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("Documents/Students.csv")
        if UserDefaults.standard.value(forKey: "user_auth_token") != nil{
        csvText = UserDefaults.standard.value(forKey: "user_auth_token")! as! String
        }
        do {
            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
        
        if MFMailComposeViewController.canSendMail() {
            let emailController = MFMailComposeViewController()
            emailController.mailComposeDelegate = self
            emailController.setToRecipients([])
            emailController.setSubject("Student Records")
            emailController.addAttachmentData(NSData(contentsOf: path)! as Data, mimeType: "text/csv", fileName: "Tasks.csv")
            present(emailController, animated: true, completion: nil)
        }
    }
}





