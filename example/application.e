note
	description	: "Root class for this application."
	author		: "Generated by the New Vision2 Application Wizard."
	date		: "$Date: 2013/8/30 11:0:21 $"
	revision	: "1.0.0"

class
	APPLICATION

inherit
	EV_APPLICATION

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Initialize and launch application
		do
			default_create
			prepare
			launch
		end

	prepare
		local
			l_tray_icon:TRAY_ICON
		do
			create l_tray_icon.make_from_file ("icone.ico")
		--	l_tray_icon.set_icon_from_ressource (12345)	-- To get icon from ressource file (Windows Only of course)
			l_tray_icon.set_title("Coucou, Yahoo!!!")
			l_tray_icon.set_tooltip ("Un peu d'aide!")
			l_tray_icon.activate_action.extend (agent print("Using the tray icon!%N"))
			l_tray_icon.popup_action.extend (agent destroying(l_tray_icon))
			l_tray_icon.show
		end


	destroying(a_tray_icon:TRAY_ICON)
		do
			a_tray_icon.destroy
			destroy
		end

end -- class APPLICATION
