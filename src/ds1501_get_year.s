.include "include/ds1501.s"

.export _ds1501_get_year
.export ds1501_get_year


.proc _ds1501_get_year
.endproc

.proc ds1501_get_year
    ;;@brief Get year
    ;;@modifyA
    ;;@modifyX
    ;;@modifyY
    ;;@returnA Year
    ldx     #$00
    lda     DS1501_YEAR_REGISTER
    and     #%00001111
    rts

    tax
    and     #%00001111
    tay

    txa
    and     #%11110000
    lsr
    lsr
    lsr
    lsr
    tax
    beq     @out
    tya

@loop:
    clc
    adc     #10
    dex
    bne     @loop
    ldx     DS1501_CENTURY_REGISTER
    rts

@out:
    ldx     DS1501_CENTURY_REGISTER
    tya

    rts
.endproc
