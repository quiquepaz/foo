PYTHON=`. venv/bin/activate; which python`
PIP=`. venv/bin/activate; which pip`
DEPS:=requirements.txt

.PHONY: clean distclean test shell deps

clean:
	@find . -name "*.pyc" -delete

distclean: clean
	rm -rf venv

venv:
	virtualenv-2.7 -p python2.7 venv
	$(PIP) install -U "pip>=7.0"
	$(PIP) install -r $(DEPS)
	$(PIP) install bpython

install: venv
	$(PIP) install -r $(DEPS) -U

go:
	$(PYTHON) server.py
