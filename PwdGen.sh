#!/usr/bin/env bash
# ===============================================
# PwdGen - By : 3xpl0it Sh4d0w - Copyleft : 2021.
# ===============================================
# Date de Création      : 02-07-2021.
# Date de Modification  : 21-07-2021.
# ===============================================

Configuration()
{
    Module_Colors()
    {
        Text_Color()
        {
            cl="\033["
            cl_reset="1;0m"
            light_cl_red="1;31m"
            light_cl_blue="1;34m"
            light_cl_cyan="1;36m"
            light_cl_black="1;30m"
            light_cl_green="1;32m"
            light_cl_white="1;37m"
            light_cl_yellow="1;33m"
            dim_cl_red="31m"
            dim_cl_blue="34m"
            dim_cl_cyan="36m"
            dim_cl_black="30m"
            dim_cl_green="32m"
            dim_cl_white="37m"
            dim_cl_yellow="33m"
        }
        Text_Color

        Background_Color()
        {
            bg=";"
            bg_Red="41m"
            bg_Blue="44m"
            bg_Cyan="46m"
            bg_Black="40m"
            bg_Green="42m"
            bg_White="47m"
            bg_Yellow="43m"
        }
        Background_Color
    }
    Module_Colors

    Module_Vars()
    {
        question="${cl}${light_cl_green}[ ? ]${cl}${cl_reset}"
        affirmation="${cl}${light_cl_green}[ ! ]${cl}${cl_reset}"
        pwdgen_directory="DB/"
        pwdgen_filename="PassList.txt"
    }
    Module_Vars

    Module_Banner()
    {
        Banner_Header()
        {
            Sep=${cl}${light_cl_black}" - "${cl}${cl_reset}
            Start=${cl}${light_cl_black}"[ "${cl}${cl_reset}
            End=${cl}${light_cl_black}" ] \n"${cl}${cl_reset}
            Line=${cl}${light_cl_black}"====================================================================== \n"${cl}${cl_reset}
            Script_Name=${cl}${light_cl_cyan}"CLI PwdGen"${cl}${cl_reset}
            Script_Author=${cl}${light_cl_yellow}"By : 3xpl0it Sh4d0w"${cl}${cl_reset}
            Script_Version=${cl}${light_cl_green}"Version : 1.0"${cl}${cl_reset}
            Script_Copyleft=${cl}${light_cl_green}"Copyleft : 2021"${cl}${cl_reset}

            { clear }
            { printf "${Line}" }
            { printf "${Start}${cl}${light_cl_cyan}       ██████╗ ██╗    ██╗██████╗  ██████╗ ███████╗███╗   ██╗      ${cl}${cl_reset}${End}" }
            { printf "${Start}${cl}${light_cl_cyan}       ██╔══██╗██║    ██║██╔══██╗██╔════╝ ██╔════╝████╗  ██║      ${cl}${cl_reset}${End}" }
            { printf "${Start}${cl}${light_cl_cyan}       ██████╔╝██║ █╗ ██║██║  ██║██║  ███╗█████╗  ██╔██╗ ██║      ${cl}${cl_reset}${End}" }
            { printf "${Start}${cl}${light_cl_cyan}       ██╔═══╝ ██║███╗██║██║  ██║██║   ██║██╔══╝  ██║╚██╗██║      ${cl}${cl_reset}${End}" }
            { printf "${Start}${cl}${light_cl_cyan}       ██║     ╚███╔███╔╝██████╔╝╚██████╔╝███████╗██║ ╚████║      ${cl}${cl_reset}${End}" }
            { printf "${Start}${cl}${light_cl_cyan}       ╚═╝      ╚══╝╚══╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═══╝      ${cl}${cl_reset}${End}" }

            { printf "${Line}" }
            { printf "${Start}${Script_Name}${Sep}${Script_Author}${Sep}${Script_Version}${Sep}${Script_Copyleft}${End}" }
            { printf "${Line}" }
        }
        Banner_Header
    }
    Module_Banner
}
Configuration

Main_App()
{
    PwdGen()
    {
        { clear && Banner_Header }

        { read -p "$(printf "${cl}${light_cl_black}[ Nombre de mots de passe à générer ] : ${cl}${cl_reset}")" Nbr_Pass }

        { clear && Banner_Header }

        read -p "$(printf "${cl}${light_cl_black}[ Nombre de caractères à générer pour les mots de passe ] : ${cl}${cl_reset}")" Lng_Pass }

        Pass_Gen=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!?@#$%^&*"^_+=><~`:;.' | fold -w ${Lng_Pass} | head -n ${Nbr_Pass})

        { clear && Banner_Header && echo "${Pass_Gen}" && printf "${Line}" }


        { read -p "$(printf "${question} ${cl}${light_cl_black}Voulez-vous exporter les mots de passe dans la DB ? [O - N] : ${cl}${cl_reset}")" reponse }

        case $reponse in
            "O"|"o"|"OUI"|"oui" )
                echo "${Pass_Gen}" >> ${pwdgen_directory}${pwdgen_filename} && printf "${Line}"

                { clear }

                zenity \
                    --notification \
                    --window-icon="info" \
                    --text="Les Mots de passe sont copiés dans la DB : \n Pour y accéder veuillez ouvrir le fichier : ${pwdgen_filename}." \
                exit
            ;;

            "N"|"n"|"NON"|"non" )
                printf "${Line}"

                zenity \
                    --notification \
                    --window-icon="info" \
                    --text="Les mots de passe ne sont pas exportés dans le fichier \n Aucunes modifications du fichier est réalisée." \
                exit
            ;;
        esac
    }
    PwdGen
}
Main_App