//
//  ViewController.swift
//  ReactiveTest
//
//  Created by Wind3 on 09/11/2017.
//  Copyright © 2017 Wind3. All rights reserved.
//

import UIKit
import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result
import ExpandableLabel

let test = "Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem enum."

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableLabelDelegate{

    @IBOutlet weak var labelView:ExpandableLabel!
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var button:UIButton!
    var signExt:SignalExt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        signExt = SignalExt()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        labelView.delegate  = self
        
        labelView.collapsed = true
        

        labelView.shouldExpand = true
        labelView.shouldCollapse = true
        
        //labelView.collapsedAttributedLink = NSAttributedString(string: "Read More")
        
        labelView.expandedAttributedLink = NSAttributedString(string: "Read Less")
        
        labelView.ellipsis = NSAttributedString(string: "...")
        
                labelView.text = test
        
        
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapLabel))
//        self.labelView.isUserInteractionEnabled = true
//        self.labelView.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Expanded Label Delegate
    func willExpandLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
        tableView.rowHeight = 200
        tableView.endUpdates()
        labelView.setLessLinkWith(lessLink: "Close", attributes: [NSForegroundColorAttributeName:UIColor.black], position: nil)
        labelView.layoutIfNeeded()
    }
    
    func willCollapseLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
        tableView.rowHeight = 100
        tableView.endUpdates()
    }
    
    func didExpandLabel(_ label: ExpandableLabel) {
  
        tableView.beginUpdates()
        tableView.rowHeight = 200
        tableView.endUpdates()
        labelView.setLessLinkWith(lessLink: "Close", attributes: [NSForegroundColorAttributeName:UIColor.black], position: nil)
        labelView.layoutIfNeeded()
        
    }
    
    func didCollapseLabel(_ label: ExpandableLabel) {
        tableView.beginUpdates()
        tableView.rowHeight = 100
        tableView.endUpdates()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelTableViewCell
        
        cell.label.text = test
        cell.label.delegate = self
        
        return cell
        
    }
    
    
    
    @IBAction func didPressButton(sender:UIButton){
        

    }
    

}

