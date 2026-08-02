MAKEFLAGS = --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.PHONY: run install lint format pre-commit unit-tests

.DEFAULT_GOAL := run

run:
	uv run python -m scripts.main

install:
	uv sync --frozen --extra dev

lint:
	uv run ruff check --fix
	uv run mypy scripts tests

format:
	uv run black --color .

pre-commit:
	uv run pre-commit run --verbose --all-files

unit-tests:
	uv run pytest
