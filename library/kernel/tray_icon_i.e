note
	description: "[
				Implementation of a system tray icon. 
				
				Note: 	On Windows, a hidden window is created. 
						Using a {EV_WINDOW}.destroy_and_exit_if_last while a tray icon is active could make the application loop forever.
				]"
	author: "Louis Marchand"
	date: "september 12, 2013"
	revision: "v0.1"

deferred class
	TRAY_ICON_I

inherit
	EV_ANY_I

feature

	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
			-- Use `a_pxmap' for the tray icon image
			-- Not used in Windows
		deferred
		end


	set_icon_from_ressource(a_id:NATURAL)
			-- Load the tray icon image from the ressource file with resource ID `a_id'.
			-- Only for Windows
		deferred
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
			-- Load the tray icon image from `a_file'.
			-- Note that on Windows, `a_file' must point to an icon file (*.ico).
		deferred
		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
			-- Set the tray icon tooltip to `a_text'.
		deferred
		end

	set_title(a_text:READABLE_STRING_GENERAL)
			-- Give a `title' to the tray icon using `a_text'.
		deferred
		end

	is_visible:BOOLEAN
			-- Is tray icon currently visible.
		deferred
		end

	show
			-- Make the tray icon visible.
		deferred
		end

	hide
			-- Hide the tray icon
		deferred
		end

	destroy
			-- <Precursor>
		deferred
		end


	activate_action: EV_NOTIFY_ACTION_SEQUENCE
			-- Actions to be performed when the tray icon is activate.
			-- Normaly, this append when the user click the tray icon with the left mouse button.

	popup_action: EV_NOTIFY_ACTION_SEQUENCE
			-- Actions to be performed when the tray icon requested a popup menu.
			-- Normaly, this append when the user click the tray icon with the right mouse button.



invariant

note
	library:	"Eiffel_Tray_Icon: A cross-platform library to use tray icon with Eiffel Vision 2."
	copyright:	"Copyright (c) 2013, Louis Marchand"
	license:	"The MIT License (MIT) (see http://opensource.org/licenses/MIT)"

	
end
