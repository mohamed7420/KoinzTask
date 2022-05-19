//
//  MovieListViewController.swift
//  KoinzTask
//
//  Created by Mohamed osama on 18/05/2022.
//

import UIKit

class MovieListViewController: BaseViewController , MovieListViewProtocol {
 
    @IBOutlet weak var tableView: UITableView!
    private var genericTableViewDataSource: GenericTableViewDataSource<Photo , MovieTableCell>?
    var presenter: MovieListPresenterProtocol?
    var page: Int = 1
    var totalPage: Int = 0
    var newPhotos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieListPresenter(view: self)
        presenter?.getAllPhotos(model: MoviePhoto(method: Constants.method, format: Constants.format, nojsoncallback: Constants.nojsoncallback, text: Constants.text, page: page, per_page: Constants.per_pag, api_key: Constants.api_key))
    }
    
    private func initTableView(items: [Photo]){
        genericTableViewDataSource = GenericTableViewDataSource.init(items: items, tableView: tableView, configureCollectionCell: {[weak self] cell, indexPath , item  in
            guard let self = self else {return}
            self.presenter?.configureCellView(cell: cell, for: indexPath.row)
            
        }, didSelectedItem: {[weak self] indexPath , item  in
            
            guard let _ = self else {return}
            
        }, willDisplayItems: {[weak self] cell, indexPath , item  in
            
            guard let self = self else {return}
            self.animateTableView(cell: cell)
            
        }, paginateItemsList: {[weak self] isDataLoading in
            guard let self = self else {return}
            self.paginateItems()
        })
    }
    
    
    private func paginateItems(){
        if ((self.tableView.contentOffset.y + self.tableView.frame.size.height) >= self.tableView.contentSize.height){
            print("Scrolling down")
            if self.page < self.totalPage{
                self.page += 1
                self.presenter?.getAllPhotos(model: MoviePhoto(method: Constants.method, format: Constants.format, nojsoncallback: Constants.nojsoncallback, text: Constants.text, page: self.page, per_page: Constants.per_pag, api_key: Constants.api_key))
                return
            }
            self.page = 1
        }
    }
    

    
    private func animateTableView(cell: MovieTableCell){
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
        }
    }

    func set(photos: [Photo]){
        newPhotos.append(contentsOf: photos)
        initTableView(items: newPhotos)
    }
    
    func set(totalPage: Int) {
        self.totalPage = totalPage
    }
    

    
    func refresh() {
        self.tableView.reloadData()
    }
    
}
