require 'ruby-nfc'

class Rfid
        @@reader = NFC::Reader.all
        def read_uid
                @@reader[0].poll(Mifare::Classic::Tag) do |tag|
                begin
                        uid_hex.upcase!                         # main method
                        # uid = tag.to_s.split()[0].upcase!     # alternative method
                        return uid
                rescue Exception => e
                        puts e
                end
                end
        end
end

if __FILE__ == $0
        rf = Rfid. new
        puts "Waiting for a card..."
        uid = rf.read_uid
        puts "Your user ID is: " + uid
end
