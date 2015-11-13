PYTHON=`. venv/bin/activate; which python`
PIP=`. venv/bin/activate; which pip`
DEPS:=requirements.txt

.PHONY: clean distclean test shell deps

clean:
	@find . -name "*.pyc" -delete

distclean: clean
	rm -rf venv

venv:
	virtualenv -p python2.7 venv
	$(PIP) install -r $(DEPS)

install: venv
	$(PIP) install -r $(DEPS) -U

go:
	$(PYTHON) server.py
