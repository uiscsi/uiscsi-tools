module github.com/rkujawa/uiscsi-tools

go 1.25

// Development replace directives — remove before publishing.
replace github.com/rkujawa/uiscsi => ../uiscsi-repo

replace github.com/rkujawa/uiscsi-tape => ../uiscsi-tape

require (
	github.com/rkujawa/uiscsi v1.3.0
	github.com/rkujawa/uiscsi-tape v0.3.0
)
