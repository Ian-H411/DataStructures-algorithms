import UIKit

// merge sort Complexity is N log N so pretty good

func mergeSort(_ array: [Int]) -> [Int] {
    //this will check that we have more than one item so we know that we need to stop the algoritm if we hit this point
    guard array.count > 1 else {return array}
    
    //find where the middle is of the array
    let middleIndex = array.count / 2
    
    //and then split the array into two
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return
    
    
}

fileprivate func merge(leftArray:[Int], rightArray:[Int]) {
    
    var leftIndex = 0
    var rightIndex = 0
    
    //create an array to return later and ensure that it has enough space from the start so as to save space in memory
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftArray.count + rightArray.count)
}
