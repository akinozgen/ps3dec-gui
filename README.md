# PS3 Game Decryptor GUI

A simple GUI application for decrypting and extracting PS3 game ISOs using `ps3dec.exe` and `7z.exe`.

## Features

- Decrypt PS3 game ISOs
- Extract decrypted ISOs to a specified location
- Automatically delete decrypted ISO file after extraction
- Optionally delete the original ISO and DKey files
- Open the extraction location in a new Explorer window
- Save and load settings for paths to `7z.exe`, `ps3dec.exe`, and the extraction location
- Find .dkey files through a web link
- Find .iso files through a web link

```
Don't mind header errors in powershell window. It's not an issue.
```

## Prerequisites

- PowerShell
- `ps3dec.exe`
- `7z.exe`
- .NET Framework 4.5 or higher (required for `System.Windows.Forms`)

## Installation

1. Download or clone this repository.
2. Make sure you have `ps3dec.exe` and `7z.exe` installed and their paths configured correctly in the GUI.
3. Ensure you have .NET Framework 4.5 or higher installed. You can download it from [here](https://dotnet.microsoft.com/download/dotnet-framework/net45).

## Usage

1. Double-click on `ps3dec_gui.exe` to launch the application.
2. Select the ISO file by clicking the "Select ISO" button.
3. Select the DKey file by clicking the "Select DKey" button.
4. Specify the extraction location or use the default one.
5. Ensure the paths to `7z.exe` and `ps3dec.exe` are correctly set.
6. Click "Decrypt and Extract" to start the process.
7. The decrypted ISO will be extracted to the specified location, and you will be prompted to delete the original ISO and DKey files.
8. If you need to find .dkey files, click the "Find .dkey Files" button.
9. To visit the repository, click the "Repository Link" button.

## Screenshots

### Main GUI

![Main GUI](https://github.com/user-attachments/assets/a4f33487-375d-458d-9211-a48f10862142)

### Extration Complete

![Extraction Complete](https://github.com/user-attachments/assets/06fd76af-e7e9-460e-a8c5-dc4dc875df96)

### Decription & Extraction Complete

![Decription & Extraction Complete](https://github.com/user-attachments/assets/7707e255-b4f7-4972-95bd-c6ea50b62c81)


## Error Logging

If any errors occur during execution, they will be logged in a file named `error_log.txt` in the same directory as the executable.

## Note

This repository, including all the code and executable builds, was made completely with ChatGPT. Expect unexpected errors.

## License

This project is licensed under the MIT License.

## Acknowledgments

- Thanks to the developers of `ps3dec.exe` and `7z.exe`.
