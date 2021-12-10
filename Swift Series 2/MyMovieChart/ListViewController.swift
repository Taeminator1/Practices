//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 윤태민 on 12/7/21.
//

import UIKit

// UITableViewcontroller 클래스는 UIViewController 클래스를 상속 받으며,
// UITableViewDelegate와 UITableViewDataSource 프로토콜을 따른다.
// - UITableViewDelegate: 사용자 액션 처리를 위한 Delegate
// - UITableViewDataSource: 데이터 소스를 연동하기 위한 Delegate
class ListViewController: UITableViewController {
    
    lazy var movieList: [MovieVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 호핀 API 호출을 위한 URI 생성
        let url = "http://115.68.183.178:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2. REST API 호출
        let apiData = try! Data(contentsOf: apiURI)
        
//        // 3. 데이터 전송 결과를 로그로 출력
//        print("API Result = \n\(NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? "")")
        
        // 4. JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                self.movieList.append(mvo)
            }
        } catch {
            print("Error")
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movieList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "ListCell"을 MovieCell 클래스와 연결해 줬으므로, 타입 캐스팅 필요
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell

        // Configure the cell...
        let row = self.movieList[indexPath.row]
        
        cell.thumbnail.image = UIImage(data: try! Data(contentsOf: URL(string: row.thumbnail!)!))
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.openDate?.text = row.openDate
        cell.rating?.text = "\(row.rating!)"
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK:- Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
}
