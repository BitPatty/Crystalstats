## Crystalstats

##### About

A simple lua script which returns the basic stats of your pokemon in Pokemon Crystal and saves it to a file ('stats.txt').

##### Sample Output

```
TOTODILE, HP: 27/29, Lvl: 9
PIDGEY, HP: 4/15, Lvl: 3
A_Nickname, HP: 5/20, Lvl: 5
```

*Important*: The script can transcode all available letters from the English game, including special characters (?, _, !, ...). However: The two Pokemon specific symbols are no ASCII characters, hence replaced with 'Pk' and 'Mn' in the script.

##### Tools you need

The script is designed to work on VBA-RR. You can find it here: https://code.google.com/p/vba-rerecording/

##### Installation

1. Download the src folder
2. Open VBA-RR and start the game
3. In VBA-RR navigate to *Tools > Lua Scripting > New Lua Scripting Window ...*
4. A new window pops up. Use it to browse to the location of the script files.
5. Select '*main.lua*'
6. Hit *Run*

The '*stats.txt*' file will be located  in the */out* folder.

##### Development

I discontinued the development around 2 years ago. Only archiving it on Github.
