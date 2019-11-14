//
//  ViewController.swift
//  CreateQRCode
//
//  Created by Peddinti,Suresh Chandra on 11/13/19.
//  Copyright © 2019 Peddinti,Suresh Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ViewController.imageArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "QRCodeList", for: indexPath)
//        cell.textLabel?.text = myTextField.text
//        cell.imageView?.image = ViewController.imageArray[indexPath.row]
//        return cell
//    }
    

    @IBOutlet weak var myTextField:UITextField!
    @IBOutlet weak var myImageView:UIImageView!
    @IBOutlet weak var Button1:UIButton!
    
    @IBOutlet weak var superMarketTF:UITextField!
    @IBOutlet weak var parkingLocationTF:UITextField!
    
    static var imageArray:[UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Button2.isEnabled = false
//        tableView.delegate = self
//        tableView.dataSource = self
    }

    @IBAction func add(_sender:Any){
        ParkingLotArray._shared.parkingLots.append(ParkingLot(superMarketName: superMarketTF.text!, parkingDirection: parkingLocationTF.text!, parkingSlot: myTextField.text!, qrCode: myImageView.image!, isOccupied: false))
        screenShotMethod()
            self.dismiss(animated: true,completion:nil)
    }
    
    @IBAction func cancel(_sender:Any){
        self.dismiss(animated: true,completion:nil)
    }
    
    @IBAction func button(_sender:Any){
        if let myString = myTextField.text
        {
            let data = myString.data(using: .ascii,allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
            
            let ciImage = filter?.outputImage
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = (ciImage?.transformed(by: transform))!
            
            let image = UIImage(ciImage: transformImage)
            myImageView.image = image
            
        }
    }
    
//    @IBAction func buttonScreenShot(_sender:Any){
//        screenShotMethod();
//    }
    
    func screenShotMethod(){
//        ViewController.imageArray.append(myImageView.image!)
//        tableView.reloadData()
        
        let layer = UIApplication.shared.keyWindow?.layer
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions((layer?.frame.size)!, false, scale)
        
        layer?.render(in: UIGraphicsGetCurrentContext()!)
        
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
    }

}

