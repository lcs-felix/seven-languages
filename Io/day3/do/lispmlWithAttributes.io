OperatorTable addAssignOperator(":", "getAttribute")

curlyBrackets := method(
    call message arguments foreach(arg, doMessage(arg))
)

getAttribute := method(
  " " with(call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    "=",
    "\"", call evalArgAt(1), "\"")
)

Builder := Object clone

indentationLevel := 0
spaces := 2

Builder forward := method(
  actualLevel := indentationLevel

  firstArg := call message argAt(0)
  isCurlyBrackets :=  firstArg name == "curlyBrackets"
  
  attribute := if(isCurlyBrackets,     
    call message setArguments(call message arguments rest)
    doString(firstArg code),
    "")

  writeln(" " repeated(actualLevel * spaces) with("<", call message name, attribute, ">"))
  call message arguments foreach(
    arg,
    indentationLevel = actualLevel + 1
    content := doMessage(arg)
    if(content type == "Sequence", writeln(" " repeated(actualLevel * 2 * spaces) with(content))))
  writeln(" " repeated(actualLevel * spaces) with("</", call message name, ">")))

Builder book({"author": "Tate"})


// <ul class="hide">
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

