.global _kernel

.data

uartdr:     .quad   0x9000000
banner:     .asciz  "mundOS v1.0.0\n"

.text

print:
    ldr     x2,    [x0]
    cmp     x2,     #0
    beq     end
    strb    w2,    [x1]
    add     x0,     x0,     #1
    bl      print

end:
    ret

_kernel:
    ldr     x0,     =banner
    ldr     x1,     uartdr
    bl      print
