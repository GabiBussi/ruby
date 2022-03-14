class Heroi 
    attr_accessor :nome, :vida, :forca, :poderes

    def initialize(nome, vida, forca)
        @nome = nome
        @vida = vida 
        @forca = forca
    end  

    def ganha_poder(poderes)
        @poderes = poderes
    end 

end


class Inimigo 
    attr_accessor :nome, :vida, :forca

    def initialize(nome, vida, forca) 
        @nome = nome
        @vida = vida
        @forca = forca
    end 

    def ganha_poder(poderes)
        @poderes = poderes
    end 

end 



class ItensConsumiveis
    attr_accessor :nome, :vida, :quantidade

    def initialize(nome, vida)
       @nome = nome
       @vida = vida
       @quantidade = 3
    end 
end 


class Batalha 
    def initialize()
        
    end

    def turno(ataca, defende, item)
        atacar(ataca, defende)
        recuperacao(defende, item)
    end

    def atacar(ataca, defende)
        puts "Turno"
        puts "O herói #{ataca.nome} ataca #{defende.nome}"
        puts "O #{defende.nome} tem #{defende.vida} de vida"
        puts "O herói #{ataca.nome} tem #{ataca.forca} de força"
        
        defende.vida = defende.vida - ataca.forca
        puts "O #{defende.nome} agora está com #{defende.vida} de vida"
    end
    
    def recuperacao (defende, item)
        if (defende.vida < 50 && defende.vida > 0 && item.quantidade > 0)
            item.quantidade = item.quantidade - 1
            defende.vida = defende.vida + item.vida
            puts "O #{defende.nome} precisou tomar #{item.vida} de vida"
            puts "Itens restantes: #{item.quantidade}"
            puts "O #{defende.nome} continua com a briga"

        else
            puts "========================================"
            morreu(defende, item)  
        end
       
    end

    def morreu (defende, item) 
    if(defende.vida <= 0)
        puts "Seu personagem #{defende.nome} morreu"
    end 
 end
end


gabi = Heroi.new("Gabi", 300, 60) 
gabi.ganha_poder("soltar onda supersônica")

mateus = Heroi.new("Mateus", 100, 20) 
mateus.ganha_poder("mata-leão")

zumbord = Heroi.new("Zumbord", 120, 50) 
zumbord.ganha_poder("estrangular")

spoleto = Inimigo.new("Spoleto", 220, 45) 
spoleto.ganha_poder("sufocar")

donalds = Inimigo.new("Donalds", 240, 30) 
donalds.ganha_poder("solta laço da morta")

bisteca = Inimigo.new("Bisteca", 180, 30) 
bisteca.ganha_poder("choque")

pocao = ItensConsumiveis.new('Pocao', 40)
bolo = ItensConsumiveis.new('Bolo', 30)
pao = ItensConsumiveis.new('Pao', 20)

luta = Batalha.new()

seleciona = rand(0..2)
herois = [gabi, mateus, zumbord]
inimigos = [spoleto, donalds, bisteca]
cura = [pocao, bolo, pao]

herois_selecionados = herois[seleciona]

inimigos_selecionados = inimigos[seleciona]

cura_selecionada = cura[seleciona]

while (inimigos[seleciona].vida > 0) 
    luta.turno(herois_selecionados, inimigos_selecionados, cura_selecionada)
end 




