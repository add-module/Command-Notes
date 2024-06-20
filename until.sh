#!/bin/bash

select fruit in Apple Banana Orange Exit
do
    case $fruit in
        Apple)
            echo "You selected Apple."
            ;;
        Banana)
            echo "You selected Banana."
            ;;
        Orange)
            echo "You selected Orange."
            ;;
        Exit)
            echo "Exiting the program."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done

