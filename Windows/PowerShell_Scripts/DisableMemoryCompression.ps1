# Guides:
# https://www.makeuseof.com/windows-memory-compression-guide/
# https://www.majorgeeks.com/content/page/memory_compression.html

# This is to disable the memory compression, which helps to reduce the CPU usage and improve performance
# as CPU stops the compression tasks of the memory
# Memory compression is a technique for systems with low RAM or RAM overload problems
# So if you have 16 GB or 32 GB RAM and a decent (not lower-end) processor, this can be disabled
# (but be careful and turn it back on if strange issues occur, especially if physical memory gets full too often)
# A reboot is recommended after the operation

# Get CPU info to see if it's strong enough
#(at least 4 cores and 4 threads, but 6 cores and 6 threads might be a stronger starting point)
$NumberOfCores = (Get-CimInstance -ClassName Win32_Processor).NumberOfCores
$NumberOfLogicalProcessors = (Get-CimInstance -ClassName Win32_Processor).NumberOfLogicalProcessors

# Get physical memory in GBs (at least 16 GB)
$TotalMemory = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb

# Get current state of memory compression
$MemoryCompressionState = (Get-MMAgent | Select-Object -ExpandProperty MemoryCompression)

# Disable memory compression if the computer is beefy enough
If ($NumberOfCores -ge '4' -And $NumberOfLogicalProcessors -ge '4' -And $TotalMemory -ge '16') {
	If ($MemoryCompressionState -eq 'True'){
		Write-Output "MemoryCompression was enabled. Turning it off..."
		Disable-MMAgent -mc
	}
} else {
	# Enable memory compression, system is probably better off with it (increased CPU usage)
	If ($MemoryCompressionState -eq 'False'){
		Write-Output "MemoryCompression was disabled. Turning it on..."
		Enable-MMAgent -mc
	}
}