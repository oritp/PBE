require 'gtk3'

window = Gtk::Window.new("Example")
window.set_size_request(400, 400)
window.set_border_width(10)

button = Gtk::Button.new(:label => "Say Hello")
button.signal_connect "clicked" do |_widget|
  puts "Hello"
end

window.add(button)

#window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.signal_connect("destroy") do
	Gtk.main_quit
end

window.show_all
Gtk.main
