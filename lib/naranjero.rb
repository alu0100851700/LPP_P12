#require "naranjero/version"
require 'thread'

class Naranjero
    
    attr_accessor :altura, :edad, :naranjas, :produccion, :vivo, :arbol
    
    
    #Constructor
    def initialize
        @altura = 0
        @edad = 0
        @naranjas = 0
        @produccion = 0
        @vivo = true
        
    end
    
    def uno_mas #grow
        if @vivo
            @edad += 1
            @altura += 200/@edad    #El naranjo cada vez crece mas lento
            
            #Si el arbol alcanza los 10 años muere
            if @edad == 10          
                @produccion = 0
                @vivo = false
            end
            
            #Si el arbol alcanza los 2 años empieza a producir
            if @edad == 2           
                @produccion = 5
            end
            
            #Si el arbol está vivo y tiene mas de 2 años la producción aumenta en 1 naranjas cada año
            if @vivo && @edad > 2   
               @produccion += 1 
            end
            
            @naranjas += @produccion
            return "\nEl arbol ha crecido, tiene #{@edad} anios" 
        end
    end
    
    def recolectar_una
        if @vivo
            if @naranjas > 1
                @naranjas += -1
                "La naranja esta deliciosa"
            else
                "No quedan naranjas, lo siento."
            end
        else
            "Este arbol esta muerto"
        end
    end

end

if __FILE__ == $0
   n = Naranjero.new
   
   Thread.new do
            while n.vivo  #Mientras este vivo sigue creciendo
                puts n.uno_mas
                @i = 5          #Cuanto le queda para crecer al arbol
                while @i > 0
                    sleep 1   
                    @i -= 1
                end
            end
        end
        
    Thread.new do
            while n.vivo  #Mientras este vivo sigue creciendo
                rec = n.recolectar_una
                puts rec
                if rec == "No quedan naranjas, lo siento."  #El proceso se duerme hasta que el arbol acabe de crecer
                    puts "El recolector va a descansar #{@i}"
                    sleep @i
                else
                    sleep 0.1
                end
            end
            puts n.recolectar_una
    end
   
   ####### Para que no se salga del programa #######
   result=[]
    while input = gets do
      input.split(' ').each do |value|
        result << value.chomp
      end
    end
    ####### ******************************** #######
end