.PHONY: exec-sample
exec-sample:
	./bin/issues elixir-lang elixir 3

.PHONY: run-sample
run-sample:
	mix run -e 'Issues.CLI.main(["elixir-lang", "elixir"])'

.PHONY: build
build:
	mix escript.build

.PHONY: get
get:
	mix deps.get

.PHONY: docs
docs:
	mix docs

.PHONY: test
test:
	MIX_ENV=test mix test

.PHONY: console
console:
	iex -S mix
