note
	description: "[
				External methods to create System Tray Icon. 
				]"
	author: "Louis Marchand"
	date: "september 12, 2013"
	revision: "v0.1"

class
	TRAY_MSWIN_EXTERNAL

feature -- windows.h

	frozen Shell_NotifyIcon(dwMessage:NATURAL_32; lpdata:POINTER):BOOLEAN
		external
			"C (DWORD, PNOTIFYICONDATA) : BOOL | <windows.h>"
		alias
			"Shell_NotifyIcon"
		end

	frozen GetLastError:NATURAL_32
		external
			"C : DWORD | <windows.h>"
		alias
			"GetLastError"
		end

	frozen sizeof_notify_icon_data_struct:INTEGER
		external
			"C inline use <windows.h>"
		alias
			"sizeof(NOTIFYICONDATA)"
		end

	frozen get_notify_icon_data_struct_cbSize (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):DWORD"
		alias
			"cbSize"
		end

	frozen set_notify_icon_data_struct_cbSize (notify_icon_data: POINTER; cbsize: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, DWORD)"
		alias
			"cbSize"
		end

	frozen get_notify_icon_data_struct_hWnd (notify_icon_data:POINTER):POINTER
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):HWND"
		alias
			"hWnd"
		end

	frozen set_notify_icon_data_struct_hWnd (notify_icon_data, hWnd: POINTER)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, HWND)"
		alias
			"hWnd"
		end

	frozen get_notify_icon_data_struct_uID (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):UINT"
		alias
			"uID"
		end

	frozen set_notify_icon_data_struct_uID (notify_icon_data: POINTER; uID: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, UINT)"
		alias
			"uID"
		end

	frozen get_notify_icon_data_struct_uFlags (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):UINT"
		alias
			"uFlags"
		end

	frozen set_notify_icon_data_struct_uFlags (notify_icon_data: POINTER; uFlags: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, UINT)"
		alias
			"uFlags"
		end

	frozen get_notify_icon_data_struct_uCallbackMessage (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):UINT"
		alias
			"uCallbackMessage"
		end

	frozen set_notify_icon_data_struct_uCallbackMessage (notify_icon_data: POINTER; uCallbackMessage: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, UINT)"
		alias
			"uCallbackMessage"
		end

	frozen get_notify_icon_data_struct_hIcon (notify_icon_data:POINTER):POINTER
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):HICON"
		alias
			"hIcon"
		end

	frozen set_notify_icon_data_struct_hIcon (notify_icon_data: POINTER; hIcon: POINTER)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, HICON)"
		alias
			"hIcon"
		end

	frozen get_notify_icon_data_struct_szTip (notify_icon_data:POINTER):POINTER
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):TCHAR*"
		alias
			"szTip"
		end

	frozen set_notify_icon_data_struct_szTip(notifyicondata,sztip: POINTER)
		external
			"C inline use <windows.h>"
		alias
			"strcpy((char *)(((NOTIFYICONDATA *)$notifyicondata)->szTip),(char *) $sztip)"
		end

	frozen get_notify_icon_data_struct_szInfo (notify_icon_data:POINTER):POINTER
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):TCHAR*"
		alias
			"szInfo"
		end

	frozen set_notify_icon_data_struct_szInfo(notifyicondata,szinfo: POINTER)
		external
			"C inline use <windows.h>"
		alias
			"strcpy((char *)(((NOTIFYICONDATA *)$notifyicondata)->szInfo),(char *) $szinfo)"
		end

	frozen get_notify_icon_data_struct_dwState (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):DWORD"
		alias
			"dwState"
		end

	frozen set_notify_icon_data_struct_dwState (notify_icon_data: POINTER; dwState: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, DWORD)"
		alias
			"dwState"
		end

	frozen get_notify_icon_data_struct_dwStateMask (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):DWORD"
		alias
			"dwStateMask"
		end

	frozen set_notify_icon_data_struct_dwStateMask (notify_icon_data: POINTER; dwStateMask: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, DWORD)"
		alias
			"dwStateMask"
		end

	frozen get_notify_icon_data_struct_uTimeout (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):UINT"
		alias
			"uTimeout"
		end

	frozen set_notify_icon_data_struct_uTimeout (notify_icon_data: POINTER; uTimeout: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, UINT)"
		alias
			"uTimeout"
		end

	frozen get_notify_icon_data_struct_uVersion (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):UINT"
		alias
			"uVersion"
		end

	frozen set_notify_icon_data_struct_uVersion (notify_icon_data: POINTER; uVersion: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, UINT)"
		alias
			"uVersion"
		end

	frozen get_notify_icon_data_struct_szInfoTitle (notify_icon_data:POINTER):POINTER
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):TCHAR*"
		alias
			"szInfoTitle"
		end

	frozen set_notify_icon_data_struct_szInfoTitle(notifyicondata,szinfotitle: POINTER)
		external
			"C inline use <windows.h>"
		alias
			"strcpy((char *)(((NOTIFYICONDATA *)$notifyicondata)->szInfoTitle),(char *) $szinfotitle)"
		end

	frozen get_notify_icon_data_struct_dwInfoFlags (notify_icon_data:POINTER):NATURAL_32
		external
			"C [struct <windows.h>] (NOTIFYICONDATA):DWORD"
		alias
			"dwInfoFlags"
		end

	frozen set_notify_icon_data_struct_dwInfoFlags (notify_icon_data: POINTER; dwInfoFlags: NATURAL_32)
		external
			"C [struct <windows.h>] (NOTIFYICONDATA, DWORD)"
		alias
			"dwInfoFlags"
		end

--	frozen get_notify_icon_data_struct_hBalloonIcon (notify_icon_data:POINTER):POINTER
--		external
--			"C [struct <windows.h>] (NOTIFYICONDATA):HICON"
--		alias
--			"hBalloonIcon"
--		end

--	frozen set_notify_icon_data_struct_hBalloonIcon (notify_icon_data, hBalloonIcon: POINTER)
--		external
--			"C [struct <windows.h>] (NOTIFYICONDATA, HICON)"
--		alias
--			"hBalloonIcon"
--		end

feature -- Constants windows.h


	frozen WM_RBUTTONUP:INTEGER
		external
			"C inline use <windows.h>"
		alias
			"WM_RBUTTONUP"
		end

	frozen WM_LBUTTONUP:INTEGER
		external
			"C inline use <windows.h>"
		alias
			"WM_LBUTTONUP"
		end

	frozen LR_LOADTRANSPARENT:NATURAL
		external
			"C inline use <windows.h>"
		alias
			"LR_LOADTRANSPARENT"
		end

	frozen LR_LOADFROMFILE:NATURAL
		external
			"C inline use <windows.h>"
		alias
			"LR_LOADFROMFILE"
		end

feature -- custom function

	frozen LoadImage_Icon (hinstance,lpszname:POINTER;flags: NATURAL): POINTER
		external
			"C inline use <windows.h>"
		alias
			"LoadImage( $hinstance, $lpszname, IMAGE_ICON, 0, 0, LR_SHARED | $flags  )"
		end

	frozen ModuleHandle:POINTER
		external
			"C inline use <windows.h>"
		alias
			"GetModuleHandle(NULL)"
		end

	frozen MAKEINTRESOURCE(id:NATURAL):POINTER
		external
			"C inline use <windows.h>"
		alias
			"MAKEINTRESOURCE($id)"
		end

end
