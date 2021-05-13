Builder := Object clone

stack := list(0)
spaces := 4

Builder forward := method(
  stack println
  i := stack pop
  writeln(" " repeated(i * spaces) with("<", call message name, ">"))
  call message arguments foreach(
    arg,
    stack append(i + 1)
    content := doMessage(arg)
    if(content type == "Sequence", writeln(" " repeated(i * 2 * spaces) with(content))))
  writeln(" " repeated(i * spaces) with("</", call message name, ">")))

Builder ul(
  li("lo", li("a")),
  li("Lua"),
  li("JavaScript"))

// <ul>
// <li>
// lo
// </>li>
// <li>
// Lua
// </>li>
// <li>
// JavaScript
// </>li>
// </>ul>

// <ul>
//   <li>
//     lo
//   </>li>
//   <li>
//     Lua
//   </li>
//   <li>
//     JavaScript
//   </>li>
// </>ul>
