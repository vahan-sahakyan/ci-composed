##########################
# main
##########################

clone:
	./bin/clone.sh

cleanup:
	rm -rf _backend
	rm -rf _frontend

reclone:
	make cleanup
	make clone

install:
	make clone
	make dc_up

uninstall:
	make dc_down
	make cleanup


##########################
# docker compose
##########################

dc_up:
	./bin/dc_up.sh

dc_down:
	./bin/dc_down.sh


##########################
# kubertnetes
##########################

k8s_start:
	./bin/k8s_start.sh

k8s_restart:
	./bin/k8s_restart.sh

k8s_reapply:
	./bin/k8s_reapply.sh $(KEYWORD)

