//
//  CollectionViewController.swift
//  CreateQRCode
//
//  Created by Peddinti,Suresh Chandra on 11/13/19.
//  Copyright © 2019 Peddinti,Suresh Chandra. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ParkingLotArray._shared.parkingLots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkingDetails", for: indexPath)
        let parkingValues = ParkingLotArray._shared[indexPath.row]
           cell.textLabel?.text = parkingValues.parkingSlot
        cell.detailTextLabel?.text = "\(parkingValues.parkingDirection),\(parkingValues.superMarketName)"
            cell.imageView?.image = parkingValues.qrCode
            return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
