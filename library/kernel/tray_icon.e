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
		do

		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
		do
			implementation.set_tooltip(a_text)
		end

	set_title(a_text:READABLE_STRING_GENERAL)
		do
			implementation.set_title(a_text)
		end

	is_visible:BOOLEAN
		do
			Result:=implementation.is_visible
		end

	show
		do
			implementation.show
		end

	hide
		do
			implementation.hide
		end

	activate_action:EV_NOTIFY_ACTION_SEQUENCE
		do
			Result:=implementation.activate_action
		end

	popup_action:EV_NOTIFY_ACTION_SEQUENCE
		do
			Result:=implementation.popup_action
		end

	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
		do
			implementation.set_icon_from_pixmap(a_pixmap)
		end

	set_icon_from_ressource(a_id:NATURAL)
		do
			implementation.set_icon_from_ressource(a_id)
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
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

end
