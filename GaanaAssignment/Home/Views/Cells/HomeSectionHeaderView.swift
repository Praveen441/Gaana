//
//  HomeSectionHeaderView.swift
//  GaanaAssignment
//
//  Created by praveen.agnihotri on 18/12/20.
//

import UIKit

protocol HomeSectionHeaderViewProtocol: class {
    func seeAllActionClicked(sectionIndex: Int?)
}

class HomeSectionHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var seeAllBtn: UIButton!
    
    weak var delegate: HomeSectionHeaderViewProtocol?
    var sectionIndex: Int?
    
    override func awakeFromNib() {
        seeAllBtn.layer.cornerRadius = 12
    }
    
    override class func description() -> String {
        return "HomeSectionHeaderView"
    }
    
    func configureView(sectionCellVM: SectionCellViewModel, section: Int) {
        title.text = sectionCellVM.name ?? ""
        sectionIndex = section
    }
    
    override func prepareForReuse() {
        title.text = nil
    }
    
    @IBAction func seeAllAction(_ sender: UIButton) {
        delegate?.seeAllActionClicked(sectionIndex: sectionIndex)
    }
}
