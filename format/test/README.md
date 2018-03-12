Script `format_all.sh` retrieves all CHC benchmark repos from https://github.com/chc-comp, and runs the format script on each benchmark. It stops at the first error.

Benchmarks in `check_ok` are expected to pass the format script check (`--check True`), while those in `check_err` are not.