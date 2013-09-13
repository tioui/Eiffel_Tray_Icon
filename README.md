Eiffel_Tray_Icon
================

Multi-platform library to use system tray icon with Eiffel Vision 2. 

Usage
-----

 - In EiffelStudio, create a Vision 2 project.
 - Add the library/tray_icon(-safe).ecf file in your project libraries.
 - Look at the exemple to see how to use it.

Notes
-----

On the unity desktop, you have to enable you application to the systray-whitelist to make the tray icon appear.
First, if you don't realy care about what application is in your system tray, you can said unity to 
add in the system tray all application that request it. To do so, use the following command:

		gsettings set com.canonical.Unity.Panel systray-whitelist "['all']"

If you just want to add your application, you here is what you have to do.
Before adding you application to the whitelist, look if there is already something in it with this command:

		gsettings get com.canonical.Unity.Panel systray-whitelist

If there is no application in the whitelist, use this command to add your application:

		gsettings set com.canonical.Unity.Panel systray-whitelist "['YOUR_APPLICATION']"

if there is already some application in the whitelist, use a command like this one (adapt it of cource):

		gsettings set com.canonical.Unity.Panel systray-whitelist "['APP1', 'APP2', ..., 'YOUR_APPLICATION']"

Starting from Ubuntu 13.04, this Whitelist method does not work out of the box. To make it work, use the 
unity-systrayfix package. See: https://launchpad.net/~timekiller/+archive/unity-systrayfix

Credit
------

The Nice Dog Icon is from wpclipart (http://openiconlibrary.sourceforge.net/gallery2/?./Icons/others/animals-dog.png) and
is in the Public Domain.

License
-------

The MIT License (MIT)

Copyright (c) 2013 Louis Marchand

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

