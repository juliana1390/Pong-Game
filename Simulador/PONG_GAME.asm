; PONG GAME

; ############# TABLE OF COLORS #############

; 0 white                           0000 0000
; 256 brown                         0001 0000
; 512 green                         0010 0000
; 768 olive                         0011 0000
; 1024 marine blue                  0100 0000
; 1280 purple                       0101 0000
; 1536 teal                         0110 0000
; 1792 silver                       0111 0000
; 2048 gray                         1000 0000
; 2304 red                          1001 0000
; 2560 lime                         1010 0000
; 2816 yellow                       1011 0000
; 3072 blue                         1100 0000
; 3328 pink                         1101 0000
; 3584 aqua                         1110 0000
; 3840 white                        1111 0000

; ###########################################

jmp main

; MENU MESSAGES
message00: string "***********    MAIN MENU    ************"
message01: string "**          CHOOSE THE MODE:          **"
message02: string "##       SINGLEPLAYER - PRESS S       ##"
message03: string "##       MULTIPLAYER - PRESS M        ##"
message04: string "**         CREDITS - PRESS C          **"
message05: string "**           EXIT - PRESS E           **"

; GAME OVER/VICTORY MESSAGES
overm00: string "************    GAME OVER    *************"
overm01: string "##               WINNER:                ##"
overm02: string "             PLAYER 1 WON!!!              "
overm03: string "             PLAYER 2 WON!!!              "
overm04: string "                YOU WON!!!                "
overm05: string "**          PLAY AGAIN - PRESS A        **"
overm06: string "**            EXIT - PRESS E            **"

; CREDITS
credm00: string "*************    CREDITS    ************"
credm01: string "               Developers:              "
credm02: string "         JULIANA DA SILVA SANTOS        "
credm03: string "           RENAN SILVA SORIANO          "
credm04: string "           Graduation Subject:          "
credm05: string " Computer Organization and Architecture "
credm06: string "               Professor:               "
credm07: string "        EDUARDO DO VALLE SIMOES         "

key: var #1     ; pressed key
    
main:
	
	call draw_menu
    call clear_screen
             
    call print_menu_messages

    menu_loop:  
        call get_key
        loadn r0, #'s'
        load r1, key
        cmp r0, r1          
        jeq single_player         ; singlePlayer    
        
        loadn r0, #'m'
        cmp r0, r1              
        jeq multi_player          ; multiPlayer 
        
        loadn r0, #'c'
        cmp r0, r1
        jeq print_credits         ; credits

        loadn r0, #'e'
        cmp r0, r1
        jne menu_loop
    

halt

; ##################### MENU MESSAGES #####################
    ; PRINT MAIN MENU MESSAGES:
    ; r0 = Position on the screen where the 1st character of the message will be printed.
    ; r1 = Adress where the message begin.
    ; Obs: The message will be printed untill find "/0".

print_menu_messages:
    push r0
    push r1
    push r3

    loadn r0, #120
    loadn r1, #message00
    loadn r3, #2560
    call print_routine
    loadn r0, #320
    loadn r1, #message01
    loadn r3, #2816
    call print_routine
    loadn r0, #560
    loadn r1, #message02
    loadn r3, #3328
    call print_routine
    loadn r0, #680
    loadn r1, #message03
    loadn r3, #3328
    call print_routine
    loadn r0, #1040
    loadn r1, #message04
    loadn r3, #2560
    call print_routine
    loadn r0, #1160
    loadn r1, #message05
    loadn r3, #2560
    call print_routine

    pop r0
    pop r1
    pop r3
    rts

; ##################### CREDITS #####################
print_credits:
    push r0
    push r1
    push r3

    call clear_screen
    loadn r0, #120          ; credits pos
    loadn r1, #credm00
    loadn r3, #2560
    call print_routine
    loadn r0, #200          ; dev pos
    loadn r1, #credm01
    loadn r3, #2816
    call print_routine
    loadn r0, #280          ; dev name pos
    loadn r1, #credm02
    loadn r3, #3328
    call print_routine
    loadn r0, #360          ; dev name pos
    loadn r1, #credm03
    loadn r3, #3328
    call print_routine
    loadn r0, #640          ; sub pos
    loadn r1, #credm04
    loadn r3, #2816
    call print_routine
    loadn r0, #720          ; sub name pos
    loadn r1, #credm05
    loadn r3, #3328
    call print_routine
    loadn r0, #1000          ; prof pos
    loadn r1, #credm06
    loadn r3, #2816
    call print_routine
    loadn r0, #1080          ; prof name pos
    loadn r1, #credm07
    loadn r3, #3328
    call print_routine

    call get_key

    pop r0
    pop r1
    pop r3
    rts

; ##################### PRINT ROUTINE #####################
print_routine:			   
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r4, #'\0'

    print_loop:    
        loadi r2, r1
        cmp r2, r4
        jeq exit_print
        add r2, r2, r3
        outchar r2, r0
        inc r0
        inc r1
        jmp print_loop
        
    exit_print: 
        pop r4
        pop r3
        pop r2      
        pop r1      
        pop r0      
        rts

; ######################## GET KEY ########################
get_key:   
    push r0
    push r1     

    loadn r0, #255
    
    get_key_loop:          
        inchar r1           ; Reads from keyboard (any key).
        cmp r1, r0          ; Compares the key to r3.
        jeq get_key_loop            ; range of keys

        store key, r1

    pop r1
    pop r0
    rts

; ##################### CLEAR SCREEN #####################
clear_screen:
    push fr
    push r0
    push r1
    push r2

    loadn r0, #0
    loadn r1, #1200
    loadn r2, #' '

    clear_screen_loop:
        outchar r2, r0
        inc r0
        cmp r0, r1
        jne clear_screen_loop

    pop r2
    pop r1
    pop r0
    pop fr
    rts

; ##################### SINGLE PLAYER #####################
single_player:
    push r0
    push r1
    push r3

    call clear_screen
    m00: string "Single Player Game"
    loadn r0, #600
    loadn r1, #m00
    loadn r3, #2560
    call print_routine
    call get_key

    pop r3
    pop r2
    pop r1
    rts

; ##################### MULTI PLAYER #####################
multi_player:
    push r0
    push r1
    push r3

    call clear_screen
    m01: string "Multi Player Game"
    loadn r0, #600
    loadn r1, #m01
    loadn r3, #2560
    call print_routine
    call get_key

    pop r3
    pop r2
    pop r1
    rts

; ##################### DRAW MENU #####################
draw_menu:
    push r0
    push r1
    push r2
    push r3

    menu01: string "                                        "
    menu02: string "                                        "
    menu03: string "  @@@@@@            @@@  @@@            "
    menu04: string "  @@  @@@   @@@@@   @@@@ @@@   @@@@@@   "
    menu05: string "  @@@@@@   @@@@@@@  @@@@@@@@  @@@       "
    menu06: string "  @@@      @@@ @@@  @@@ @@@@  @@@  @@@  "
    menu07: string "  @@@      @@@@@@@  @@@  @@@  @@@   @@  "
    menu08: string "            @@@@@              @@@@@@   "
    menu09: string "                                        "
    menu10: string "                                        "
    menu11: string "   @@@@@@             @@@@@@            "
    menu12: string "            @@@@@@              @@@@@@  "
    menu13: string "                                        "
    menu14: string "                                        "
    menu15: string "   @@@@@@            @@@   @@@          "
    menu16: string "  @@@        @@@@@   @@@   @@@  @@@@@   "
    menu17: string "  @@@  @@@  @@   @@  @@ @ @ @@  @@      "
    menu18: string "  @@@   @@  @@@@@@@  @@  @  @@  @@@@    "
    menu19: string "   @@@@@@   @@   @@  @@     @@  @@      "
    menu20: string "            @@   @@             @@@@@   "
    menu21: string "                                        "
    menu22: string "                                        "
    menu23: string "                                        "
    menu24: string "      P     A         T    S            "
    menu25: string "       R     N         O    T           "
    menu26: string "        E     Y   K          A          "
    menu27: string "         S         E          R         "
    menu28: string "          S         Y          T        "
    menu29: string "                                        "
    menu30: string "                                        "

    ;loadn r0, #0
    ;loadn r1, #menu01
    ;loadn r2, #2560

        ;menu_loop: 
    ;   call print_routine  ;
    ;   loadn r3, #40
    ;   loadn r4, #41
    ;   add r0, r0, r3
    ;   add r1, r1, r4

    ;   loadn r5, #1200
    ;   cmp r0, r5
    ;   jne menu_loop


    loadn r0, #0
    loadn r2, #40
    loadn r3, #2560     ; lime color
    
    loadn r1, #menu01
    call print_routine
    add r0, r0, r2 
    loadn r1, #menu02
    call print_routine
    add r0, r0, r2
    loadn r1, #menu03
    call print_routine
    add r0, r0, r2
    loadn r1, #menu04
    call print_routine
    add r0, r0, r2
    loadn r1, #menu05
    call print_routine
    add r0, r0, r2
    loadn r1, #menu06
    call print_routine
    add r0, r0, r2
    loadn r1, #menu07
    call print_routine
    add r0, r0, r2
    loadn r1, #menu08
    call print_routine
    add r0, r0, r2
    loadn r1, #menu09
    call print_routine
    
    loadn r3, #2816     ; yellow color
    add r0, r0, r2
    loadn r1, #menu10
    call print_routine
    add r0, r0, r2
    loadn r1, #menu11
    call print_routine
    add r0, r0, r2
    loadn r1, #menu12
    call print_routine

    loadn r3, #3328     ; pink color
    add r0, r0, r2
    loadn r1, #menu13
    call print_routine
    add r0, r0, r2
    loadn r1, #menu14
    call print_routine
    add r0, r0, r2
    loadn r1, #menu15
    call print_routine
    add r0, r0, r2
    loadn r1, #menu16
    call print_routine    
    add r0, r0, r2
    loadn r1, #menu17
    call print_routine
    add r0, r0, r2
    loadn r1, #menu18
    call print_routine
    add r0, r0, r2
    loadn r1, #menu19
    call print_routine
    add r0, r0, r2
    loadn r1, #menu20
    call print_routine
    add r0, r0, r2
    loadn r1, #menu21
    call print_routine
    add r0, r0, r2
    loadn r1, #menu22
    call print_routine

    loadn r3, #2560     ; lime color.
    add r0, r0, r2
    loadn r1, #menu23
    call print_routine
    add r0, r0, r2
    loadn r1, #menu24
    call print_routine
    add r0, r0, r2
    loadn r3, #2816     ; yellow color.
    loadn r1, #menu25
    call print_routine
    add r0, r0, r2
    loadn r3, #3328     ; pink color.
    loadn r1, #menu26
    call print_routine
    add r0, r0, r2
    loadn r3, #2560     ; lime color.
    loadn r1, #menu27
    call print_routine
    add r0, r0, r2
    loadn r3, #2816     ; yellow color.
    loadn r1, #menu28
    call print_routine
    add r0, r0, r2
    loadn r1, #menu29
    call print_routine
    add r0, r0, r2
    loadn r1, #menu30
    call print_routine
    
    call get_key

    pop r3
    pop r2
    pop r1
    pop r0
    rts    

; ##################### GAME OVER #####################
draw_game_over:
    push r0
    push r1
    push r2
    push r3

    over01: string "                                        "
    over02: string "   @@@@@@            @@@   @@@          "
    over03: string "  @@@        @@@@@   @@@   @@@  @@@@@   "
    over04: string "  @@@  @@@  @@   @@  @@ @ @ @@  @@      "
    over05: string "  @@@   @@  @@@@@@@  @@  @  @@  @@@@    "
    over06: string "   @@@@@@   @@   @@  @@     @@  @@      "
    over07: string "            @@   @@             @@@@@   "
    over08: string "                                        "
    over09: string "                                        "
    over10: string "   @@@@@@             @@@@@@            "
    over11: string "            @@@@@@              @@@@@@  "
    over12: string "                                        "
    over13: string "                                        "
    over14: string "   @@@@@              @@@@@             "
    over15: string "  @@@@@@@  @@     @@  @@     @@@@@@@    "
    over16: string "  @@@ @@@  @@@   @@@  @@@@   @@   @@    "
    over17: string "  @@@@@@@   @@@ @@@   @@     @@@@@@@    "
    over18: string "   @@@@@     @@ @@    @@@@@  @@  @@     "
    over19: string "              @@@            @@   @@    "
    over20: string "                                        "
    over21: string "                                        "
    over22: string "                                        "
    over23: string "                                        "
    over24: string "                                        "
    over25: string "      Y     L                           "
    over26: string "       O     O                          "
    over27: string "        U     S                         "
    over28: string "               E                        "
    over29: string "                                        "
    over30: string "                                        "


    loadn r0, #0
    loadn r2, #40
    loadn r3, #2560     ; lime color
    
    loadn r1, #over01
    call print_routine
    add r0, r0, r2 
    loadn r1, #over02
    call print_routine
    add r0, r0, r2
    loadn r1, #over03
    call print_routine
    add r0, r0, r2
    loadn r1, #over04
    call print_routine
    add r0, r0, r2
    loadn r1, #over05
    call print_routine
    add r0, r0, r2
    loadn r1, #over06
    call print_routine
    add r0, r0, r2
    loadn r1, #over07
    call print_routine
    add r0, r0, r2
    loadn r1, #over08
    call print_routine
    add r0, r0, r2
    loadn r1, #over09
    call print_routine
    
    loadn r3, #2816     ; yellow color
    add r0, r0, r2
    loadn r1, #over10
    call print_routine
    add r0, r0, r2
    loadn r1, #over11
    call print_routine
    add r0, r0, r2
    loadn r1, #over12
    call print_routine

    loadn r3, #3328     ; pink color
    add r0, r0, r2
    loadn r1, #over13
    call print_routine
    add r0, r0, r2
    loadn r1, #over14
    call print_routine
    add r0, r0, r2
    loadn r1, #over15
    call print_routine
    add r0, r0, r2
    loadn r1, #over16
    call print_routine    
    add r0, r0, r2
    loadn r1, #over17
    call print_routine
    add r0, r0, r2
    loadn r1, #over18
    call print_routine
    add r0, r0, r2
    loadn r1, #over19
    call print_routine
    add r0, r0, r2
    loadn r1, #over20
    call print_routine
    add r0, r0, r2
    loadn r1, #over21
    call print_routine
    add r0, r0, r2
    loadn r1, #over22
    call print_routine

    loadn r3, #2560     ; lime color.
    add r0, r0, r2
    loadn r1, #over23
    call print_routine
    add r0, r0, r2
    loadn r1, #over24
    call print_routine
    add r0, r0, r2
    loadn r3, #2816     ; yellow color.
    loadn r1, #over25
    call print_routine
    add r0, r0, r2
    loadn r3, #3328     ; pink color.
    loadn r1, #over26
    call print_routine
    add r0, r0, r2
    loadn r3, #2560     ; lime color.
    loadn r1, #over27
    call print_routine
    add r0, r0, r2
    loadn r3, #2816     ; yellow color.
    loadn r1, #over28
    call print_routine
    add r0, r0, r2
    loadn r1, #over29
    call print_routine
    add r0, r0, r2
    loadn r1, #over30
    call print_routine
    
   call get_key

    pop r3
    pop r2
    pop r1
    pop r0
    rts


