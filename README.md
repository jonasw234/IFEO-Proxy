# IFEO-Proxy
Proxy for Image File Execution Options for executables that don’t normally support it

I really like abusing the [Image File Execution Options](https://blogs.msdn.microsoft.com/junfeng/2004/04/28/image-file-execution-options/) to replace executables with _debuggers_, by which I mean totally different executables that don’t care about the original program whatsoever. Unfortunately not all executables natively support this because adding a a debugger passes the name of the debugger as the first parameter, and the name of the original executable as the second. This can mess up programs that use their parameters.

The IFEO-Proxy can be used as an intermediary that simply removes the first two parameters and passes the rest to the program.

For example I have the following entry under HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe: Debugger="IFEOProxy.ahk gvim.exe --remote-silent-tab"
That way whenever a file would normally be opened with notepad, gVim opens instead.
