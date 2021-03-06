# ====================== 自定义宏 产品信息==============================
!define PRODUCT_NAME           		"SUNRISE"
!define PRODUCT_PATHNAME           	"SGLW"     #安装卸载项用到的KEY
!define INSTALL_APPEND_PATH         "SGLW"     #安装路径追加的名称 
!define INSTALL_DEFALT_SETUPPATH    ""       #默认生成的安装路径 
!define EXE_NAME               		"electron-vue-sunrise.exe"
!define PRODUCT_VERSION        		"0.0.0.0"
!define PRODUCT_PUBLISHER      		"SUNRISE科技有限公司"
!define PRODUCT_LEGAL          		"SUNRISE公司 Copyright（c）2017"
!define INSTALL_OUTPUT_NAME    		"SUNRISE_PC_Setup_v0.0.2.exe"

# ====================== 自定义宏 安装信息==============================
!define INSTALL_7Z_PATH 	   		"..\app.7z"
!define INSTALL_7Z_NAME 	   		"app.7z"
!define INSTALL_RES_PATH       		"skin.zip"
!define INSTALL_LICENCE_FILENAME    "license.txt"
!define INSTALL_ICO 			"logo.ico"


!include "ui_songliwu.nsh"

# ==================== NSIS属性 ================================

# 针对Vista和win7 的UAC进行权限请求.
# RequestExecutionLevel none|user|highest|admin
RequestExecutionLevel admin

#SetCompressor zlib

; 安装包名字.
Name "${PRODUCT_NAME}"

# 安装程序文件名.

OutFile "..\..\..\..\dist\electron\${INSTALL_OUTPUT_NAME}"

InstallDir "1"

# 安装和卸载程序图标
Icon              "${INSTALL_ICO}"
UninstallIcon     "uninst.ico"
