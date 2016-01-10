
process: py-list
	test -f ansible.snippet && rm ansible.snippet || :
	for f in $$(cat py-list); do \
		./process $$f; \
	done

py-list: clone
	find ansible-modules-* -name *.py \
		-exec grep -l DOCUMENTATION {} \; > py-list

ansible-modules-core:
	git clone https://github.com/ansible/ansible-modules-core.git

ansible-modules-extras:
	git clone https://github.com/ansible/ansible-modules-extras.git

clone: ansible-modules-core ansible-modules-extras

clean:
	rm -rf ansible-modules-core ansible-modules-extras py-list ansible.snippet
