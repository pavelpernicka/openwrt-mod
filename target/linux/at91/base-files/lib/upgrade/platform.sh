REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	local board=$(board_name)

	case "$board" in
	acme,ariag25)
		return 0
		;;
	esac

	echo "Sysupgrade is not yet supported on $board."
	return 1
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	acme,ariag25)
		PART_NAME=firmware
		echo "$1"
		default_do_upgrade "$1"
		;;
	esac
}
