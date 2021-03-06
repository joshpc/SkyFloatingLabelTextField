//  Copyright 2016 Skyscanner Ltd
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

import UIKit

class DelegateMethodsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField:SkyFloatingLabelTextField?
    @IBOutlet var logTextView:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField?.delegate = self
        self.logTextView?.text = ""
    }
    
    @IBOutlet var addErrorButton:UIButton?
    
    @IBAction func addError() {
        if(self.addErrorButton?.title(for: .normal) == NSLocalizedString("Add error", tableName: "SkyFloatingLabelTextField", comment: "add error button title")) {
            self.textField?.errorMessage = NSLocalizedString("error message", tableName: "SkyFloatingLabelTextField", comment: "error message")
            self.addErrorButton?.setTitle(NSLocalizedString("Clear error", tableName: "SkyFloatingLabelTextField", comment: "clear errors button title"), for: .normal)
        } else {
            self.textField?.errorMessage = ""
            self.addErrorButton?.setTitle(NSLocalizedString("Add error", tableName: "SkyFloatingLabelTextField", comment: "add error button title"), for: .normal)
        }
    }
    
    @IBAction func resignTextField() {
        self.textField?.resignFirstResponder()
    }
    
    func log(_ text:String) {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let row = "\(formatter.string(from: date as Date)) : \(text)"
        logTextView.text = "\(row)\n" + logTextView.text!
    }

    
    // MARK: - SkyFloatingLabelTextField delegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.log("textFieldDidBeginEditing:")
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.log("textField:shouldChangeCharactersInRange:replacementString:")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.log("textFieldDidEndEditing:")
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        self.log("textFieldShouldBeginEditing:")
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        self.log("textFieldShouldClear:")
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        self.log("textFieldShouldEndEditing:")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.log("textFieldShouldReturn")
        return true
    }
}
