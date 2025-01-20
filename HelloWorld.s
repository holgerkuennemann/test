//
// Assembler program to print "Hello World!"
// to stdout.
//
// X0-X2 - parameters to linux function services
// X16 - linux function number
//
.global _start             // Provide program starting address to linker
.align 2

// Setup the parameters to print hello world
// and then call Linux to do it.

_start: mov X0, #1      // move register X0 with vaule #1 = StdOut
        adr X1, helloworld // move register X1 string-adress to print
        mov X2, #37     // move reg2 value #13 as string length (incl. \n) 
        mov X16, #4     // move reg X16 value #4 for MacOS write system call
        svc 0           // call macos system svc to output the string
_start2: mov X0, #1      // move register X0 with vaule #1 = StdOut
        adr X1, helloworld // move register X1 string-adress to print
        mov X2, #37     // move reg2 value #13 as string length (incl. \n) 
        mov X16, #4     // move reg X16 value #4 for MacOS write system call
        svc 0           // call macos system svc to output the string

// Setup the parameters to exit the program
// and then call Linux to do it.

        mov     X0, #0      // Use 0 return code
        mov     X16, #1     // Service command code 1 terminates this program
        svc     0           // call MacOS to terminate the program

helloworld:    .ascii  "<---------- Hello World! ---------->\n" 
