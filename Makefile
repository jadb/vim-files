
install: symlink submodules update

submodules:
	git submodule init
	git submodule update

symlink:
	ln -sf ~+/vimrc ~/.vimrc

update:
	git pull origin master
	git submodule foreach git pull origin master
