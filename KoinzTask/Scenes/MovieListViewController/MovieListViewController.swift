//
//  MovieListViewController.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var genericTableViewDataSource: GenericTableViewDataSource<Movie , MovieTableCell>?

    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    private func initTableView(){
        genericTableViewDataSource = GenericTableViewDataSource.init(items: Movie.fetchAllMovies(), tableView: tableView, configureCollectionCell: {[weak self] cell, indexPath , item  in
            guard let _ = self else {return}
            
            
        }, didSelectedItem: {[weak self] indexPath , item  in
            
            guard let _ = self else {return}
            
        }, willDisplayItems: {[weak self] cell, indexPath , item  in
            
            guard let self = self else {return}
            self.animateTableView(cell: cell)

        })
    }
    
    private func animateTableView(cell: MovieTableCell){
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
        }
    }

}
