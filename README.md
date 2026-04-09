# uiscsi-tools

Command-line utilities for iSCSI storage, built on [uiscsi](https://github.com/uiscsi/uiscsi) and [uiscsi-tape](https://github.com/uiscsi/uiscsi-tape).

## Tools

### uiscsi-ls

Discover iSCSI targets and list LUNs in lsscsi-style format.

```sh
go install github.com/uiscsi/uiscsi-tools/cmd/uiscsi-ls@latest

uiscsi-ls --portal 192.168.1.100
uiscsi-ls --portal 192.168.1.100 --json
uiscsi-ls --portal 192.168.1.100 --chap-user admin --chap-secret s3cret
```

### uiscsi-tape-dd

dd-like tool for streaming data between local files and iSCSI-attached tape drives.

```sh
go install github.com/uiscsi/uiscsi-tools/cmd/uiscsi-tape-dd@latest

# Write file to tape:
uiscsi-tape-dd -portal 192.168.1.100:3260 -target iqn.example:tape -if data.bin -bs 524288

# Read from tape to file:
uiscsi-tape-dd -portal 192.168.1.100:3260 -target iqn.example:tape -of data.bin -bs 524288 -sili

# Pipe:
cat data.bin | uiscsi-tape-dd -portal ... -target ... -if -
uiscsi-tape-dd -portal ... -target ... -of - | dd of=data.bin
```

## Building

```sh
# Build all tools:
go build ./cmd/...

# Build specific tool:
go build ./cmd/uiscsi-ls
go build ./cmd/uiscsi-tape-dd
```

## Requirements

- Go 1.25 or later
- [github.com/uiscsi/uiscsi](https://github.com/uiscsi/uiscsi) v1.3.0
- [github.com/uiscsi/uiscsi-tape](https://github.com/uiscsi/uiscsi-tape) v0.3.0 (for tape tools)
