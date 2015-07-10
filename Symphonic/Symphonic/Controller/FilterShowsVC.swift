
//
// Created by Makar Stetsenko on 09.07.15.
// Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import Foundation
import UIKit

class FilterShowsVC : UIViewController {
    weak var delegate: SearchFiltering?

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var typePicker: UIPickerView!

    private let pickerTypeData = ["Any", "Theater", "Opera"]
    private let pickerTypeForIdx = [Type.Any, Type.Theater, Type.Opera]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        if let delegate = self.delegate {
            delegate.didEndSelectingFilter(date: datePicker.date,
                    type: pickerTypeForIdx[typePicker.selectedRowInComponent(0)])
        }
        close()
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        close()
    }

    private func close() {
        self.parentViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension FilterShowsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerTypeData[row]
    }
}

