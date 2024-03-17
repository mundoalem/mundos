/*
This file is part of mundOS.

The mundOS is free software: you can redistribute it and/or modify it under the terms of the GNU Affero
General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

The mundOS is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along with mundOS. If not, see
<https://www.gnu.org/licenses/>.
*/

.global _kernel

.data

uartdr:     .quad   0x9000000
banner:     .asciz  "mundOS v0.0.1\n"

.text

print:
    ldr     x2,    [x0],    #1
    cmp     x2,     #0
    beq     end
    strb    w2,    [x1]
    bl      print

end:
    ret

_kernel:
    ldr     x0,     =banner
    ldr     x1,     uartdr
    bl      print
