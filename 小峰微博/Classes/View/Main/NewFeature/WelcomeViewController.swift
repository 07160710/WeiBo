//
//  WelcomeViewController.swift
//  小峰微博
//
//  Created by apple on 17/11/23.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class WelcomeViewController: UIViewController {
    override func loadView() {
        view = backImageView
        setupUI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        iconView.snp_updateConstraints { (make) in
            make.bottom.equalTo(view.snp_bottom)
            .offset(-view.bounds.height + 200)
        }
        welcomeLabel.alpha = 0
        UIView.animate(withDuration: 1.2,delay:0,usingSpringWithDamping:0.8,initialSpringVelocity:10,options: [],animations:{
            self.view.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 0.8,animations:{
                self.welcomeLabel.alpha = 1
            },completion: { (_) in
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        iconView.sd_setImage(with: UserAccountViewModel.sharedUserAccount.avatarUrl as URL,placeholderImage:UIImage(named:"avatar_default_blg"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public lazy var backImageView:UIImageView = UIImageView(imageName:"ad_background")
    public lazy var iconView:UIImageView = {
        let iv = UIImageView(imageName:"avatar_default_big")
        iv.layer.cornerRadius = 45
        iv.layer.masksToBounds = true
        return iv
    }()
    public lazy var welcomeLabel:UILabel = UILabel(title:"欢迎回来,你这个傻逼",fontSize:18)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WelcomeViewController{
    public func setupUI(){
        view.addSubview(iconView)
        iconView.snp_makeConstraints{ (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.bottom.equalTo(view.snp_bottom).offset(-200)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        view.addSubview(welcomeLabel)
        welcomeLabel.snp_makeConstraints{ (make) in
            make.centerX.equalTo(iconView.snp_centerX)
            make.top.equalTo(iconView.snp_bottom).offset(16)
        }
        }
}
