require 'lcd.rb'
require 'rfid.rb'
require 'net/http'
require 'json'

#Lectura UID
class Connexio
	display=LCD.new
	display.inicialitzar
	
	def llegirNom (uid) #Lectura del servidor, que ens retorna el nom del usuari
		uri=URI("http://localhost:3000/students?uid="+uid) #buscar a la path:/students 
		request=Net::HTTP::Get.new(uri)
				
		Net::HTTP.start(uri.host,uri.port) do |http| #creates conection to HTTP server
			response=http.request(request)
			data=JSON.parse(response.body) #El server ens retorna un arxiu JSON(response), que hem de parsejar
			name=data["name"]
			
			#Exemple execucio
			#data=JSON.parse({"name":"Oriol Torres","uid":"ED467D29"})
			#puts data["name"]  => "Oriol Torres"
		end
		
		if name == "NotFound" #si el uid no està a la nostra BD
			display.printInvalid
		else  #si el uid sí està a la nostra BD
			display.printNom(name)
		end
		return name
	end
	
	def llegirQuery(query, uid)
		uri=URI("http://localhost:3000/"+query+"&uid="+uid)
		request=Net::HTTP::Get.new(uri)
		
		Net::HTTP.start(uri.host ,uri.port) do |http| #creates conection to HTTP server
			response=http.request(request)
			info=JSON.parse(response.body) #El server ens retorna un arxiu JSON(response), que hem de parsejar
		end
		return info
	end	
end 
