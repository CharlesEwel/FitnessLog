# Fitness Log

This application allows user to create and view fitenss log's, which are records of exercises done by a trainee. Users will be able to
detail each indivual workout and track their progress. The site will also look at a user's body type, goals and exercises, and suggest similar
logs that may be of interest.

## Installation

* From Powershell, >git clone <repository-url> this repository
* Open the solution in Microsoft Visual Studio.
* From PowerShell, Navigate into the folder containing project.json (src/FitnessLog)
* Run >dotnet ef database update

For tests to work:

* After doing the above, open up Sequel Server Management Studio, go to Obhect Explorer on left hand side of screen
* Under Databases, right-click Fitness Log, select Tasks/Back-Up. Click OK in the window that pops up
* Right click Fitness Log, select Task/Restore. In the window that pops up under destination rename FitnessLog to FitnessLogTest. Click OK

## Running / Development

* Run from Microsoft Visual Studio
* Port will be assigned randomly, should pop up on its own.

## Sample logs

Charles.Ewel: F92gh67Z/
Brosephus.Brotholomew:	BroLife4$
Jennifer.Thompson: Bench315!
Moar.Samples: Need3More&
Oly.Sample: Oly4Life!

##Specs

Allow Users to create a user profile (height, age, gender, weight, goals)
Allow Individual User to create a log with entries (date, exercises performed)
Exercise Class: (Name, Image, Sets, Reps, Weight, Notes)

##Licensce and Copyright