//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by Rozeri Dağtekin on 6/9/16.
//  Copyright © 2016 Rozeri Dağtekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var numbersView: UIView!
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var thirdLine: UIView!
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var btnDelete: UIButton!
    
     //MARK: LYFE CYCLES
    override func viewDidLoad() {
    super.viewDidLoad()
        
    txtField.delegate  = self

    
    txtField.inputView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.deleteBtnLabel(_:)))
    btnDelete.addGestureRecognizer(longPress)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.deleteBtnLabel(_:)))
    tap.requireGestureRecognizerToFail(longPress)
    btnDelete.addGestureRecognizer(tap)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ACTIONS
    @IBAction func actionUnlikeComment(sender: AnyObject) {
        print("button like pressed")
    }
    
    @IBAction func actionLikeComment(sender: AnyObject) {
        print("button unlike pressed")
    }
    
    @IBAction func addBtnLabel(sender: AnyObject) {
    
    txtField.text =  txtField.text?.stringByAppendingString(sender.titleLabel!!.text!)
    checkMaxLength(txtField as! UITextField, maxLength: 14)
    
    }
    
    @IBAction func deleteBtnLabel(sender: AnyObject) {
    deleteLastCharacter()
    }
    
    func deleteLastCharacter(){
    if (txtField == 0) {
    // textField is empty
    print("text field is empty")
    }
    else{
    //txtFieldPlateNumber.text =  txtFieldPlateNumber.text?.
    var name: String = txtField.text!
    var truncated = String(name.characters.dropLast())
    txtField.text = truncated
    }
    
    }
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
    
    if (textField.text?.utf16.count > maxLength) {
    deleteLastCharacter()
    }
    
    }

}
