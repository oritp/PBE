require 'gtk3'
require '../Desktop/puzzle1.rb'


rf = Rfid.new

#Creating and initializing the window
window = Gtk::Window.new("Puzzle2")
window.set_size_request(400, 150)
window.set_border_width(20)
window.set_window_position(:center)

#Creating and initializing the items (box, button and label)
box = Gtk::Box.new(:vertical, 5)
button = Gtk::Button.new(:label => "Clear")
label = Gtk::Label.new

#Defining the different types of labels
#Initial label that asks to log in with the RFID card
def set_login_label(label)
	white = Gdk::RGBA::new(1, 1, 1, 1)
	blue = Gdk::RGBA::new(0, 0, 1, 1)
	label.set_size_request(300, 80)
	label.set_text("Please, login with your university card")
	label.override_color(:normal, white)
	label.override_background_color(:normal, blue)
end
	
#Final label that shows the reading of the RFID card
def set_uid_label(label, uid)
	red = Gdk::RGBA::new(1, 0, 0, 1)
	label.set_text("UID: " + uid)
	label.override_background_color(:normal, red)
end

#Defining the Thread to read the RFID card while using the Puzzle1 code
def run_thread(rf, label)
	thr = Thread.new do
		uid = rf.read_uid
		set_uid_label(label, uid)
	end
end

#Detailing the operation of the button
button.signal_connect "clicked" do
	set_login_label(label)
	run_thread(rf, label)
end

#When the window closes, the application ends
window.signal_connect("destroy") do
	Gtk.main_quit
end

#Adding and displaying items. Running the Thread for the first time
set_login_label(label)
box.add(label)
box.add(button)
window.add(box)

window.show_all
run_thread(rf, label)
Gtk.main
