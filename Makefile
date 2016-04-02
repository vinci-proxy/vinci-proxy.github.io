SRC = $(wildcard views/*.html)
SRC += $(wildcard cmd/build/*.go)
SRC += $(wildcard ../vinxi/docs/*.md)

index.html: $(SRC)
	@go run cmd/build/build.go > $@

commit: index.html
	git commit -a -m "Build docs for $(shell go run ../vinxi/cmd/vinxi/main.go version)"
	git push
.PHONY: commit

clean:
	rm -f index.html
.PHONY: clean
