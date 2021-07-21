#!/usr/bin/env sh
# ===================================================
# CLI PwdGen - By : 3xpl0it Sh4d0w - Copyleft : 2021.
# ===================================================

Configuration()
{
    Banner()
    {
        clear
        printf "====================================================== \n"
        printf "[ CLI PwdGen - By : 3xpl0it Sh4d0w - Copyleft : 2021 ] \n"
        printf "====================================================== \n"
    }
}
Configuration

Main_App()
{
    PwdGen() # Permets de Générer un Mot de Passe.
    {
        Banner
        read -p "[ Nombre de Mots de Passes à Générer ] : " Pass_Nbr
        printf "====================================================== \n"
        Banner
        read -p "[ Longueur du Mot de Passe à Générer ] : " Pass_Lng
        printf "====================================================== \n"

        Pass_Gen=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!?@#$%^&*"^_+=><~`:;.' | fold -w ${Pass_Lng} | head -n ${Pass_Nbr})
    
        Banner
        echo "${Pass_Gen}"
        printf "====================================================== \n"

        read -p "Voulez-vous Exporter les Mots de Passes dans un TXT ? [O - N] : " Oui_Non
        case $Oui_Non in
            ["O"|"o"|"OUI"|"oui"]* )
            clear 
            echo "${Pass_Gen}" >> passwords.txt
            
            printf "====================================================== \n"
            echo "[ Merci d'avoir utilisé le Programme ]"
            printf "====================================================== \n"
            exit
            ;;
            ["N"|"n"|"NON"|"non"]* )
            clear
            
            printf "====================================================== \n"
            echo "[ Merci d'avoir utilisé le Programme ]"
            printf "====================================================== \n"
            exit 
            ;;
        esac
    }
    PwdGen
}
Main_App
