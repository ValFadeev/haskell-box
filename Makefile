BOX_NAME?=bento/ubuntu-16.04
CLOUD_NO_RELEASE?=false
CONFIG=haskell-vim-proto
TAG:=$(shell git describe --abbrev=0 --tags)

init:
	vagrant box add --provider=virtualbox $(BOX_NAME)
validate:
	packer validate -var "version=$(TAG)" template.json
build:
	@packer build -var "version=$(TAG)" -var "cloud_no_release=$(CLOUD_NO_RELEASE)" template.json
	vagrant box remove valfadeev/$(CONFIG)
	vagrant box add valfadeev/$(CONFIG) box/packer_$(CONFIG)_virtualbox
