//
//  AddViewController.swift
//  myMemo
//
//  Created by 梁佳玉 on 16/8/6.
//  Copyright © 2016年 梁佳玉. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    var newMemo : cMemo!
    @IBOutlet weak var addTitleTextField: UITextField!
    @IBOutlet weak var addDatePicker: UIDatePicker!
    
    @IBAction func submitNewItem(sender: AnyObject) {

//        //1. get new item details: title and date
//        let newMemoTitle = self.addTitleTextField.text!
//        let newMemoDate  = self.addDatePicker.date
//        let newMemoItem  = cMemo(content: newMemoTitle, date: newMemoDate)
//        
//        //2. save as universal variable
//        self.newMemo = newMemoItem
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //1. get new item details: title and date
        let newMemoTitle = self.addTitleTextField.text!
        let newMemoDate  = self.addDatePicker.date
        let newMemoItem  = cMemo(content: newMemoTitle, date: newMemoDate)
        
        //2. save as universal variable
        self.newMemo = newMemoItem
    }

}
