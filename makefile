build: src/build.sh src/run.sh src/asciidoctor.rb
	src/build.sh

test:
	ruby src/asciidoctor.rb src/test.adoc

clean:
	rm -rf build
