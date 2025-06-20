--NOTE: This plugin only works with the rocks package and the lua 5.1 version
return {
	"3rd/image.nvim",
	-- build = false,
	event = "VeryLazy",
	opts = {
		processor = "magick_rock",
		rocks = { "magick" },
		backend = "kitty",
		integrations = {
			markdown = {
				resolve_image_path = function(document_path, image_path, fallback)
					-- Define the absolute path to your Assets directory
					local assets_dir = vim.fn.expand("~/Documents/obsidian/Resources/") -- not the path to vault, but to the assets dir

					-- Check if the image_path is already an absolute path
					if image_path:match("^/") then
						-- If it's an absolute path, leave it unchanged
						return image_path
					end

					-- Construct the new image path by prepending the Assets directory
					local new_image_path = assets_dir .. "/" .. image_path

					-- Check if the constructed path exists
					if vim.fn.filereadable(new_image_path) == 1 then
						return new_image_path
					else
						-- If the file doesn't exist in Assets, fallback to default behavior
						return fallback(document_path, image_path)
					end
				end,
				-- resolve_image_path = function(document_path, image_path, fallback)
				-- 	-- document_path is the path to the file that contains the image
				-- 	-- image_path is the potentially relative path to the image. for
				-- 	-- markdown it's `![](this text)`
				--
				-- 	-- you can call the fallback function to get the default behavior
				-- 	return fallback(document_path, image_path)
				-- end,
				enabled = true,
				clear_in_insert_mode = true,
				download_remote_images = true,
				only_render_image_at_cursor = true,
				only_render_image_at_cursor_mode = "popup",
				floating_windows = false, -- if true, images will be rendered in floating markdown windows
				filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
			},
			neorg = {
				enabled = true,
				filetypes = { "norg" },
			},
			typst = {
				enabled = true,
				filetypes = { "typst" },
			},
			html = {
				enabled = true,
			},
			css = {
				enabled = false,
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
		editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
		tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
	},
}
