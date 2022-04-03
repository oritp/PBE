require 'ruby-nfc'

class Rfid
    @@reader = NFC::Reader.all
    def read_uid
        @@reader[0].poll(Mifare::Classic::Tag) do |tag|
        return uid_hex.upcase!                              #Main method
        #return tag.to_s.split()[0].upcase!                 #Alternative method
        rescue Exception => e
            puts e
        end
    end
end

if __FILE__ == $0
        rf = Rfid. new
        puts "Waiting for a card..."
        uid = rf.read_uid
        puts "Your user ID is: " + uid
end
