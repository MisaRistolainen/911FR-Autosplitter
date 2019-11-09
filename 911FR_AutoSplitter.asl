// 911 Fire Rescue; Autosplitter

// State
state("prism3d")
{
// This value will most likely be different in your findings.
	uint loading : 0x0056654, 0x180;
	uint selectedM : 0x003F824, 0x0, 0x0, 0xC, 0x14;
	uint continueSelection : "firefighter.dll", 0x0031AE8, 0x234, 0x12C, 0x5C, 0x94, 0x194;
	uint something : "firefighter.dll", 0x008277C;
}

// Initialization
init
{
	vars.fresh = 0;
	vars.split = 0;
}

// Updating
update
{

}

// Startup
startup
{
    settings.Add("option1", true, "Load Removal");
	settings.SetToolTip("option1", "Remove loads");
}

 // Start Timer
start
{
	if (current.loading == 1 && old.loading == 0 && current.selectedM == 1 && old.something == 0 && current.something == 1)
    {
		vars.fresh = 1;
		vars.split = 1;
        return true;
    }
}

// Split
split
{	
    if (current.selectedM > old.selectedM && old.selectedM == vars.split)
    {
		vars.split += 1;
		return true;
	} 
}

// Reset
reset
{

}

isLoading
{
	if (current.loading == 1 && settings["option1"])
	{
		return true;
	}
	else
	{
		return false;
	}
}