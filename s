#!/usr/bin/env bash
action="${0/*\/}"
case "$action" in
	reload) if [[ -z "$@" ]]
		then sudo systemctl daemon-reload && echo systemd reloaded || echo systemd reload failed; exit
		else action=reload
	fi ;;
	log) if [[ -n "$@" ]]
		then [[ "${1::1}" = "-" ]] && journalctl "$@" || journalctl -fu "$@"
		else journalctl -f
	fi
	exit ;;
	toggle) systemctl is-active "$@" >/dev/null && action=stop || action=start ;;
	stay)  action=enable  ;;
	leave) action=disable ;;
	s)     action=status  ;;
esac

[[ "$action" != "status" ]] && sudo systemctl --no-pager "$action" "$@"
systemctl --no-pager status "$@"
