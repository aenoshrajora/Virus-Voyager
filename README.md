
<br>Unleashing the Power of Analysis: VirusVoyager, Your Ultimate Malware Solution
<br>

*You can get*: 
- What DLL files are used.
- Functions and APIs.
- Sections and segments.
- URLs, IP addresses and emails.
- Android permissions.
- File extensions and their names.
- Embedded executables/exploits.
<br><b>And so on...</b><br>

V1rus V0y1g3r aims to get even more information about suspicious files and helps user realize what that file is capable of.

# V1rusV0y1g3r Can Analyze Currently
| Files | Analysis Type |
| :--- | :--- |
| Windows Executables (.exe, .dll, .msi, .bin) | Static, Dynamic |
| Linux Executables (.elf, .bin) | Static, Dynamic |
| MacOS Executables (mach-o) | Static |
| Android Files (.apk, .jar, .dex) | Static, Dynamic(for now .apk only) |
| Golang Binaries (Linux) | Static |
| Document Files | Static |
| Archive Files (.zip, .rar, .ace) | Static |
| PCAP Files (.pcap) | Static |
| Powershell Scripts | Static |
| E-Mail Files (.eml) | Static |

# Usage
```bash
python virusvoyager.py --file suspicious_file --analyze
```


# Available On
![kali-linux](https://asset.brandfetch.io/idhVb0hxyJ/idhaay5QTH.svg?updated=1716293281823)
![blackarch](https://asset.brandfetch.io/idVr__KmtM/idQHqlq0qT.png?updated=1711269378857)
# Recommended Systems
- [X] Parrot OS
- [X] Kali Linux
- [X] Windows 10 or 11
- [X] Blackarch
<br><b><i>And also another Linux distributions that are designed for penetration testing</i></b>

# Setup and Installation
<br><b>Necessary Dependencies</b>:
- <i>Python ```3.10``` or higher versions.</i>
- ```VirusTotal API Key``` => <i>Performing VirusTotal based analysis.</i>
- ```Strings``` => <i>Necessary for static analysis.</i>
- ```Jadx``` => <i>Performing source code and resource analysis.</i>
- ```PyOneNote``` => <i>OneNote document analysis.</i>
- ```Mono``` => <i>Performing .Net binary analysis.</i>

```bash
# You can simply execute the following command it will do everything for you!
bash setup.sh

# If you want to install V1rusV0y1g3r on your system just execute the following commands.
bash setup.sh
python virusvoyager.py --install

# To prevent interpreter errors after installation, use dos2unix.
dos2unix /usr/bin/virusvoyager
```

# Static Analysis
## Normal analysis
<i><b>Description</b>: You can perform basic analysis and triage against your samples.</i>

<b>Usage</b>: ```python virusvoyager.py --file suspicious_file --analyze```<br>

## Resource analysis
<i><b>Description</b>: With this feature you can analyze assets of given file. Also you can detect and extract embedded payloads from malware samples such as AgentTesla, Formbook etc.</i>

<b>Effective Against</b>:
- .NET Executables
- Android Files (.apk)

<b>Usage</b>: ```python virusvoyager.py --file suspicious_file --resource```<br>

## Hash scan
<i><b>Description</b>: You can check if hash value of the given file is in built-in malware hash database. Also you can scan your directories with this feature.</i>

<b>Usage</b>: ```python virusvoyager.py --file suspicious_file --hashscan```<br>

## Folder scan
<b>Supported Arguments</b>:
- ```--hashscan```
- ```--packer```

<b>Usage</b>: ```python virusvoyager.py --folder FOLDER --hashscan```<br>

## VirusTotal
<b>Report Contents</b>:
- ```Threat Categories```
- ```Detections```
- ```CrowdSourced IDS Reports```

<b>Usage for --vtFile</b>: ```python virusvoyager.py --file suspicious_file --vtFile```<br>

## Document scan
<i><b>Description</b>: This feature can perform deep file inspection against given document files. For example: You can detect and extract possible malicious links or embedded exploits/payloads from your suspicious document file easily!</i>

<b>Effective Against</b>:
- Word Documents (.doc, .docm, .docx)
- Excel Documents (.xls, .xlsm, .xlsx)
- Portable Document Format (.pdf)
- OneNote Documents (.one)
- HTML Documents (.htm, .html)
- Rich Text Format Documents (.rtf)

<b>Usage</b>: ```python virusvoyager.py --file suspicious_document --docs```<br>

### Embedded File/Exploit Extraction
![
## Archive File Scan
<i><b>Description</b>: With this feature you can perform checks for suspicious files against archive files.</i>

<b>Effective Against</b>:
- ZIP
- RAR 
- ACE
 
<b>Usage</b>: ```python virusvoyager.py --file suspicious_archive_file --archive```


## File signature analyzer
<i><b>Description</b>: With this feature you can detect and extract embedded executable files(.exe, .elf) from given file. Also you can analyze large files (even 1gb or higher) and extract actual malware samples from them (pumped-file analysis).</i>

<b>Usage</b>: ```python virusvoyager.py --file suspicious_file --sigcheck```<br>

### File Carving

## MITRE ATT&CK Technique Extraction
<i><b>Description</b>: This feature allows you to generate potential MITRE ATT&CK tables based on the import/export table or functions contained within the given file.</i>

<b>Effective Against</b>:
- Windows Executables

<b>Usage</b>: ```python virusvoyager.py --file suspicious_file --mitre```<br>

## Programming language detection
<i><b>Description</b>: You can get programming language information from given file.</i>

<b>Usage</b>: ```python virusvoyager.py --file suspicious_executable --lang```<br>

## Interactive shell
<i><b>Description</b>: You can use virusvoyager in command line mode.</i>

<b>Usage</b>: ```python virusvoyager.py --console```<br>

# Dynamic Analysis
## Android Application Analysis
**Alert**
> **You must connect a virtual device or physical device to your computer.**

<br><b>Usage</b>: ```python virusvoyager.py --watch```<br>


## Process Analysis
<br><b>Usage</b>: ```python virusvoyager.py --watch```<br>
