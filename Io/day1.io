Person := Object clone
Person greeting := method("Hello" println)
Person foo := method("Bar" println)
Person execute := method(methodName, 
                            methodToExcute := Person getSlot(methodName)
                            methodToExcute())

lucas := Person clone
lucas execute("greeting")
lucas execute("foo")
