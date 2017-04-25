//
//  SwiftReactiveTextFieldTests.swift
//  SwiftReactiveTextFieldTests
//
//  Created by Hai Pham on 4/26/17.
//  Copyright © 2017 Swiften. All rights reserved.
//

import RxSwift
import RxCocoa
import RxTest
import RxBlocking
import SwiftUtilities
import SwiftUtilitiesTests
import XCTest

class UIReactiveTextFieldTests: XCTestCase {
    fileprivate var disposeBag: DisposeBag!
    fileprivate var scheduler: TestScheduler!
    fileprivate let expectationTimeout: TimeInterval = 5
    
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
    }
    
    func test_setText_shouldNotifyObservers() {
        // Setup
        let textField = UIReactiveTextField()
        let array = (0..<100).flatMap(String.init)
        let observer = scheduler.createObserver(String.self)
        
        // When
        textField.rxText!
            .asObservable()
            .skip(1)
            .map({$0 ?? ""})
            .subscribe(observer)
            .addDisposableTo(disposeBag)

        array.forEach({textField.text = $0})
        
        // Then
        XCTAssertEqual(observer.nextElements(), array)
    }
}
