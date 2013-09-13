note
	description: "Summary description for {TRAY_ICON_IMP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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
			l_tray_icon_pointer:POINTER
		do
			l_tray_icon_pointer:={TRAY_GTK_EXTERNAL}.gtk_status_icon_new
			make_common(l_tray_icon_pointer)
		end

	make_common(a_tray_icon_pointer:POINTER)
			-- Create and initialize `Current'.
		do
			set_c_object (a_tray_icon_pointer)
			create activate_action
			create popup_action
			real_signal_connect_after (c_object, once "activate", agent App_implementation.do_once_on_idle (agent on_activate), Void)
			real_signal_connect_after (c_object, once "popup-menu", agent App_implementation.do_once_on_idle (agent on_popup), Void)
			set_is_initialized (True)
		end

feature -- Access

	set_icon_from_pixmap(a_pixmap:EV_PIXMAP)
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
		local
			l_pixmap:EV_PIXMAP
		do
			create l_pixmap.default_create
			l_pixmap.set_with_named_file (a_file)
			set_icon_from_pixmap (l_pixmap)
		end

	set_tooltip(a_text:READABLE_STRING_GENERAL)
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (a_text)
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_tooltip(c_object,l_c_text.item)
		end

	set_title(a_text:READABLE_STRING_GENERAL)
		local
			l_c_text:C_STRING
		do
			create l_c_text.make (a_text)
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_title(c_object,l_c_text.item)
		end

	is_visible:BOOLEAN
		do
			Result:={TRAY_GTK_EXTERNAL}.gtk_status_icon_get_visible(c_object)
		end

	show
		do
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_visible(c_object,True)
		end

	hide
		do
			{TRAY_GTK_EXTERNAL}.gtk_status_icon_set_visible(c_object,False)
		end

feature {NONE} -- Implementation

	on_activate
		do
			activate_action.call ([])
		end

	on_popup
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
end
