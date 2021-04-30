TwoDimList := Object clone

TwoDimList dim := method(x, y,
                self innerList := list()
                for(i, 1, y, innerList append(list() setSize(x))))

TwoDimList set := method(x, y, value,
                    innerList at(x) atPut(y, value))

TwoDimList get := method(x, y,
                    innerList at(x) at(y))

 TwoDimList transpose := method(
                            y := innerList size
                            x := innerList at(0) size
                            tranposedTwoDimList := TwoDimList clone
                            tranposedTwoDimList dim(y, x)
                            for(i, 0, y-1,
                                for(j, 0, x-1,
                                    element := get(i, j)
                                    if (element != nil, tranposedTwoDimList set(j, i, element))))
                            tranposedTwoDimList)

myList := TwoDimList clone
myList dim(4, 5) 

myList2 := TwoDimList clone
myList2 dim(2, 2) 

myList innerList println
"------" println
myList2 innerList println

"------" println
myList2 set(0, 0, "a")
myList2 set(0, 1, "b")
myList2 set(1, 0, 3)
myList2 set(1, 1, 4)
myList innerList println

"------" println
myList get(0, 2) println

"------" println
newList := myList transpose
newList innerList println
myList get(0, 2) println
newList get(2, 0) println
(myList get(0, 2) == newList get(2, 0)) println

f := File with("foo.txt")
f remove
f openForUpdating
f write(myList2 serialized)     
f close

myListFromFile := TwoDimList doFile("foo.txt")
myListFromFile innerList println