set history filename ~/.gdb_history
set history save on

define show-dis
    set disassemble-next-line on
end

define early-boot
    set architecture i386:x86-64
end
