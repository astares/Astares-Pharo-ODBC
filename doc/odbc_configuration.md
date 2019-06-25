# ODBC Configuration

On Windows you can open the ODBC administration panel either by running *odbcad32.exe* from the start menu or command line.

If you want to open it directly from Pharo use

```Smalltalk
LibC system: 'odbcad32'
```
which should then display the following window:

!(ODBC Configuration Panel)[odbc1.png]
