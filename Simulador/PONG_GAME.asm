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

; MENU MESSAGES -------------------------------------------------
    message00: string "***********    MAIN MENU    ************"
    message01: string "**          CHOOSE THE MODE:          **"
    message02: string "##       SINGLEPLAYER - PRESS S       ##"
    message03: string "    Use the keys to move the paddle:    "
    message04: string "          'w' UP and 's' down           "
    message05: string "**         CREDITS - PRESS C          **"
    message06: string "**           EXIT - PRESS E           **"


; GAME OVER/VICTORY MESSAGES ------------------------------------
    overm00: string "************    GAME OVER    *************"
    overm01: string "##               WINNER:                ##"
    overm02: string "             PLAYER 1 WON!!!              "
    overm03: string "             PLAYER 2 WON!!!              "
    overm04: string "                YOU WON!!!                "
    overm05: string "**          PLAY AGAIN - PRESS A        **"
    overm06: string "**            EXIT - PRESS E            **"

; CREDITS -------------------------------------------------------
    credm00: string "*************    CREDITS    ************"
    credm01: string "               Developers:              "
    credm02: string "         JULIANA DA SILVA SANTOS        "
    credm03: string "           RENAN SILVA SORIANO          "
    credm04: string "           Graduation Subject:          "
    credm05: string " Computer Organization and Architecture "
    credm06: string "               Professor:               "
    credm07: string "        EDUARDO DO VALLE SIMOES         "


; VARIABLES -------------------------------------------------------
    char: var #1            ; input from keyboard, size: 1 char
    player_pad: var #4      ; player paddle label, size: 4 char
    AI_pad: var #4          ; AI paddle label, size: 4 char
    player_pad_speed: var #1
    
; ===============================================================
; MAIN ==========================================================
; ===============================================================    
main:
    
    call clear_screen
    call print_start_screens
    call get_char
    call clear_screen
    call print_menu_messages
    
    menu_loop:
        call get_char
        loadn r0, #'s'
        load r1, char
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
        jmp menu_loop

    single_player:
        call clear_screen
        call move_player_pad
        ;jmp single_player

    ;call delay
   

halt
; ===============================================================
; FUNCTIONS =====================================================
; ===============================================================   

; MOVE PLAYER PAD -----------------------------------------------
move_player_pad:
    push r0
    push r1
    push r2

    load r0, char   ; loads char address

    inchar r1       ; keyboard input
    loadn r2, #'w'  ; loads w into r2
    cmp r1, r2      ; compares input to w
    jeq move_up     ; if (input == w), jumps to move_up

    loadn r2, #'s'  ; loads s to r2
    cmp r1, r2      ; compares input to s
    jeq move_down   ; if (input == s), jumps to move_down
    
    pop r2
    pop r1
    pop r0
    rts

; DELAY ---------------------------------------------------------
delay:

; MOVE UP -------------------------------------------------------
move_up:
    push r0
    push r1
    push r2

    load r0, player_pad     ;
    loadn r1, #1            ; max position up
    loadn r2, #40           ; increments/decrements a whole line

    cmp r0, r1              ; compares the position of paddle to max position
    jeq move_up_end         ; if they are equal ends the movement

    sub r0, r0, r2          ; decrements one line
    call clear_player_pad   ; clears the pad
    store player_pad, r0    ; stores the decremented char
    call draw_player_pad    ; prints

    move_up_end:
        pop r2
        pop r1
        pop r0
        rts

; MOVE DOWN -----------------------------------------------------
move_down:
    push r0
    push r1
    push r2

    load r0, player_pad     ;
    loadn r1, #1001         ; max position down
    loadn r2, #40           ; increments/decrements a whole line

    cmp r0, r1              ; compares the position of paddle to max position
    jeq move_down_end         ; if they are equal ends the movement

    add r0, r0, r2          ; increments one line
    call clear_player_pad   ; clears the pad
    store player_pad, r0    ; stores the decremented char
    call draw_player_pad    ; prints

    move_down_end:
        pop r2
        pop r1
        pop r0
        rts

; DRAW PLAYER PAD -----------------------------------------------
draw_player_pad:
    push r0     ; keeps the address from paddle
    push r1     ; keeps the position where to print
    push r2     ; keeps the char
    push r3     ; keeps color

    load r0, player_pad ; loads the adress of paddle
    loadn r3, #3328     ; loads the color of paddle

    loadn r1, #521      ; position of char 1 ------------- 1
    add r1, r1, r0      ; relates char to paddle

    loadn r1, #253      ; char
    add r2, r2, r3      ; adds color to char
    outchar r2, r1      ; prints

    loadn r1, #561      ; position of char 2 ------------- 2
    loadn r2, #253      ; char 2
    add r2, r2, r3
    outchar r2, r1

    loadn r1, #601      ; position of char 3 ------------- 3
    loadn r2, #253      ; char 3
    add r2, r2, r3
    outchar r2, r1
   
    loadn r1, #641      ; position of char 4 ------------- 4
    loadn r2, #253      ; char 4
    add r2, r2, r3
    outchar r2, r1

    loadn r1, #681      ; position of char 5 ------------- 5
    loadn r2, #253      ; char 5
    add r2, r2, r3
    outchar r2, r1

    pop r3
    pop r2
    pop r1
    pop r0
    rts

; DRAW AI PAD ---------------------------------------------------
draw_AI_pad:
    push r0     ; keeps the address from paddle
    push r1     ; keeps the position where to print
    push r2     ; keeps the char
    push r3     ; keeps color

    load r0, AI_pad     ; loads the adress of paddle
    loadn r3, #3072     ; loads the color of paddle

    loadn r1, #558      ; position of char 1 ------------- 1
    add r1, r1, r0      ; relates char to paddle

    loadn r1, #253      ; char
    add r2, r2, r3      ; adds color to char
    outchar r2, r1      ; prints

    loadn r1, #598      ; position of char 2 ------------- 2
    loadn r2, #253      ; char 2
    add r2, r2, r3
    outchar r2, r1

    loadn r1, #638      ; position of char 3 ------------- 3
    loadn r2, #253      ; char 3
    add r2, r2, r3
    outchar r2, r1
   
    loadn r1, #678      ; position of char 4 ------------- 4
    loadn r2, #253      ; char 4
    add r2, r2, r3
    outchar r2, r1

    loadn r1, #718      ; position of char 5 ------------- 5
    loadn r2, #253      ; char 5
    add r2, r2, r3
    outchar r2, r1

    pop r3
    pop r2
    pop r1
    pop r0
    rts    

; CLEAR PLAYER PAD ----------------------------------------------
clear_player_pad:
    push r0
    push r1
    push r2
    push r3
    
    load r0, player_pad ; loads the adress of paddle
    loadn r3, #40       ; increments one whole line

    loadn r1, #521      ; position of char 1
    add r1, r1, r0
    add r1, r1, r3      ; next line
    
    loadn r2, #' '
    outchar r2, r1      ; clear char 1
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 2
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 3
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 4
    add r1, r1, r3

    outchar r2, r1      ; clear char 5
    add r1, r1, r3  
    
    pop r3
    pop r2
    pop r1
    pop r0
    rts
; DRAW AI PAD ---------------------------------------------------
clear_AI_pad:
    push r0
    push r1
    push r2

    load r0, AI_pad     ; loads the adress of paddle
    loadn r3, #40       ; increments one whole line

    loadn r1, #558      ; position of char 1
    add r1, r1, r0
    add r1, r1, r3      ; next line
    
    loadn r2, #' '
    outchar r2, r1      ; clear char 1
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 2
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 3
    add r1, r1, r3
    
    outchar r2, r1      ; clear char 4
    add r1, r1, r3

    outchar r2, r1      ; clear char 5
    add r1, r1, r3  

    pop r2
    pop r1
    pop r0
    rts

; MULTI PLAYER --------------------------------------------------
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
    call get_char

    pop r3
    pop r2
    pop r1
    rts


; CLEAR SCREEN --------------------------------------------------
clear_screen:
; clear the screen from the last position(1200) to the first one(0)
  push r0
  push r1

  loadn r0, #1200     ; final position
  loadn r1, #' '      ; 'empty' space to print

  clear_screen_loop:
    dec r0
    outchar r1, r0          ; prints in 1st position
    jnz clear_screen_loop   ; if != 0, go to loop 


  pop r1
  pop r0
  rts

; GET CHAR ------------------------------------------------------
get_char:   
  ; routine to get input from keyboard
  push r0
  push r1     

  loadn r1, #255
  
  get_char_loop:          
    inchar r0           ; input from keyboard
    cmp r0, r1          ; compares input to ' ' (nothing typed)
    jeq get_char_loop    ; if so, starts the loop again

    store char, r0       ; stores the input

  pop r1
  pop r0
  rts

; ===================================================================
; BLANK SCREEN ======================================================
; ===================================================================
    blankScrline0:  string "                                        "
    blankScrline1:  string "                                        "
    blankScrline2:  string "                                        "
    blankScrline3:  string "                                        "
    blankScrline4:  string "                                        "
    blankScrline5:  string "                                        "
    blankScrline6:  string "                                        "
    blankScrline7:  string "                                        "
    blankScrline8:  string "                                        "
    blankScrline9:  string "                                        "
    blankScrline10: string "                                        "
    blankScrline11: string "                                        "
    blankScrline12: string "                                        "
    blankScrline13: string "                                        "
    blankScrline14: string "                                        "
    blankScrline15: string "                                        "
    blankScrline16: string "                                        "
    blankScrline17: string "                                        "
    blankScrline18: string "                                        "
    blankScrline19: string "                                        "
    blankScrline20: string "                                        "
    blankScrline21: string "                                        "
    blankScrline22: string "                                        "
    blankScrline23: string "                                        "
    blankScrline24: string "                                        "
    blankScrline25: string "                                        "
    blankScrline26: string "                                        "
    blankScrline27: string "                                        "
    blankScrline28: string "                                        "
    blankScrline29: string "                                        "


; ===================================================================
; START SCREENS =====================================================
; ===================================================================

    ; START SCREEN 1 ------------------------------------------------
    startScrline0:  string "                                        "
    startScrline1:  string "                                        "
    startScrline2:  string "  @@@@@@            @@@  @@@            "
    startScrline3:  string "  @@  @@@    @@@    @@@@ @@@   @@@@@@   "
    startScrline4:  string "  @@@@@@    @@@@@   @@@@@@@@  @@@       "
    startScrline5:  string "  @@@      @@@@@@   @@@ @@@@  @@@  @@@  "
    startScrline6:  string "  @@@       @@@@@   @@@  @@@  @@@   @@  "
    startScrline7:  string "             @@@               @@@@@@   "
    startScrline8:  string "              #                         "
    startScrline9:  string "              #                         "
    startScrline10: string "                                        "
    startScrline11: string "                                        "
    startScrline12: string "                                        "
    startScrline13: string "                                        "
    startScrline14: string "                                        "
    startScrline15: string "                                        "
    startScrline16: string "                                        "
    startScrline17: string "                                        "
    startScrline18: string "                                        "
    startScrline19: string "                                        "
    startScrline20: string "                                        "
    startScrline21: string "                                        "
    startScrline22: string "                                        "
    startScrline23: string "      P                                 "
    startScrline24: string "             N         O                "
    startScrline25: string "                             A          "
    startScrline26: string "         S         E                    "
    startScrline27: string "                                        "
    startScrline28: string "                                        "
    startScrline29: string "                                        "


    ; START SCREEN 2 -------------------------------------------------
    start2Scrline0:  string "                                        "
    start2Scrline1:  string "                                        "
    start2Scrline2:  string "                                        "
    start2Scrline3:  string "            @@@                         "
    start2Scrline4:  string "           @@@@@                        "
    start2Scrline5:  string "           @@@@@@                       "
    start2Scrline6:  string "           @@@@@                        "
    start2Scrline7:  string "            @@@                         "
    start2Scrline8:  string "             #                          "
    start2Scrline9:  string "             #                          "
    start2Scrline10: string "                                        "
    start2Scrline11: string "                                        "
    start2Scrline12: string "                                        "
    start2Scrline13: string "                                        "
    start2Scrline14: string "   @@@@@@            @@@   @@@          "
    start2Scrline15: string "  @@@        @@@@@   @@@   @@@  @@@@@   "
    start2Scrline16: string "  @@@  @@@  @@   @@  @@ @ @ @@  @@      "
    start2Scrline17: string "  @@@   @@  @@@@@@@  @@  @  @@  @@@@    "
    start2Scrline18: string "   @@@@@@   @@   @@  @@     @@  @@      "
    start2Scrline19: string "            @@   @@             @@@@@   "
    start2Scrline20: string "                                        "
    start2Scrline21: string "                                        "
    start2Scrline22: string "                                        "
    start2Scrline23: string "                           S            "
    start2Scrline24: string "       R                                "
    start2Scrline25: string "              Y                         "
    start2Scrline26: string "                              R         "
    start2Scrline27: string "          S         Y                   "
    start2Scrline28: string "                                        "
    start2Scrline29: string "                                        "

    ; START SCREEN 3 -------------------------------------------------
    start3Scrline0:  string "                                        "
    start3Scrline1:  string "                                        "
    start3Scrline2:  string "                                        "
    start3Scrline3:  string "                                        "
    start3Scrline4:  string "                                        "
    start3Scrline5:  string "                                        "
    start3Scrline6:  string "                                        "
    start3Scrline7:  string "                                        "
    start3Scrline8:  string "                                        "
    start3Scrline9:  string "                                        "
    start3Scrline10: string "                                        "
    start3Scrline11: string "                                        "
    start3Scrline12: string "                                        "
    start3Scrline13: string "                                        "
    start3Scrline14: string "                                        "
    start3Scrline15: string "                                        "
    start3Scrline16: string "                                        "
    start3Scrline17: string "                                        "
    start3Scrline18: string "                                        "
    start3Scrline19: string "                                        "
    start3Scrline20: string "                                        "
    start3Scrline21: string "                                        "
    start3Scrline22: string "                                        "
    start3Scrline23: string "            A         T                 "
    start3Scrline24: string "                            T           "
    start3Scrline25: string "        E         K                     "
    start3Scrline26: string "                                        "
    start3Scrline27: string "                               T        "
    start3Scrline28: string "                                        "
    start3Scrline29: string "                                        "
      
; GAME OVER -----------------------------------------------------
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


; ===============================================================
; PRINT ROUTINES ================================================
; ===============================================================

    ; START SCREENS ---------------------------------------------------------------------- 
    print_start_screens:
        push r1
        push r2
        
        loadn r1, #startScrline0    ; first char of first line address from start screen 1
        loadn r2, #3072             ; yellow color
        call print_screen2          ; prints full start screen 1
          
        loadn r1, #start2Scrline0   ; first char of first line address from start screen 2
        loadn r2, #3328             ; aqua color
        call print_screen2
          
        loadn r1, #start3Scrline0   ; first char of first line address from start screen 3
        loadn r2, #2816             ; aqua color
        call print_screen2

        pop r1
        pop r2
        rts

    ; PRINT MENU MESSAGES --------------------------------------------------------------
        ; r0 = Position on the screen where the 1st character of the message will be printed.
        ; r1 = Address where the message begin.
        ; Obs: The message will be printed until find "/0".

    print_menu_messages:
        push r0     ; keeps r0 onto the stack to be used by the routine (screen position)
        push r1     ; keeps r1 onto the stack to be used by the routine (message content)
        push r3     ; keeps r3 onto the stack to be used by the routine (color)

        loadn r0, #80          ; loads the position 120 from screen
        loadn r1, #message00    ; loads the message 0 content
        loadn r3, #2560         ; loads the color
        call print_routine      ; print

        loadn r0, #280          ; message 1   
        loadn r1, #message01
        loadn r3, #2816
        call print_routine

        loadn r0, #520          ; message 2
        loadn r1, #message02
        loadn r3, #3328
        call print_routine

        loadn r0, #640          ; message 3
        loadn r1, #message03
        loadn r3, #3328
        call print_routine

        loadn r0, #720         ; message 4
        loadn r1, #message04
        loadn r3, #3328
        call print_routine

        loadn r0, #1000         ; message 5
        loadn r1, #message05
        loadn r3, #2560
        call print_routine

        loadn r0, #1080         ; message 6
        loadn r1, #message06
        loadn r3, #2560
        call print_routine


        pop r2
        pop r1
        pop r3
        rts        ; returns to game flow

    ; PRINT CREDITS --------------------------------------------------------------------
    print_credits:
        push r0
        push r1
        push r3

        call clear_screen
        loadn r0, #120          ; message 1: position
        loadn r1, #credm00      ; message 1: content
        loadn r3, #2560         ; message 1: color
        call print_routine
        loadn r0, #200          ; message 2
        loadn r1, #credm01      ; ...
        loadn r3, #2816         ; ...
        call print_routine
        loadn r0, #280          ; message 3
        loadn r1, #credm02      ; ...
        loadn r3, #3328
        call print_routine
        loadn r0, #360          ; message 4
        loadn r1, #credm03
        loadn r3, #3328
        call print_routine
        loadn r0, #640          ; message 5
        loadn r1, #credm04
        loadn r3, #2816
        call print_routine
        loadn r0, #720          ; message 6
        loadn r1, #credm05
        loadn r3, #3328
        call print_routine
        loadn r0, #1000         ; message 7
        loadn r1, #credm06
        loadn r3, #2816
        call print_routine
        loadn r0, #1080         ; message 8
        loadn r1, #credm07
        loadn r3, #3328
        call print_routine

        call get_char

        pop r0
        pop r1
        pop r3
        rts

    ; STD PRINT ROUTINE ----------------------------------------------------------------
    print_routine:             
        push r0     ; position
        push r1     ; message
        push r2     ; for subroutine use
        push r3     ; color
        push r4     ; stopping criterion

        loadn r4, #'\0'

        print_loop:    
            loadi r2, r1        ; loads the 1st character of the message into r2
            cmp r2, r4          ; compares character from message to stopping criterion
            jeq exit_print      ; is so: exit
            add r2, r2, r3      ; if not: adds color to character
            outchar r2, r0      ; prints character
            inc r0              ; increments the position
            inc r1              ; increments the character
            jmp print_loop      ; jumps to print_loop, beginning of subroutine
            
        exit_print: 
            pop r4
            pop r3
            pop r2      
            pop r1      
            pop r0      
            rts

    ; PRINT SCREEN 2 -------------------------------------------------------------------
    print_screen2:
        ; this routine prints scenes on screen

        push r0   ; for subroutine use
        push r1   ; keeps the address of first char from first line of the scene
        push r2   ; keeps the color
        push r3   ; for subroutine use
        push r4   ; for subroutine use
        push r5   ; for subroutine use
        push r6   ; for subroutine use

        loadn r0, #0              ; first position of the screen
        loadn r3, #40             ; increments the position
        loadn r4, #41             ; increments the pointer for lines on screen
        loadn r5, #1200           ; end of the screen
        loadn r6, #blankScrline0  ; address of first char from first line of the scene

        print_screen2_loop:
            call print_string2      ; prints char by char from the line
            add r0, r0, r3          ; increments position to second line on screen =>  r0 = r0 + 40
            add r1, r1, r4          ; increments the pointer to the beginning of next line in memory (40 + 1 because of /0 !!) => r1 = r1 + 41
            add r6, r6, r4          ; increments the pointer to the beginning of next line in memory (40 + 1 because of /0 !!) => r1 = r1 + 41
            cmp r0, r5              ; compares r0 to 1200
            jne print_screen2_loop  ; while r0 < 1200

        pop r6  ; get register values used in subroutine of the stack
        pop r5
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts
             
    ; PRINT STRING 2 -------------------------------------------------------------------
    print_string2:
        ; routine for message/string print

        push r0   ; screen position where the 1st char will be printed
        push r1   ; keeps the address of message beginning
        push r2   ; keeps message color
        push r3   ; for subroutine use
        push r4   ; for subroutine use
        push r5   ; for subroutine use
        push r6   ; for subroutine use


        loadn r3, #'\0' ; stopping criterion / end of the message
        loadn r5, #' '  ; blank space

        print_string2_loop:  
            loadi r4, r1              ; loads value from r1 to r4
            cmp r4, r3                ; compares the value (char of message) to \0
            jeq exit_print_string2    ; if char is \0: the end of the message came, then get out of loop

        cmp r4, r5                ; if char is ' ' (blank space) jumps to skip_print_2_loop (then another char won't disappear)
        jeq skip_print_string2

        add r4, r2, r4    ; sums the color to char
        outchar r4, r0    ; prints the char on screen
        storei r6, r4     ; stores the char into r6

        skip_print_string2:
            inc r0                    ; increments screen position
            inc r1                    ; increments string pointer
            inc r6                    ; increments string pointer from blank screen (first one)
            jmp print_string2_loop

        exit_print_string2: 
        pop r6
        pop r5
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts
