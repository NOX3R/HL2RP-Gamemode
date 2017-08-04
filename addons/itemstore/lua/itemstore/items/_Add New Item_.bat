@echo off

title Item Definition Creator

:start
echo  ItemStore Item Definition Creator
echo ===================================
echo  This tool was created to allow server admins to make item definitions 
echo  for entities that do not require a lot of extra data.
echo  Simple entities such as the bouncy ball are a great example of entities
echo  that work with almost no hitches involved.
echo  Many entities will not properly function with this tool however.
echo  If you experience problems, please take a look at the developer's guide
echo  in the root of the addon to code your own specialized item definitions.
echo.
pause
echo.

:makeitem
echo Please enter the classname of the entity.
echo For example: Garry's bouncy ball entity's classname is sent_ball.
set /p class="> "
echo.

echo Now, enter the "nice" name of the entity.
echo For example: "Bouncy ball".
set /p name="> "
echo.

echo Finally, enter a short description of the item.
echo For example: "A very bouncy ball."
set /p desc="> "
echo.

:confirm
cls

echo Are these correct?
echo ============================
echo  Class: %class%
echo  Name: %name%
echo  Description: %desc%
echo ============================
echo  Press Y for yes, N to go back and C to cancel, then press enter to confirm.
set /p choice="> "

if /i %choice%==y goto write
if /i %choice%==n goto makeitem
if /i %choice%==c goto end

goto confirm

:write
echo ITEM.Name = "%name%" > %class%.lua
echo ITEM.Description = "%desc%" >> %class%.lua
echo ITEM.Base = "base_auto" >> %class%.lua

echo %class%.lua created. Test this item ingame and make sure it works
echo before you upload it to your server!
pause

:end