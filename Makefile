export PATH:=$(PWD)/node_modules/.bin:$(PWD)/.py-venv/bin/:$(PATH)
SHELL:=/bin/bash

.PHYNY: check clean publish

check: .py-venv yamllint.yaml
	bash -c "source ./.py-venv/bin/activate ; find * -name '*.yml' -exec yamllint -c yamllint.yaml {} +"
	bash -c "source ./.py-venv/bin/activate ; ansible-lint"

.py-venv: requirements.txt
	virtualenv .py-venv
	source .py-venv/bin/activate ; pip install -r requirements.txt

yamllint.yaml:
	curl -LOC - https://raw.githubusercontent.com/ansible/galaxy/devel/galaxy/importer/linters/yamllint.yaml

publish: clean
	ansible-galaxy role import --token $$(cat ~/.ansible-galaxy-api-key) --role-name triton_dehydrated joyent ansible-triton-dehydrated

clean:
	rm -rf .py-venv yamllint.yaml
