TEST_E2E_DIR = ocaml-lsp-server/test/e2e

build:
	dune build
.PHONY: build

fmt:
	cd $(TEST_E2E_DIR) && yarn fmt

fmt-check:
	cd $(TEST_E2E_DIR) && yarn fmt-check

lsp-server:
	dune build @install
.PHONY: lsp-server

test: $(TEST_E2E_DIR)/node_modules lsp-server
	cd $(TEST_E2E_DIR) && dune exec -- yarn test
.PHONY: test

format:
	dune build @fmt --auto-promote
.PHONY: format

$(TEST_E2E_DIR)/node_modules:
	cd $(TEST_E2E_DIR) && yarn install --frozen-lockfile
