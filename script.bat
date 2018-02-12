@ECHO OFF
SET DIRPROJECT="Directory of your project"
SET NAMEPROJECT="Name of the project"
SET LOGS="Directory where you want save the logs"
SET REPOSITORY=URL of your repository of the project Github.com, Bitbukect, etc.
CD %DIRPROJECT%
:here 
IF EXIST ".git" (
    ECHO [%NAMEPROJECT%] [info] %DATE% %TIME%: Verificando si existen actualizaciones >> %LOGS%
    git pull --rebase --stat origin master >> %LOGS% 2>&1
    ECHO [%NAMEPROJECT%] [update] %DATE% %TIME%: Se realizo la actualización del sistema >> %LOGS%
) ELSE (
    git init > NUL
    git remote add origin %REPOSITORY% > NUL
    ECHO [%NAMEPROJECT%] [info] %DATE% %TIME%: Se inicializo el repositorio local >> %LOGS%
    CALL :here
)
@ECHO ON