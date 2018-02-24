//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by lb. on 2018/2/24.
//  Copyright © 2018年 karubi. All rights reserved.
//
//http://mp.weixin.qq.com/s?srcid=0214gYF8FtPLDvyIUhoQu5pF&scene=23&mid=2652558469&sn=82a212f778c598f6ddbc589f1469719b&idx=1&__biz=MjM5OTM0MzIwMQ%3D%3D&chksm=bcd2918b8ba5189d4a0477f5a8283945cf960575f783721a47c7c4f0a4e06b2a8ece9c305dc1&mpshare=1#rd


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableview:UITableView?
    var dataArr:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = ["这是第一行","这是第二行","看看还有啥"]
        tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        self.view.addSubview(tableview!)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    /*
     实现方法是在TableView加载后增加整体的动效，通过循环和延迟，让每个Cell从不同的时间开始经历相同的时间动效结束。
     */
    
    func animateTable() {
        
        let cells = tableview?.visibleCells
        
        let tableHeight: CGFloat = tableview!.bounds.size.height
        
        for (index, cell) in (cells?.enumerated())! {
            
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                
            }, completion: nil)
            
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataArr?.count != 0 {
            return (dataArr?.count)!
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview?.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Cell")
            cell.textLabel?.text = dataArr?[indexPath.row]
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = .black
            cell.textLabel?.textColor = .white
            return cell
        }
        cell?.textLabel?.text = dataArr?[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("fuck")
    }

    //=============
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        UIView.beginAnimations(nil, context: nil)
        
        UIView.setAnimationDuration(0.1) //设置动画时间
        
        cell?.transform =  CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.commitAnimations()
        
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        UIView.beginAnimations(nil, context: nil)
        
        UIView.setAnimationDuration(0.1) //设置动画时间
        
        cell?.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        UIView.commitAnimations()
        
    }
    
    //=============
}

