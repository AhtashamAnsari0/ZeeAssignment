//
//  SearchCell.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//

/**UITableView Cell Used to display recent search queries*/
import UIKit

class SearchCell: UITableViewCell {
    
    /**UILabel Used to  display search query*/
    @IBOutlet weak var labelSearchText: UILabel!

    // MARK: - Life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
