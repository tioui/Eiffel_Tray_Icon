note
	description: "[
				Create a system tray icon.
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
	EV_ANY_IMP
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
			app_imp: like App_implementation
		do
			set_is_initialized (False)
			app_imp := App_implementation
			set_c_object ({TRAY_GTK_EXTERNAL}.gtk_status_icon_new)
			create activate_action
			create popup_action
			real_signal_connect_after (c_object, once "activate", agent App_implementation.do_once_on_idle (agent on_activate), Void)
			real_signal_connect_after (c_object, once "popup-menu", agent App_implementation.do_once_on_idle (agent on_popup), Void)
			set_is_initialized (True)
		end

feature -- Access

	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
			-- Use `a_pxmap' for the tray icon image
		do
			check attached {EV_PIXMAP_IMP} a_pixmap.implementation as la_pixmap_imp then
				{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_from_pixbuf(c_object, la_pixmap_imp.pixbuf_from_drawable)
			end
		end

	set_icon_from_ressource(a_id:NATURAL)
			-- Only for Windows
		do
		end

	set_icon_from_file(a_file:READABLE_STRING_GENERAL)
			-- Use `a_file' for the tray icon image
		local
			l_pixmap:EV_PIXMAP
		do
			create l_pixmap.default_create
			l_pixmap.set_with_named_file (a_file)
			set_icon_from_pixmap (l_pixmap)
		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
			-- Set the tray icon tooltip to `a_text'.
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (a_text)
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_tooltip(c_object,l_c_text.item)
		end

	set_title(a_text:READABLE_STRING_GENERAL)
			-- Give a `title' to the tray icon using `a_text'.
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (a_text)
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_title(c_object,l_c_text.item)
		end

	is_visible:BOOLEAN
			-- Is tray icon currently visible.
		do
			Result:={TRAY_GTK_EXTERNAL}.gtk_status_icon_get_visible(c_object)
		end

	show
			-- Make the tray icon visible.
		do
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_visible(c_object,True)
		end

	hide
			-- Hide the tray icon
		do
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_visible(c_object,False)
		end

feature {NONE} -- Implementation

	on_activate
			-- The "activate" GDK signal.
		do
			activate_action.call ([])
		end

	on_popup
			-- The "popup_menu" GDK signal.
		do
			popup_action.call ([])
		end

feature {EV_ANY, EV_ANY_I} -- Implementation
	interface: detachable TRAY_ICON
		note
			option:stable
		attribute
		end

invariant
	C_Object_Not_Null: not c_object.is_default_pointer

note
	library:	"Eiffel_Tray_Icon: A cross-platform library to use tray icon with Eiffel Vision 2."
	copyright:	"Copyright (c) 2013, Louis Marchand"
	license:	"The MIT License (MIT) (see http://opensource.org/licenses/MIT)"


end
