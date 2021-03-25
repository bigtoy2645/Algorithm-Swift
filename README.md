# Algorithm-Swift
Practice algorithms and data structures in Swift

## Int
### 자릿수 별로 Array에 담기
```
// 123 -> [1, 2, 3]
func solution(_ num: Int) -> [Int] {
    return String(num).map{ $0.hexDigitValue! }
}

// 123 -> [3, 2, 1]
func solution(_ num: Int) -> [Int] {
    return String(num).reversed().map{ $0.hexDigitValue! }
}
```

## Int Array
### String 출력하기
```
// [1, 2, 3] -> "1 2 3"
func solution(_ nums: [Int]) -> String {
    return nums.map { String($0) }.joined(separator: " ")
}
```

## String
### String Array로 분리하기
```
// "ABC" -> ["A", "B", "C"]
func solution(_ str: String) -> [String] {
    return str.unicodeScalars.map(String.init)
}

// "A B C" -> ["A", "B", "C"]
func solution(_ str: String) -> [String] {
    return str.split(seperator:" ")
}
```
