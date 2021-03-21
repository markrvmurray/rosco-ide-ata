    section .text

berr_handler::
    move.w  D0,-(A7)
    move.w  ($8,A7),D0                ; Get format
    and.w   #$F000,D0                 ; Mask vector
    cmp.w   #$8000,D0                 ; Is it an 010 BERR frame?
    bne.w   .LFRAME                   ; Assume it's a longer (later CPU) frame if not
                                      ; For 020, this would be either A000 or B000 -
                                      ; for our purposes, they are equivalent. 
                                      ; TODO this might need checking again on later
                                      ; CPUs!

    move.w  ($A,A7),D0                ; If we're here, it's an 010 frame...                
    bset    #15,D0                    ; ... so just set the RR (rerun) flag
    move.w  D0,($A,A7)
    bra.s   .DONE 

.LFRAME:
    move.w  ($C,A7),D0                ; If we're here, it's an 020 frame...                
    bclr    #8,D0                     ; ... we only care about data faults here... Hopefully :D
    move.w  D0,($C,A7)    

.DONE
    move.w  vcounter,D0
    add.w   #1,D0
    move.w  D0,vcounter
    move.w  (A7)+,D0
    rte
