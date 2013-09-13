note
	description: "[
				Create a system tray icon. 
				
				Note: 	On Windows, a hidden window is created. 
						Using a {EV_WINDOW}.destroy_and_exit_if_last while a tray icon is active could make the application loop forever.
				]"
	author: "Louis Marchand"
	date: "september 12, 2013"
	revision: "v0.1"

class
	TRAY_ICON
inherit
	EV_ANY
	redefine
		implementation
	end

create
	default_create,
	make_from_file

feature {NONE} -- Implementation

	make_from_file(a_file:READABLE_STRING_GENERAL)
		do
			default_create
			set_icon_from_file (a_file)
		end

feature

	create_interface_objects
			-- <Precursor>
		do

		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
			-- Set the tray icon tooltip to `a_text'.
		do
			implementation.set_tooltip(a_text)
		end

	set_title(a_text:READABLE_STRING_GENERAL)
			-- Give a `title' to the tray icon using `a_text'.
		do
			implementation.set_title(a_text)
		end

	is_visible:BOOLEAN
			-- Is tray icon currently visible.
		do
			Result:=implementation.is_visible
		end

	show
			-- Make the tray icon visible.
		do
			implementation.show
		end

	hide
			-- Hide the tray icon
		do
			implementation.hide
		end

	activate_action:EV_NOTIFY_ACTION_SEQUENCE
			-- Actions to be performed when the tray icon is activate.
			-- Normaly, this append when the user click the tray icon with the left mouse button.
		do
			Result:=implementation.activate_action
		end

	popup_action:EV_NOTIFY_ACTION_SEQUENCE
			-- Actions to be performed when the tray icon requested a popup menu.
			-- Normaly, this append when the user click the tray icon with the right mouse button.
		do
			Result:=implementation.popup_action
		end

	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
			-- Use `a_pxmap' for the tray icon image
			-- Not used in Windows
		do
			implementation.set_icon_from_pixmap(a_pixmap)
		end

	set_icon_from_ressource(a_id:NATURAL)
			-- Load the tray icon image from the ressource file with resource ID `a_id'.
			-- Used only in Windows
		do
			implementation.set_icon_from_ressource(a_id)
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
			-- Load the tray icon image from `a_file'.
			-- Note that on Windows, `a_file' must point to an icon file (*.ico).
		do
			implementation.set_icon_from_file (a_file)
		end

feature {EV_ANY}

	create_implementation
		-- <Precursor>
		do
			create {TRAY_ICON_IMP} implementation.make
		end

feature {EV_ANY, EV_ANY_I, EV_ANY_HANDLER}

	implementation: TRAY_ICON_I


invariant
	
note
	library:	"Eiffel_Tray_Icon: A cross-platform library to use tray icon with Eiffel Vision 2."
	copyright:	"Copyright (c) 2013, Louis Marchand"
	license:	"The MIT License (MIT) (see http://opensource.org/licenses/MIT)"

end
