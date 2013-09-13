note
	description: "Summary description for {TRAY_GTK_EXTERNAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TRAY_GTK_EXTERNAL

feature -- gtk.h

	frozen gtk_status_icon_new:POINTER
		external
			"C : GtkStatusIcon* | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_new_from_pixbuf(pixbuf:POINTER):POINTER
		external
			"C (GdkPixbuf *) : GtkStatusIcon* | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_set_from_pixbuf(status_icon,pixbuf:POINTER)
		external
			"C (GtkStatusIcon*, GdkPixbuf *) | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_get_pixbuf(status_icon:POINTER):POINTER
		external
			"C (GtkStatusIcon *) : GdkPixbuf * | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_get_size(status_icon:POINTER):INTEGER
		external
			"C (GtkStatusIcon *) : gint | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_set_title(status_icon,tooltip_text:POINTER)
		external
			"C (GtkStatusIcon*, const gchar *) | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_set_tooltip(status_icon,tooltip_text:POINTER)
		external
			"C (GtkStatusIcon*, const gchar *) | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_set_visible(status_icon:POINTER;visible:BOOLEAN)
		external
			"C (GtkStatusIcon*, gboolean) | <gtk/gtk.h>"
		end

	frozen gtk_status_icon_get_visible(status_icon:POINTER):BOOLEAN
		external
			"C (GtkStatusIcon*) : gboolean | <gtk/gtk.h>"
		end

end
