.include "include/ds1501.inc"

.export _ds1501_set_minutes_alarm
.export ds1501_set_minutes_alarm


.proc _ds1501_set_minutes_alarm
    ;;@proto void          ds1501_set_minutes_alarm(unsigned char minutes);
    ;;@brief Set minutes alarm
.endproc

.proc ds1501_set_minutes_alarm
    rts
.endproc
