.name "Ducati Demon GP"
.comment "Very light, but can go up to 412km/h"

        ld      %0, r2
        ld      %1, r3
        ld      %7, r4
        sti     r1, %:loop, %1

loop:
        live    %1
        fork    %:next
        add     r2, r3, r2
        ld      %0, r9
        zjmp    %:loop

next:
        live    %1
        sub     r4, r2, r5
        zjmp    %:loop
        zjmp    %:attack

attack:
        live    %1
        ld      %0, r6

        ldi     %0, %:attack, r7
        sti     r7, %200, %0

        ldi     %0, %:attack2, r7
        sti     r7, %201, %0

        ldi     %0, %:attack3, r7
        sti     r7, %202, %0

        zjmp    %200

attack2:
        live    %1
attack3:
        zjmp    %:attack
