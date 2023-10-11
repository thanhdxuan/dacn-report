#{ include "/contents/01-bia.typ" }
#pagebreak()
#set heading(numbering: "1.")
#outline(
   indent: 1.5em,
)

#outline(title: "Danh mục hình ảnh", target: figure.where(kind: image))
// #outline(title: "Danh mục chương trình", target: figure.where(kind: raw))
#pagebreak()
#{ include "/contents/02-introduce.typ" }
#{ include "/contents/03-datacollection.typ" }
#{ include "/contents/04-system-requirements.typ"}
#{ include "/contents/05-use-case-diagram.typ"}
#{ include "/contents/06-plan.typ"}
#pagebreak()
#bibliography("/ref.bib")
