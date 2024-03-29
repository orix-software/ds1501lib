.include "include/ds1501.inc"

.export _ds1501_get_month
.export ds1501_get_month

.proc _ds1501_get_month
    ;;@proto unsigned char ds1501_get_month();
    ;;@brief Get month
    ;;@returns Month
.endproc

.proc ds1501_get_month
    ;;@brief Get month
    ;;@modifyA
    ;;@modifyX
    ;;@returnA Month
    lda     DS1501_MONTH_REGISTER
    tax
    and     #%00010000
    cmp     #%00010000
    beq     @add

    txa
    ldx     #$00
    rts

@add:
    txa
    clc
    adc     #10
    ldx     #$00

    rts
.endproc
