.PHONY: docker-iex
docker-iex:
	docker run -it --rm -v ${PWD}:/app -w /app elixir

