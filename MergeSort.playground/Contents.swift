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
    
    // now we have everything so we combine it back together
    return merge(leftArray: leftArray, rightArray: rightArray)
    
    
}

fileprivate func merge(leftArray:[Int], rightArray:[Int]) -> [Int] {
    
    var leftIndex = 0
    var rightIndex = 0
    
    //create an array to return later and ensure that it has enough space from the start so as to save space in memory
    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftArray.count + rightArray.count)
    
    //while there is something in both arrays to compare then keep sorting
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            orderedPile.append(leftArray[leftIndex])
            leftIndex += 1
        } else if leftArray[leftIndex] > rightArray[rightIndex] {
            orderedPile.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftArray[leftIndex])
            leftIndex += 1
            orderedPile.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    //these two statements catch anything should one array be longer than the other
    while leftIndex < leftArray.count {
        orderedPile.append(leftArray[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightArray.count {
        orderedPile.append(rightArray[rightIndex])
        rightIndex += 1
    }
    print(orderedPile)
    return orderedPile
}

mergeSort([5675,4,32,4,67,7,5,4,32,3,5,767,87,6])
