// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ArrayLib {
    function Sort(uint[] storage arr) internal {
        uint n = arr.length;
        bool swapped;
        do {
            swapped = false;
            for (uint i = 1; i < n; i++) {
                if (arr[i - 1] > arr[i]) {
                    (arr[i - 1], arr[i]) = (arr[i], arr[i - 1]);
                    swapped = true;
                }
            }
        } while (swapped);
    }

    function removeDuplicatesFromArray(uint[] storage arr) internal {
        uint itemCount = arr.length;
        if (itemCount == 0) return;

        uint lastUniqueIndex = 0;
        for (uint i = 1; i < itemCount; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j <= lastUniqueIndex; j++) {
                if (arr[i] == arr[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                lastUniqueIndex++;
                arr[lastUniqueIndex] = arr[i];
            }
        }

        // Clear the array by reducing its length
        for (uint i = itemCount - 1; i > lastUniqueIndex; i--) {
            arr.pop();
        }
    }
}

contract ArrayManipulation {
    using ArrayLib for uint[];

    uint[] public arr;

    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function sortArray() public {
        arr.Sort();
    }

    function removeDuplicates() public {
        arr.removeDuplicatesFromArray();
    }

    function getArray() public view returns (uint[] memory) {
        return arr;
    }
}
