.include "include/ds1501.inc"

.export _ds1501_get_seconds

.proc _ds1501_get_seconds
    ;;@proto unsigned char ds1501_get_seconds();
    ;;@brief Get seconds
    ;;@returns Seconds
.endproc

; Modify a,x,y

.proc ds1501_get_seconds
    ;;@brief Get seconds
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY
    ;;@returnA Seconds
    lda     DS1501_SECONDS_REGISTER

    tax
    and     #%00001111
    tay

    txa
    and     #%01110000
    lsr
    lsr
    lsr
    lsr
    tax
    beq     @out
    dex
    tya

@loop:
    clc
    adc     #10
    dex
    bpl     @loop
    ldx     #$00
    rts

@out:
    ldx     #$00
    tya

    rts
.endproc
