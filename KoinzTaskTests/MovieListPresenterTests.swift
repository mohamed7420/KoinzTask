//
//  MovieListPresenterTests.swift
//  KoinzTaskTests
//
//  Created by Mohamed osama on 19/05/2022.
//


import XCTest
@testable import KoinzTask

class MovieListPresenterTest: XCTestCase {
    
    var sut: MovieListPresenter!
    
    override func setUpWithError() throws {
        sut = MovieListPresenter(view: MovieListViewController())

    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testNumberOfItems()  {
        //Arrange
        //act
        let photoNumber = sut.getPhotoCount()
        //assert
        XCTAssertEqual(photoNumber, 0)
    }
    
 
    
}
