require 'gtk3'
require '../Desktop/puzzle1.rb'

white = Gdk::RGBA::new(1, 1, 1, 1)
blue = Gdk::RGBA::new(0, 0, 1, 1)
red = Gdk::RGBA::new(1, 0, 0, 1)

window = Gtk::Window.new("Puzzle2")
window.set_size_request(400, 150)
window.set_border_width(20)


box = Gtk::Box.new(:vertical)
button = Gtk::Button.new(:label => "Clear")
label = Gtk::Label.new("Please, login with your university card")
label.set_size_request(300, 80)
label.override_color(:normal, white)
label.override_background_color(:normal, blue)

box.add(label)
box.add(button)
window.add(box)

button.signal_connect "clicked" do |_widget|
        label.set_text("Please, login with yout university card")
        label.override_background_color(:active, blue)
        #torna a començar el loop
        puts "Clear"    #de moment per veure si funciona
end

window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.show_all

Gtk.main
