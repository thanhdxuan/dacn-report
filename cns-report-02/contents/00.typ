#{ include "/contents/01-bia.typ" }
#pagebreak()
#set heading(numbering: "1.")
#outline(
   indent: 1.5em,
)

#show raw: set text(font: "Fira Code")

#outline(title: "Danh mục hình ảnh", target: figure.where(kind: image))
// #outline(title: "Danh mục chương trình", target: figure.where(kind: raw))
#pagebreak()
#{ include "/contents/02-Kali.typ" }
#{ include "/contents/03-CentOS.typ" }
#pagebreak()
#bibliography("/ref.bib")
