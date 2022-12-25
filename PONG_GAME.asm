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

halt
; ##################### PRINT ROUTINE #####################

print_routine:			   
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r3, #'\0'

print_loop:    
    loadi r4, r1
    cmp r4, r3
    jeq exit_print
    add r4, r4, r2
    outchar r4, r0
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

; ------------------------------------------
PrintColorfullString:             
    push r0
    push r1
    push r2
    push r3
    push r5     ; color

    loadn r3, #'\0'
    
PrintColorfullStringLoop:
    loadi r2, r1
    cmp r2, r3
    jeq ExitPrintColorfullString
    add r2, r2, r5                  ; Adds color to the content
    outchar r2, r0
    inc r0
    inc r1
    jmp PrintColorfullStringLoop
    
ExitPrintColorfullString:
    pop r5
    pop r3
    pop r2      
    pop r1      
    pop r0      
    rts
; ##################### DRAW MENU #####################

draw_menu:
	push r0
	push r1
	push r2
	;push r3
	;push r4
	push r5

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


	loadn r0, #0
    loadn r2, #40
    loadn r5, #2560		; lime color
    
    loadn r1, #menu01
    call PrintColorfullString
    add r0, r0, r2 
    loadn r1, #menu02
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu03
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu04
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu05
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu06
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu07
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu08
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu09
    call PrintColorfullString
    
    loadn r5, #2816		; yellow color
    add r0, r0, r2
    loadn r1, #menu10
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu11
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu12
    call PrintColorfullString

    loadn r5, #3328		; pink color
    add r0, r0, r2
    loadn r1, #menu13
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu14
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu15
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu16
    call PrintColorfullString    
    add r0, r0, r2
    loadn r1, #menu17
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu18
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu19
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu20
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu21
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu22
    call PrintColorfullString

    loadn r5, #2560     ; lime color.
    add r0, r0, r2
    loadn r1, #menu23
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu24
    call PrintColorfullString
    add r0, r0, r2
    loadn r5, #2816     ; yellow color.
    loadn r1, #menu25
    call PrintColorfullString
    add r0, r0, r2
    loadn r5, #3328     ; pink color.
    loadn r1, #menu26
    call PrintColorfullString
    add r0, r0, r2
    loadn r5, #2560     ; lime color.
    loadn r1, #menu27
    call PrintColorfullString
    add r0, r0, r2
    loadn r5, #2816     ; yellow color.
    loadn r1, #menu28
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu29
    call PrintColorfullString
    add r0, r0, r2
    loadn r1, #menu30
    call PrintColorfullString
	

	;menu_loop:	
	;	call print_routine	;
	;	loadn r3, #40
	;	loadn r4, #41
	;	add r0, r0, r3
	;	add r1, r1, r4

	;	loadn r5, #1200
	;	cmp r0, r5
	;	jne menu_loop

	
	pop r5
	;pop r4
	;pop r3
	pop r2
	pop r1
	pop r0
	rts
; ##################### DRAW MENU #####################





