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
			-- Not used in Windows
		deferred
		end


	set_icon_from_ressource(a_id:NATURAL)
			-- Only for Windows
		deferred
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
		deferred
		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
		deferred
		end

	set_title(a_text:READABLE_STRING_GENERAL)
		deferred
		end

	is_visible:BOOLEAN
		deferred
		end

	show
		deferred
		end

	hide
		deferred
		end

	destroy
		deferred
		end


	activate_action: EV_NOTIFY_ACTION_SEQUENCE

	popup_action: EV_NOTIFY_ACTION_SEQUENCE

end
