f := File with("foo.txt")
#f remove
f openForUpdating
f write("hello world!")
f close
