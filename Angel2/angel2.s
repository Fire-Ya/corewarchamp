.name "Angel"
.comment "The first Angel"

start:
    live    %1
    ld      %0, r2
    ld      %1, r3
    ld      %10, r4
    ld      %0, r16

fork_loop:
    live    %1
    add     r2, r3, r2
    sti     r1, %:live_site, %1
    fork    %:attack
    sub     r4, r2, r5
    ld      %0, r16
    zjmp    %:fork_loop

attack:
    live    %1
    ld      %0, r10
    ld      %0, r11
    ld      %64, r12
    ld      %-100, r13

write_loop:
    live    %1
    ldi     %:payload, r10, r14
    sti     r14, r13, r10
    add     r10, r3, r10
    sub     r12, r10, r15
    ld      %0, r16
    zjmp    %:fork_new
    ld      %0, r16
    zjmp    %:write_loop

fork_new:
    live    %1
    fork    %:attack
    ld      %0, r16
    zjmp    %:start

repair:
    live    %1
    ld      %0, r6
    ld      %0, r7
    ld      %0, r8

repair_loop:
    ldi     %:start, r6, r9
    sti     r9, %:start, r6
    add     r6, r3, r6
    sub     r15, r6, r7
    ld      %0, r16
    zjmp    %:repair_done
    ld      %0, r16
    zjmp    %:repair_loop

repair_done:
    ld      %0, r16
    zjmp    %:start

payload:
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100
    live    %1
    zjmp    %-100

live_site:
    live    %1

end_code: