# Project 2: Shiny App Development
### App folder

The App directory contains the app files for the Shiny App (i.e., ui.R and server.R).
 
 The files prefixed by "A" contain the ui files, while the files prefixed by "B" contain the server files.
 This was done to ensure all files load in a consistent order.

`A7_ui.R` and `B5_server.R` are the higher level functions that call `A1 - A6` and `B1 - B4` respectively to build each of the tabs.

`styles.css` contains custom css that is called within `A1_ui_title.R`.

The app is then run from within `/doc/Project2.Rmd`
