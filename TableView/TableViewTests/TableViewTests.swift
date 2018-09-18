//
//  TableViewTests.swift
//  TableViewTests
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import XCTest
@testable import TableView

class TableViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTaskManagerInsertTask() {
        let t1 = Task()
        t1.id = 1
        t1.name = "t1"
        t1.description = "t1 desc"

        TaskManager.shared.saveOrUpdate(task: t1)
        let foundTask = TaskManager.shared.getTask(with: t1.id)
        XCTAssert(foundTask != nil)
    }

    func testTaskManagerGetTaskById() {
        let t1 = Task()
        t1.id = 1
        t1.name = "t1"
        t1.description = "t1 desc"

        TaskManager.shared.saveOrUpdate(task: t1)
        let foundTask = TaskManager.shared.getTask(with: t1.id)
        XCTAssert(foundTask != nil)
    }

    func testTaskManagerUpdateTask() {

        let t1 = Task()
        t1.id = 1
        t1.name = "t1"
        t1.description = "t1 desc"

        TaskManager.shared.saveOrUpdate(task: t1)

        t1.name = "edited name t1"
        TaskManager.shared.saveOrUpdate(task: t1)

        let foundTask = TaskManager.shared.getTask(with: t1.id)
        XCTAssert(foundTask?.name == "edited name t1")
    }

    func testTaskManagerDeleteTask() {
        let t1 = Task()
        t1.id = 1
        t1.name = "t1"
        t1.description = "t1 desc"

        TaskManager.shared.saveOrUpdate(task: t1)
        let foundTask = TaskManager.shared.getTask(with: t1.id)
        XCTAssert(foundTask != nil)

        _ = TaskManager.shared.remove(task: t1)
        XCTAssert(foundTask == nil)
    }

    func testTaskManagerDeleteAllTasks() {
        let t1 = Task()
        t1.id = 1
        t1.name = "t1"
        t1.description = "t1 desc"

        TaskManager.shared.saveOrUpdate(task: t1)
        TaskManager.shared.removeAll()
        XCTAssert(TaskManager.shared.tasks.count == 0)
    }
    
}
