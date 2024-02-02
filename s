#!/usr/bin/env bash

ctl='sudo systemctl'
action="${0/*\/}"
[[ "${action:0:1}" ]] && ctl='systemctl --user' && action="${action:1}"


case "$action" in
	reload) if [[ -z "$@" ]]
		then $ctl daemon-reload && echo systemd reloaded || echo systemd reload failed; exit
		else action=reload
	fi ;;
	log) if [[ -n "$@" ]]
		then [[ "${1::1}" = "-" ]] && journalctl "$@" || journalctl -fu "$@"
		else journalctl -f
	fi
	exit ;;
	toggle) $ctl is-active "$@" >/dev/null && action=stop || action=start ;;
	stay)  action=enable  ;;
	leave) action=disable ;;
	s)     action=status  ;;
esac

[[ "$action" != "status" ]] && $ctl --no-pager "$action" "$@"
$ctl --no-pager status "$@"
