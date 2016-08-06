//
//  ViewController.swift
//  myMemo
//
//  Created by 梁佳玉 on 16/8/2.
//  Copyright © 2016年 梁佳玉. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITableViewDataSource,UITableViewDelegate{
    
    let titleArray  = ["Date","Color","Course"]
    let dateArray   = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    let colorArray  = ["Red","Yellow","Pink","Blue","Green"]
    let courseArray = ["Math","English","Computer","Chinese","Music","Gym"]
    
    var memoList = [cMemo]()
    
    @IBOutlet weak var schTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let memo1 = cMemo(content: "Go to the zoo")
        let memo2 = cMemo(content: "Go to the Summer Palace")
        let memo3 = cMemo(content: "Back home")
        
        memo1.description = "再过一个月，举世瞩目的G20峰会就要在杭州召开。这是近些年来，中国举办的又一次世界级的大会，为中国参与世界治理、贡献中国智慧提供了非常好的契机和平台。2013年以来，习近平参加过3次G20峰会，分别在俄罗斯圣彼得堡、澳大利亚布里斯班、土耳其安塔利亚举行。其实，习近平在多个外事场合都谈到过G20，并向相关国家的首脑发出诚挚邀请。习近平怎么谈G20？举办这次峰会对中国又有什么重大意义？再过一个月，举世瞩目的G20峰会就要在杭州召开。这是近些年来，中国举办的又一次世界级的大会，为中国参与世界治理、贡献中国智慧提供了非常好的契机和平台。2013年以来，习近平参加过3次G20峰会，分别在俄罗斯圣彼得堡、澳大利亚布里斯班、土耳其安塔利亚举行。其实，习近平在多个外事场合都谈到过G20，并向相关国家的首脑发出诚挚邀请。习近平怎么谈G20？举办这次峰会对中国又有什么重大意义？"
        memo2.description = "赖斯转达了奥巴马总统对习近平的问候，表示奥巴马总统期待着9月来华出席二十国集团杭州峰会并同习近平主席再次举行会晤。赖斯表示，习近平主席对美中关系的看法同奥巴马总统十分相近。奥巴马总统始终认为，美中关系是当今世界最重要的双边关系。中国的成功符合美国的利益。美中双方携手合作，可以为国际社会应对气候变化等一系列全球性挑战注入活力。美方赞同通过共同努力增进双方互信，加强务实合作并使之成为美中关系的压舱石，愿同中方密切沟通有效管控分歧。"
        memo3.description = "新浪新闻在里约奥运期间，推出专题策划《陪练的他》，以陪练群像的数据开场，以真实白描的陪练故事渲染，用深情的独家原创歌曲引向高潮。从“数据·陪练群像”、“特写·走近他们”、“歌曲·陪练的他”三个维度去关注荣耀背后的付出者，光荣同样属于他们。"
        
       
        self.memoList.append(memo1)
        self.memoList.append(memo2)
        self.memoList.append(memo3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Header and Footer
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section >= titleArray.count{
            return "NG: titleForHeaderInSection"
        }
        return self.titleArray[section]
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == self.titleArray.count-1{
            return "~~ Days of my life ~~"
        }
        return ""
    }
    
    // Set number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.titleArray.count
    }
    
    // Set number of rows in each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            
        case 0:
//            return self.dateArray.count
            return self.memoList.count
            
        case 1:
            return self.colorArray.count
            
        case 2:
            return self.courseArray.count
            
        default:
            return 0
        }
    }

    
    // Cell contexts
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "Are you hungry ?"

        let cell = tableView.dequeueReusableCellWithIdentifier("memoCell", forIndexPath: indexPath)
        switch indexPath.section {
        case 0:
//            cell.textLabel?.text = self.dateArray[indexPath.row]
            let memo = self.memoList[indexPath.row]
            cell.textLabel?.text = memo.content
//            cell.detailTextLabel?.text = memo.time.description
            cell.detailTextLabel?.text = memo.time.descriptionWithLocale(NSLocale.currentLocale())
            break;
            
        case 1:
            cell.textLabel?.text = self.colorArray[indexPath.row]
            cell.detailTextLabel?.text = "Happy"
            break;
            
        case 2:
            cell.textLabel?.text = self.courseArray[indexPath.row]
            cell.detailTextLabel?.text = "Happy"
            break;
            
        default:
            cell.textLabel?.text = "NG"
            break;
        }
        
        // Detail text
//        cell.detailTextLabel?.text = "Happy"
        return cell
    }
    
    // Make section title index
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return self.titleArray
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueShowDetail" {
            let destination = segue.destinationViewController as! MemoDetailTableViewController
            destination.memo = self.memoList[self.schTableView.indexPathForSelectedRow!.row]
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        let addViewController = segue.sourceViewController as! AddViewController
        let newMemo = addViewController.newMemo
        
        self.memoList.append(newMemo)
        self.schTableView.reloadData()
        
    }
}

