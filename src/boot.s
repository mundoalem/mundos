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

.global _start

_start:
    ldr x30, =stack_top
    mov sp, x30
    bl kmain
    b .
