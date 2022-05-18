//
//  MovieListViewController.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import UIKit

class MovieListViewController: BaseViewController , MovieListViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var genericTableViewDataSource: GenericTableViewDataSource<MovieListResponse , MovieTableCell>?
    var presenter: MovieListPresenterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieListPresenter(view: self)
        presenter?.getAllPhotos(model: MoviePhoto(method: "flickr.photos.search", format: "json&nojsoncallback", nojsoncallback: 50, text: "Color", page: 1, per_page: 20, api_key: "d17378e37e555ebef55ab86c4180e8dc"))
        
        initTableView()
    }
    
    private func initTableView(){
        genericTableViewDataSource = GenericTableViewDataSource.init(items: [], tableView: tableView, configureCollectionCell: {[weak self] cell, indexPath , item  in
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

    
    
    func refresh() {
        
    }
    
}
