//
// In config ACPI, PCI0.VID or GFX0 rename IGPU
DefinitionBlock("", "SSDT", 2, "hack", "_IGPU", 0)
{
    External(FIND, MethodObj)
    External(_SB.PCI0.IGPU, DeviceObj)

    Method(_SB.PCI0.IGPU._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }            
        Local0 = FIND("IGPU","injection")
        Return (Local0)
    }
}
//EOF