# Domain model

## See list of bookmarks

```flow
alias cl = "Client"
alias co = "Controller"
alias m  = "Model"
alias v  = "View"

cl->co: "GET '/bookmarks'"
co->m: "show_bookmarks"
m-->co: "bookmarks"
co->v: "requests HTML"
v-->co: "HTML"
co-->cl: "returns bookmarks within HTML"
```
