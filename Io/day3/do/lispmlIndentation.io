Builder := Object clone

indentationLevel := 0
spaces := 2

Builder forward := method(
  actualLevel := indentationLevel
  writeln(" " repeated(actualLevel * spaces) with("<", call message name, ">"))
  call message arguments foreach(
    arg,
    indentationLevel = actualLevel + 1
    content := doMessage(arg)
    if(content type == "Sequence", writeln(" " repeated(actualLevel * 2 * spaces) with(content))))
  writeln(" " repeated(actualLevel * spaces) with("</", call message name, ">")))

Builder ul(
  li("Io"),
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
