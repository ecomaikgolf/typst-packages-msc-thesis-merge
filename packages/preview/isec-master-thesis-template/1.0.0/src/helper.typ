// --------------------------------------------------------------------------
// Extra helper functions

// Fix for typst #311 "Behavior of first line indentation in paragraphs ..." 
// https://github.com/typst/typst/issues/311#issuecomment-2023038611
#let fix_311 = context {
  let a = par(box())
  a
  v(-0.8 * measure(2 * a).width)
}

// Transforms content into string
#let content_to_string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(content_to_string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

// partitle simulates \paragraph{title} (more or less)
#let partitle(title: [Title], body) = context [
  #block(above: 0.8cm)[
    *#title* #h(0.3cm) #body
  ]
  #fix_311
]
