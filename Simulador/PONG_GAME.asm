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


main:
	
	call draw_menu
    call clear_screen

halt
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

; ##################### GET KEY #####################
get_key:   
    push r0
    push r1     

    loadn r0, #255
    
    loop:          
        inchar r1           ; Reads from keyboard (any key).
        cmp r1, r0          ; Compares the key to r3.
        jeq loop            ; range of keys
        call clear_screen

    pop r1
    pop r0
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
    loadn r3, #2560		; lime color
    
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
    
    loadn r3, #2816		; yellow color
    add r0, r0, r2
    loadn r1, #menu10
    call print_routine
    add r0, r0, r2
    loadn r1, #menu11
    call print_routine
    add r0, r0, r2
    loadn r1, #menu12
    call print_routine

    loadn r3, #3328		; pink color
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

; ##################### CLEAR SCREEN #####################


