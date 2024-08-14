publish:
	twine upload dist/*

build	:
	python -m build

clean:
	rm -rf build dist
