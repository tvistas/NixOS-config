require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true, enter_mode = "first" })

require("sshfs"):setup({
	mount_dir = os.getenv("HOME") .. "/Mount/",
})

require("recycle-bin"):setup()

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false, mode = "dir" },
	persist = "all",
	desc_format = "parent",
	file_pick_mode = "hover",
	custom_desc_input = false,
	show_keys = false,
	notify = {
		enable = true,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})
