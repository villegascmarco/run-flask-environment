rem ECHO OFF turns off the display for the whole script
@ECHO OFF 

cls
if not exist venv/ (
    py -m venv venv 
    ECHO Virtual environment "venv" created.
) 

ECHO If you want to close de virtual environment, just type "deactivate"
ECHO .
ECHO .
ECHO .

rem https://stackoverflow.com/questions/10552812/defining-and-using-a-variable-in-batch-file
set flask_app_path="%1"

rem CALL to wait until line is executed
call .\venv\Scripts\activate

set FLASK_DEBUG=1

if %flask_app_path%=="" (
    set FLASK_APP=app_main/
) else (
    set FLASK_APP=%flask_app_path%
)

set FLASK_ENV=venv

call flask run
