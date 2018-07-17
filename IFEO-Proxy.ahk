#NoEnv
#NoTrayIcon

Loop, %0%
{
    ; Skip the first two parameters (first is the name of the debugger, second is the name of the original program)
    If A_Index <= 2
    {
        Continue
    }
    
    ; Add parameters to a nice list
    sParam := %A_Index%
    sWholeParam = %sWholeParam% %sParam%
}

; Some programs don't like to be called with an empty argument list, so instead use none at all
If (sWholeParam = "")
{
    Run, %1%
}
; Run the program with all the parameters in quotation marks (passes as single parameter)
Else
{
    Run, %1% "%sWholeParam%"
}
