MET_CS_601
==========

All code generated as part of class 'MET CS 601'

Structure:
	Each class day will be allotted own folder or project, allowing me to create coherent code,
	while still keeping all classwork centrally located (both on disk and in GitHub)
	
Classwork will be XAMPP on Windows 7
	For XAMPP setup, download and install it wherever.  In /xampp/apache/conf/httpd.conf, 
	change the DocumentRoot and Directory fields to '.../MET_CS_601' 
Project work will be Rails on Windows 7/Heroku (using Ruby 1.9.3, DevKit, Rails 4.0)

Final project wildly breaks MVC architecture.  I maintain a lot of state client-side in JS, rather than going back and forth with the controller.  Realistically, this project would be better suited to a JS framework (extJS/Sencha?) than RoR, but I don't know those right now, so...

There are many places/things I would like to fix, especially the aforementioned breaking of MVC principles.  However, this was a class project while I was still on full-time work, so that's unlikely.  Updates will be made if possible, but regardless, this provided a great learning testbed for RoR and was a good change of pace from .NET.  Additionally, use of RaphaelJS was my first introduction to SVG and JS libraries.  In the future, I would
* Look harder for gems/tools which handle the client-side data-binding, rather than maintaining state with homegrown JS
* Replace RaphaelJS with D3 (newer and still supported by the devs.  Better documented too, even if it is overkill)
* Not use coffeescript.  It proved faster to write but slower to debug.  Given how much time I spent doing each, that's an easy optimization
