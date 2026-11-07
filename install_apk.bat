@echo off
chcp 65001 > nul
title Cai Dat Shopee Voucher Hunter Pro

set "ROOT=%~dp0"
cd /d "%ROOT%"

set "ADB_BIN=adb.exe"
if exist "%ROOT%platform-tools\adb.exe" set "ADB_BIN=%ROOT%platform-tools\adb.exe"
if exist "%ROOT%adb.exe" set "ADB_BIN=%ROOT%adb.exe"
if exist "D:\Tool\platform-tools\adb.exe" set "ADB_BIN=D:\Tool\platform-tools\adb.exe"

set "APK_FILE=%ROOT%ShopeeHunter.apk"
if not exist "%APK_FILE%" if exist "D:\Tool\ShopeeHunter.apk" set "APK_FILE=D:\Tool\ShopeeHunter.apk"

echo ====================================================================
echo       CAI DAT SHOPEE VOUCHER HUNTER LEN DIEN THOAI ANDROID
echo ====================================================================
echo.
echo [*] Kiem tra ket noi thiet bi qua ADB...
"%ADB_BIN%" devices
echo.

if not exist "%APK_FILE%" goto :no_apk

echo [*] Dang cai dat: %APK_FILE%
"%ADB_BIN%" install -r "%APK_FILE%"
if errorlevel 1 goto :install_failed

echo.
echo ====================================================================
echo [OK] CAI DAT THANH CONG!
echo ====================================================================
echo [*] Dang khoi chay ung dung tren dien thoai...
"%ADB_BIN%" shell am start -n com.shopee.hunter/.ui.MainActivity > nul 2>&1
echo.
echo CAC BUOC TIEP THEO TREN DIEN THOAI:
echo 1. Vao Cai dat may -^> Ho tro tiep can (Tro nang / Accessibility)
echo 2. Tim 'Shopee Voucher Hunter' va BAT CONG TAC
echo 3. Mo Menu noi (Floating view) de dieu khien tren app Shopee
goto :end

:no_apk
echo [LOI] Khong tim thay file ShopeeHunter.apk!
echo Hay dat file ShopeeHunter.apk vao cung thu muc voi file cai nay.
goto :end

:install_failed
echo.
echo ====================================================================
echo [THAT BAI] Khong the cai dat len dien thoai!
echo ====================================================================
echo Huong dan khac phuc:
echo 1. Kiem tra cap ket noi USB giua dien thoai va may tinh.
echo 2. Dam bao da BAT 'Go loi USB' (USB Debugging) trong Tuy chon nha phat trien.
echo 3. Mo khoa man hinh dien thoai va bam 'Cho phep' neu co hop thoai hoi ket noi.
goto :end

:end
echo.
pause