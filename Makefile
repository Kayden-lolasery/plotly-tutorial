VENV_NAME ?= env
VENV_ACTIVATE = . $(VENV_NAME)/bin/activate
PYTHON = $(VENV_NAME)/bin/python3
REQ_BASE_TXT = requirements_base.txt

.PHONY: dev-env
dev-env: $(VENV_NAME)/bin/activate
$(VENV_NAME)/bin/activate: $(REQ_BASE_TXT)
	test -d $(VENV_NAME) || python3 -m venv $(VENV_NAME)
	$(PYTHON) -m pip install -U pip
	$(PYTHON) -m pip install -r $(REQ_BASE_TXT)
	touch $(VENV_NAME)/bin/activate
	source env/bin/activate.fish

.PHONY: pip
pip:
	$(VENV_ACTIVATE) && pip list

