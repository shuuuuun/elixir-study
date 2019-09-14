.PHONY: iex
iex:
	docker run -it --rm -v ${PWD}:/app -w /app elixir

