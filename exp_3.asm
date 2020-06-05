#INCLUDE <P18F452.INC>

 

    ORG        0X00 ; DIRETIVA DE PROGRAMA

 

    GOTO     INICIO ; POR CAUSA DO COMANDO ANTERIOR VAI ESTAR NO END. 0X00 DA MEMORIA DE PROGRAMA

 

INICIO    CLRF PORTD; LIMPEI OS BITS DO PORTD
        CLRF PORTB; LIMPEI OS BITS DO PORTB
SETTINGS EQU .0    
        
        ;DEFINIR ENTRADAS E SAIDAS
    

 

        CLRF TRISD; TODOS OS PINOS DO PORTD COMO SAIDA
        MOVLW B'00111000'; CONFIGURANDO RB3 e RB4 COMO ENTRADA
        MOVWF TRISB; CONFIGURADOS

 


        CLRF PORTD; RESETAR OS BITS DO PORTD

 


        ;TESTE DOS BOTÕES
        ; TESTE DE SE RB3 FOI PRESSIONADO
        
LOCKER            BTFSC    PORTB, RB5
                GOTO     CHANGE_1
RETORNO            TSTFSZ  SETTINGS
                GOTO     BOTAO_1
                GOTO     LOCKER
    
    
CHANGE_1        MOVLW     .1
                CPFSGT  W, SETTINGS
                GOTO     CHANGE_2
                MOVWF     SETTINGS
                GOTO    RETORNO
                
                
CHANGE_2        MOVLW    .0
                MOVWF     SETTINGS
                GOTO RETORNO
                

 

BOTAO_1            BTFSC    PORTB, RB3
                GOTO    BOTAO_2
                BTG        PORTD, RD0; INVERTEMOS (TOGGLE) O ESTADO DO BIT 0
                GOTO     LOCKER

 

BOTAO_2            BTFSC    PORTB, RB4; TESTA SE O BOTÃO RB3 FOI APERTADO
                GOTO     LOCKER
                BTG        PORTD, RD1
                BTG        PORTD, RD2
                GOTO    LOCKER

 

                END
