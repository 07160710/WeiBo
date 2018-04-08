//
//  VisitorTableViewController.swift
//  小峰微博
//
//  Created by Student on 17/9/20.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {
    
    private var userLogon = false
    var visitorView:VisitorView?
    override func loadView() {
        userLogon ? super.loadView() : setupVisitorView()
    }
    
    func setupVisitorView(){
        visitorView=VisitorView()
        view = visitorView
        //view.backgroundColor = UIColor.orange
        visitorView?.registerButton.addTarget(self, action: #selector(VisitorTableViewController.visitorViewDidRegister), for: .touchUpInside)
        visitorView?.loginButton.addTarget(self, action: #selector(VisitorTableViewController.visitorViewDidLogin), for: .touchUpInside)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

extension VisitorTableViewController{
    func visitorViewDidRegister(){
        print("注册")
    }
    func visitorViewDidLogin(){
        let vc = OAuthViewController()
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav,animated:true,completion:nil)
    }
}

