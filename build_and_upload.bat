@echo off
setlocal
:: Activar entorno virtual de PlatformIO
call %USERPROFILE%\.platformio\penv\Scripts\activate.bat

:: Compilar el proyecto
echo Compilando proyecto con PlatformIO...
pio run
if errorlevel 1 (
    echo ❌ Error en la compilación. Abortando.
    pause
    exit /b 1
)

:: Verificar unidad RPI-RP2 montada
echo Buscando unidad de la Raspberry Pi Pico...
set PICO_DRIVE=

for %%D in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\INFO_UF2.TXT (
        set PICO_DRIVE=%%D:
        goto :found
    )
)

:found
if "%PICO_DRIVE%"=="" (
    echo ❌ No se detectó la unidad RPI-RP2. ¿La Pico está en modo BOOTSEL?
    pause
    exit /b 1
)

echo ✅ Unidad Pico detectada en %PICO_DRIVE%

:: Copiar el archivo UF2
copy /Y .pio\build\raspberry-pi-pico\firmware.uf2 %PICO_DRIVE%\
echo ✅ Archivo cargado correctamente.
pause
