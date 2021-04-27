//
//  APODViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

class APODViewController: UIViewController {

    let asteroidsURLString = "https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=ygb6IV1iFYIedFsI9w8EveMjUl33pwYCGodduqB9"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // Do any additional setup after loading the view.
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
