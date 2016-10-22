//
//  KeyboardViewController.swift
//  Riskeyboard
//
//  Created by Carol Zhang on 8/12/16.
//  Copyright © 2016 Carol Zhang. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    //primary arrays: getHelpArray, sendHelpArray, hotlineArray
    var keyboardView: UIView!
    
    var cellNibRegister: UINib!
    
    var tabNumber: Int = 1 {
        didSet {
            
            switch tabNumber {
            case 1:
                selectedArray = getHelpArray
                break
            case 2:
                selectedArray = sendHelpArray
                break
            case 3:
                selectedArray = hotlineArray
                break
            default:
                0
                break
                
            }
        }
    }
    
    var selectedArray: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func nextKeyboard(sender: AnyObject) {
        advanceToNextInputMode()
    }
    
    @IBAction func backspace(sender: AnyObject) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    @IBAction func getHelp(sender: AnyObject) {
        
        //let proxy = textDocumentProxy as UITextDocumentProxy
        tabNumber = 1
        tableView.reloadData()
        print("get help now!")
    }
    
    @IBAction func sendHelp(sender: AnyObject) {
        tabNumber = 2
        tableView.reloadData()
        print("chicken")
    }

    @IBAction func sendHotline(sender: AnyObject) {
        tabNumber = 3
        tableView.reloadData()
        print("poop")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        self.tabNumber = 1
        super.viewDidLoad()

        loadKeyboardView()
        
        //        // Perform custom UI setup here
        //        self.nextKeyboardButton = UIButton(type: .System)
        //
        //        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        //        self.nextKeyboardButton.sizeToFit()
        //        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        self.nextKeyboardButton.addTarget(self, action: #selector(advanceToNextInputMode), forControlEvents: .TouchUpInside)
        //
        //        self.view.addSubview(self.nextKeyboardButton)
        //
        //        self.nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        //        self.nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }
    
    func loadKeyboardView(){
        let keyboardNib = UINib(nibName: "View", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.cellNibRegister = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.registerNib(self.cellNibRegister, forCellReuseIdentifier: "identifierCell")
        
        view.addSubview(keyboardView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        //        var textColor: UIColor
        //        let proxy = self.textDocumentProxy
        //        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
        //            textColor = UIColor.whiteColor()
        //        } else {
        //            textColor = UIColor.blackColor()
        //        }
        //        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
}

enum helpArrays {
    case get, send, hotlines
}

extension KeyboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return selectedArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = cellNib
        //let cell = self.tableView.registerNib(self.cellNib, forCellReuseIdentifier: "identifierCell") as! CustomTableViewCell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("identifierCell", forIndexPath: indexPath) as! CustomTableViewCell
        
        cell.phraseLabel.text = selectedArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(selectedArray[indexPath.row])
    }
    
}
