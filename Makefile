ifndef RUBY_VERSIONS
	RUBY_VERSIONS := 2.1.2 2.1.5 2.2.0 2.2.1
endif

BUILD_IMAGE  := ruby-builder
BUILD_PREFIX := builder
MASTER_IMAGE := polleverywhere/ruby
BUILDS       := $(addprefix ${BUILD_PREFIX},${RUBY_VERSIONS})

.PHONY: check-docker create-builder build create-builds $(BUILDS) remove-builder clean

build: create-builder create-builds
	
check-docker:
	@if [ -z $$(which docker) ]; then \
	echo "Missing \`docker\` client which is required for building"; \
	exit 2; \
	fi

create-builder: check-docker
	docker build -t $(BUILD_IMAGE) builder

create-builds: $(BUILDS)

$(BUILDS): $(BUILD_PREFIX)%:
	docker run --name $@ $(BUILD_IMAGE) builder $* /usr/local/rubies
	docker cp $@:/usr/local/rubies/packaged/$*.tar.gz rubies/
	docker build -t $(MASTER_IMAGE):$* .
	-docker rm $@
	rm -f rubies/$*.tar.gz

remove-builder:
	docker rm -f $(BUILD_IMAGE)

clean:
	docker rm -f $(BUILDS) || true
	rm -f rubies/*.tar.gz
