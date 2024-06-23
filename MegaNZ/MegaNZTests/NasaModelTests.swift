//
//  NasaModelTests.swift
//  MegaNZTests
//
//  Created by Ashok Domadiya on 23/06/24.
//

@testable import MegaNZ
import XCTest


final class NasaModelTests: XCTestCase {
    
    private var vm : NasaModel!
    
    override func setUp() {
        vm = NasaModel()
    }
    
    override func tearDown() {
        vm = nil
    }
    
    func testShouldNasaArrayShouldBeEmptyInitially() {
        // given
        
        // when
        let nasaVM = NasaModel()
        
        // then
        XCTAssertTrue(nasaVM.nasa.isEmpty, "Initially nasa array should be emply")
        XCTAssertEqual(nasaVM.nasa.count,0)
    }
    
    func testShouldStartDateShouldBeToday() {
        // given
        let expected = Calendar.current.startOfDay(for: Date())
        // when
        let nasaVM = NasaModel()
        let dateRange = nasaVM.getRequestDate()
        // then
        XCTAssertEqual(dateRange.0, expected)
    }
    
    func testShouldEndDateShouldBeSevenDaysEarlierThanToday() {
        // given
        let today = Calendar.current.startOfDay(for: Date())
        let expectedDate = Calendar.current.date(byAdding: .day, value: -6, to: today)!
//        let expectedDate = Calendar.current.date(byAdding: .day, value: -5, to: today)!
        
        // when
        let nasaVM = NasaModel()
        let dateRange = nasaVM.getRequestDate()
        
        // then
        XCTAssertEqual(dateRange.1, expectedDate)
    }
    
    func testShouldNasaArrayShouldHaveSevenObject() async {
        // given
        
        // when
        await vm.fetchData()
        
        // then
        //XCTAssertEqual(vm.nasa.count, 2,"There should be two objects if Mock data url is there")
        XCTAssertEqual(vm.nasa.count, 7,"There should be seven objects if live data url is there")
    }
    
    
}
