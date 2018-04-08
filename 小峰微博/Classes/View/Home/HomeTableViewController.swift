//
//  HomeTableViewController.swift
//  小峰微博
//
//  Created by Student on 17/9/13.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class HomeTableViewController: VisitorTableViewController {
    private let StatusCellNormalId = "StatusCellNormalId"
    private lazy var listViewModel = StatusListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //visitorView?.setupInfo(imageName: nil, title: "关注一些人，回这里看看有什么惊喜")
        if !UserAccountViewModel.sharedUserAccount.userLogin{
            visitorView?.setupInfo(imageName: nil, title: "关注一些人，回这里看看有什么惊喜")
            return
        }
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listViewModel.statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatusCellNormalId, for: indexPath)
        cell.textLabel?.text = listViewModel.statusList[indexPath.row].status.user?.screen_name
        return cell
    }
    
    public func loadData(){
        /*
        NetworkTools.sharedTools.loadStatus{
            (result,error) -> () in
            if(error != nil){
                print("错了")
                return
            }
            print(result)
        }
       */
        listViewModel.loadStatus{
            (isSuccessed) -> () in
            if !isSuccessed
            {
                return
            }
            print(self.listViewModel.statusList)
            self.tableView.reloadData()
        }
    }
    private func prepareTableView(){
        tableView.register(UITableViewCell.self,forCellReuseIdentifier:StatusCellNormalId)
    }
}
extension HomeTableViewController
{
    
}
