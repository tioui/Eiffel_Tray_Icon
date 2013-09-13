note
	description: "[
				Windows implementation of a system tray icon. 
				
				Note: 	On Windows, a hidden window is created. 
						Using a {EV_WINDOW}.destroy_and_exit_if_last while a tray icon is active could make the application loop forever.
				]"
	author: "Louis Marchand"
	date: "september 12, 2013"
	revision: "v0.1"

class
	TRAY_ICON_IMP

inherit
	TRAY_ICON_I
		redefine
			interface
		end
	EV_ANY_I
		redefine
			interface
		end



create
	make


feature {NONE} -- Initialization

	old_make (a_interface: like interface)
		do
			assign_interface (a_interface)
		end

	make
			-- Create and initialize `Current'.
		local
		do
			create activate_action.default_create
			create popup_action.default_create
			create hidden_window.make
			hide
			hidden_window.notify_icon_actions.extend (agent on_activate)
			set_is_initialized (True)
		end

feature -- Access


	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
		do
			check attached {EV_PIXMAP_IMP} a_pixmap.implementation as la_pixmap_imp then
				if la_pixmap_imp.icon /= Void then
					hidden_window.set_icon (la_pixmap_imp.icon)
					update
				end
			end
		end

	set_icon_from_ressource(a_id:NATURAL)
			-- Only for Windows
		local
			l_icon_ptr:POINTER
		do
			l_icon_ptr:={TRAY_MSWIN_EXTERNAL}.LoadImage_Icon(
										{TRAY_MSWIN_EXTERNAL}.ModuleHandle,{TRAY_MSWIN_EXTERNAL}.MAKEINTRESOURCE(a_id),0
										)
			if l_icon_ptr.is_default_pointer then
				debug
					io.error.put_string ("Error no "+{TRAY_MSWIN_EXTERNAL}.GetLastError.out+" while loading the ressource " + a_id.out+"%N")
					check False end
				end
			else
				set_icon_from_pointer (l_icon_ptr)
			end
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
		local
			l_utf_converter:UTF_CONVERTER
			l_file_ptr, l_icon_ptr:POINTER
		do
			create l_utf_converter
			l_file_ptr:=l_utf_converter.utf_32_string_to_utf_16 (a_file.as_string_32).base_address
			l_icon_ptr:={TRAY_MSWIN_EXTERNAL}.LoadImage_Icon(
									create {POINTER},l_file_ptr,{TRAY_MSWIN_EXTERNAL}.LR_LOADFROMFILE
									)
			if l_icon_ptr.is_default_pointer then
				debug
					io.error.put_string ("Error no "+{TRAY_MSWIN_EXTERNAL}.GetLastError.out+" while loading the file " + a_file+"%N")
					check False end
				end
			else
				set_icon_from_pointer (l_icon_ptr)
			end
		end

	set_tooltip (a_tooltip: READABLE_STRING_GENERAL)
			-- Set `a_tooltip' to `notify_icon_data'.
		do
			hidden_window.set_tooltip (a_tooltip)
			update
		end

	set_title(a_text:READABLE_STRING_GENERAL)
		do
		end

	is_visible:BOOLEAN
		do
			Result:=i_is_visible
		end

	show
		do
			hidden_window.add_notify_icon
			i_is_visible:=True
		end

	hide
		do
			hidden_window.remove_notify_icon
			i_is_visible:=False
		end

	destroy
		do
			hide
			hidden_window.destroy
			set_is_destroyed (True)
		end

feature {NONE} -- Implementation

	on_activate(l_button:INTEGER)
		do
			if l_button={TRAY_MSWIN_EXTERNAL}.WM_LBUTTONUP then
				activate_action.call ([])
			elseif l_button={TRAY_MSWIN_EXTERNAL}.WM_RBUTTONUP then
				popup_action.call ([])
			end

		end

	i_is_visible:BOOLEAN

	hidden_window:WEL_NOTIFY_WINDOW

	update
		do
			if is_visible then
				hidden_window.update_notify_icon
			end
		end

	set_icon_from_pointer(a_pointer:POINTER)
		require
			not a_pointer.is_default_pointer
		local
			l_icon:WEL_ICON
		do
			create l_icon.make_by_pointer (a_pointer)
			hidden_window.set_icon (l_icon)
			update
		end

feature {EV_ANY, EV_ANY_I} -- Implementation
	interface: detachable TRAY_ICON
		note
			option:stable
		attribute
		end



invariant

note
	library:	"Eiffel_Tray_Icon: A cross-platform library to use tray icon with Eiffel Vision 2."
	copyright:	"Copyright (c) 2013, Louis Marchand"
	license:	"The MIT License (MIT) (see http://opensource.org/licenses/MIT)"
	
	

end
