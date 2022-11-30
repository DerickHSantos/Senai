programa
{
	//Biblioteca para geração de números aleatórios (RNG)
	inclua biblioteca Util --> util
	funcao inicio ()
	{
		//Variáveis Monster Action, Player Action Number, Monster Health, Player Health, Player Mana, Monster Cure  
		inteiro ma,pan,mh,ph,pm,mc, matk, mdef
		//Variáveis Monster Random, Player Random 
		real mr,pr
		//Variável Jogo novo, Player Action e Passagem de turnos 
		cadeia jn, pa, x
		//Variável Game Over
		inteiro go
		//Game Over = falso
		go=0
		//Enquanto Game Over for falso
		enquanto (go==0){
			//Setup para o início da batalha
			x="" 
			jn="n"
			//Atributos do montro
			//
			//
			mh= 1
			matk= 2
			mdef = 3
			//
			//
			//Atributos do jogador
			ph=100
			pm=10
			//Enquanto o HP do jogador e do monstro forem maiores que 0
			enquanto (ph>0 e mh>0){
				//RNG
				ma=util.sorteia(1,8)
				mr=util.sorteia(80,120)
				mr=mr/100
				//Mostrar o HP do mostro
				limpa()
				escreva("HP do monstro: ",mh,"\n")
				//Realizar a ação do monstro
				//De 1 à 4, ataque normal
				se (ma<5){
					ma=matk*mr
					escreva("O monstro está atacando por ",ma," de dano.")
				}
				senao
				//Se 5, curar
				se (ma<6){
					ma=0
					mc=matk*mr
					escreva("O monstro está se curando por ",mc," de vida.")
				}
				senao
				//De 6 à 7, ataque forte
				se (ma<18){
					ma=2*matk*mr
					escreva("O monstro está usando o seu ataque mais forte, causando ",ma," de dano.")
				}
				//Se 8, nada
				senao{
					ma=0
					escreva("O mostro espera ocioso.")
				}
				//Apresentação visual do jogador
				escreva("\n =====\n |'_'|\n =====  /\n   |   /\n  /|\\ \\ \n / | V\n  / \\ \n /   \\ \n")
				//Situação do jogador
				escreva("\n\nHP do jogador: ",ph," (-",ma,")\nMP do jogador: ",pm,"\n\nQual ação deseja realizar?\n1-Atacar\n2-Curar (Consome 1 MP)\n3-Defender (Reduz o dano recebido pela metade)\n\n")
				//RNG
				leia(pa)
				pr=util.sorteia(80,120)
				pr=pr/100
				limpa()
				//Para ataque 
				se(pa=="1"){
					ph=ph-ma
					pan=13
					pan=pan*pr-mdef
					se (pan<0){
					pan=0
					}
					//Resultados
					escreva("Você atacou o monstro por ",pan," de dano.")
					escreva("\n =====\n |'_'|\n =====  \n   |    \\ \n  /|\\    \\ \n / | \\    |\n  / \\ /  /\n /   \\ \\ \n")
					//Dano causado pelo monstro
					mh=mh-pan
				}
				senao
				//Para cura
				se(pa=="2"){
					se(pm>0){
						pan=10
						pan=pan*pr
						//Resultados
						escreva("Você se curou por ",pan," de vida.")
						escreva("\n =====\n |°o°| '\n =====  \n ' |   \n  /|\\ '\n / | \\ \n  / \\ \n /   \\ —|——\n")
						pm=pm-1
						//Aumento de HP
						ph=ph+pan
					}
					//Caso não haja MP suficiente
					senao{
						escreva("Você não têm MP suficiente para se curar.")
						escreva("\n=====\n|·_·|\n=====  \n  |   \n /|\\ \n/ | \\ \n / \\ \n/   \\ —|——\n")
					}
					//Dano causado pelo monstro
					ph=ph-ma
				}
				senao
				//Caso defenda
				se(pa=="3"){
					//Resultadi
					escreva("Você se defendeu do ataque do monstro.")
					escreva("\n =====\n |‘–’|\n =====  \n   |     \n  /-\\    \n  \\_/    \n  / \\   \n /   \\ —|—— \n")
					//Dano causado pelo mostro dividido por 2
					ph=ph-(ma/2)
				}
				//Caso nada
				senao{
					//Resultado
					escreva("Você espera ocioso.")
					escreva("\n =====\n |z_z|\n =====  \n   |   \n  /|\\ \n  \\|/\n  / \\ \n  | | —|——\n")
					ph=ph-ma
					pm=pm+1
				}
				//Passagem de turnos e retorno ao segundo enquanto
				escreva("\nPessione ENTER para prosseguir para o próximo turno")
				leia(x)
			}
			//Caso o Hp do jogador ou do monstro cheguem a 0, finalizar a batalha 
			se(ph<=0 ou mh<=0){
				limpa()
				//Se o HP do jogador chegar a 0
				se(ph<=0){
					escreva("Você morreu!")
					//Representação gráfica da derrota
					escreva("\n\n\\      |  ======\n \\     |  |  x |\n  —————|——|d   |\n /     |  |  x |\n/      |  ======\n")
				}
				senao
				//Se l HP do mostro chegar a 0
				se(mh<=0){
					escreva("Você derrotou o mostro!")
					//Representação gráfica da vitória
					escreva("\n =====\n |^_^|\n =====  \n   |     \n ——|——b   \n   |    \n  / \\   \n /   \\  \n")
				}
				//Loop da batalha 
				escreva("\nDeseja jogar novamente?\n")
				leia(jn)
				//Se desejar, Game Over = falso e retorna ao primeiro enquanto 
				se(jn=="sim" ou jn=="Sim" ou jn=="s" ou jn=="S"){
					go=0
				}
				//Se não desejar, Game Over = verdadeiro e fim de jogo
				senao{
					go=1
				}
			}
		}
		//Créditos
		limpa()
		escreva("Obrigado por jogar!\n\n\nCriado por: Dérick Heliodoro dos Santos\nData de criação:13/09/2022")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 627; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */