# registry-ransomware
Today I decided to try out some registry editing in VBScript, so I made a quick little ransomware script.

# About
I've been on vacation for the past few days without any time to make windows software, so now that I'm back I decided to brush up on some malware techniques.<br />
This script uses registry persistence to loop at every startup. If you don't enter in the proper key, it will shutdown the computer, effectively creating an infinite looping ransomware program in under 100 lines.

# Download
If you want to look at the script's source code, look at the `.vbs` file. If you actually want to test it out with the obfuscated & encoded version, download the `.vbe` file.<br />
<br />
**Or, you could get both [here](https://github.com/Yochran/registry-ransomware/releases).**
