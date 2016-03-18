SRC = $(wildcard views/*.html)
SRC += $(wildcard cmd/build/*.go)
SRC += $(wildcard ../vinci/docs/*.md)

index.html: $(SRC)
	@go run cmd/build/build.go > $@

commit: index.html
	git commit -a -m "Build docs for $(shell go run ../vinci/cmd/apex/main.go version)"
	git push
.PHONY: commit

clean:
	rm -f index.html
.PHONY: clean
