//
//  SearchCategoryViewController+UIPickerView.swift
//  Vimster
//
//  Created by Alex Song on 2/13/17.
//  Copyright © 2017 LexCorp. All rights reserved.
//

import UIKit

extension SearchCategoryViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return VimsterConstants.SearchCategory.categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCategory = VimsterConstants.SearchCategory.categories[row]
    }

}

extension SearchCategoryViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return VimsterConstants.SearchCategory.categories.count
    }

}
