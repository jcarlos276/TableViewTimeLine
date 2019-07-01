//
//  ViewController.swift
//  TimeLine
//
//  Created by Juan Carlos Guillén Castro on 6/29/19.
//  Copyright © 2019 Juan Carlos Guillén Castro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timeLineTableView: UITableView!
    var dates: [Date] = [] {
        didSet {
            timeLineTableView.reloadData()
        }
    }
    var fetchMore = false
//    var isACellSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        for i in -3...3 {
            let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: date) ?? Date()
            dates.append(modifiedDate)
        }
        print(dates)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeLineTableView.dequeueReusableCell(withIdentifier: "TimeLineDateTableViewCell") as! TimeLineDateTableViewCell
        cell.date = dates[indexPath.row]
//        cell.isACellSelected = isACellSelected
        cell.loadContent()
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isACellSelected = !isACellSelected
//        timeLineTableView.reloadData()
//        let cell = tableView.cellForRow(at: indexPath) as! TimeLineDateTableViewCell
//        cell.isThisCellSelected = !cell.isThisCellSelected
//        cell.layoutView()
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height * 2 {
            if !fetchMore {
                beginBatchFetch()
            }
        }
    }
    
    func beginBatchFetch() {
        fetchMore = true
        print("begintBatchFetch!")
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            self.fetchMore = false
            var newDates: [Date] = []
            for i in 1...7 {
                let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: self.dates.last ?? Date()) ?? Date()
                newDates.append(modifiedDate)
            }
            self.dates.append(contentsOf: newDates)
        })
    }

}

