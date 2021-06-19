#! /bin/bash
# Interactive File Manager V1.0 written by Ar@sh, Arash66@gmail.com
# //////////////////////////////////////////////////////////////////

welcome () 
        {
                echo -e '\n------------------------------< Interactive File Manager | IFM v1.0 >-----------------------------'
                echo -e '\n> Choose your action:\n'
                echo -e '> Copy a file/dir: [A]'
                echo -e '> Create a dir: [B]'
                echo -e '> Delete a file/dir: [C]'
                echo -e '> List files/directories: [D]'
                echo -e '> Move a file/dir: [E]'
                echo -e '> Rename a file/dir: [F]'
                echo -e '> Exit the program: [G]\n'
                main
        }

main ()
        {
                read  action
                case $action in
                A | a)
                        while true
                        do
                                echo -e '\n--------------------------------< Copy >-------------------------------'
                                echo -e '\n> Select your option:\n'
                                echo -e '> Copy a file to a directory: [1]'
                                echo -e '> Copy a directory with its content to another directory: [2]'
                                echo -e '> Go to main menu: [3]\n'

                                read copyaction
                                if [ "$copyaction" == '1' ]
                                then
                                        echo -e '\n> Enter the soruce address of your file (e.g. /home/user):\n'
                                        read copyactionsource
                                        echo -e '\n> Enter the destination (e.g. /home/backup/:\n'
                                        read copyactiondes
                                        if [ -d "$copyactionsource" ];
                                        then
                                                cp $copyactionsource $copyactiondes
                                                echo -e '\n> Your file has been sucessfully copied to destination.'
                                                echo -e "\n> See your file in: $copyactiondes\n"
                                                ls -n $copyactiondes | head -n 6
                                                else
                                                        echo -e '\n> The action was not successful!\n'
                                                fi

                                elif [ "$copyaction" == '2' ]
                                then
                                        echo -e '\n> Enter the soruce address of your directory (e.g. /home/user):\n'
                                        read copyactionsource
                                        echo -e '\n> Enter the destination (e.g. /home/backup/):\n'
                                        read copyactiondes
                                        if [ -d "$copyactionsource" ];
                                        then
                                                cp -R $copyactionsource $copyactiondes
                                                echo -e '\n> Your directory has been sucessfully copied to destination.'
                                                echo -e "\n> See your directory in: $copyactiondes\n"
                                                ls -n $copyactiondes | head -n 6
                                                else
                                                        echo -e '\n> The action was not successful!\n'
                                                fi

				elif [ "$copyaction" == '3' ]
                                then
                                        welcome

				elif [ -z "$copyaction" ]
				then
					echo -e '\n> Enter a valid number!\n'
				else
                                        echo -e '\n> Enter a valid number!\n'

                                fi
                        done
                ;;

                B | b)
                        while true
                        do
                                echo -e '\n--------------------------------< Create >-------------------------------'
                                echo -e '\n> Create a directory: [1]'
                                echo -e '> Go to main manu: [2]\n'

                                read createaction
                                if [ "$createaction" == '1' ]
                                then
                                        echo -e '\n> Enter the destination of your directory (e.g. /home/user/):\n'
                                        read createdirdes
                                        echo -e '\n> Enter the name of your directory:\n'

                                        read createdirname
                                        if [ -d "$createdirdes" ];
                                        then
                                                mkdir ${createdirdes}${createdirname}
                                                echo -e '\n The action was sucessfully done!'
                                                echo -e "\n> See your file in: $createdirdes\n"
                                                ls -lht $reatedirdes | head -6
                                                else
                                                        echo -e '\n The action was not successful!\n'
                                                fi
                                elif [ "$createaction" == '2' ]
                                then
                                        welcome
                                elif [ -z "$createaction" ]
                                then
                                        echo -e '\n> Enter a valid number!\n'
				else
                                        echo -e '\n> Enter a valid number!\n'

                                fi
                        done
                ;;

                C | c)
                        while true
                        do
                                echo -e '\n--------------------------------< Delete >-------------------------------'
                                echo -e '\n> Select your option:\n'
                                echo -e '> Remove a file in a directory: [1]'
                                echo -e '> Remove a directory with its content: [2]'
                                echo -e '> Remove an empty directory [3]'
                                echo -e '> Go to main menu [4]\n'

                                read removeaction
                                if [ "$removeaction" == '1' ]
                                then
                                        echo -e '\n> Enter the address of your file (e.g. /home/user/db.txt):\n'
                                        read removeaction1
                                        if $(rm $removeaction1);
                                        then
                                                echo -e '\n> Your file has been sucessfully removed.'
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$removeaction" == '2' ]
                                then
                                        echo -e '\n> Enter the address of your directory (e.g. /home/user):\n'
                                        read removeaction2

                                        if [ -d "$removeaction2" ];
                                        then
                                                rm -r -f $removeaction2
                                                echo -e '\n> Your directory has been sucessfully removed.'
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$removeaction" == '3' ]
                                then
                                        echo -e '\n> Enter the address of your emnpty directory (e.g. /home/user/dir):\n'
                                        read removeaction3

                                        if $(rm -d $removeaction3);
                                        then
                                                echo -e '\n> Your directory has been sucessfully removed.'
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$removeaction" == '4' ]
                                then
                                	welcome
                                elif [ -z "$removeaction" ]
                                then
                                        echo -e '\n> Enter a valid number!\n'
                                else
                                        echo -e '\n> Enter a valid number!\n'
                                fi
                        done
                ;;

                D | d)
                        while true
                        do
                                echo -e '\n--------------------------------< List >-------------------------------'
                                echo -e '\n> Select your option:\n'
                                echo -e '> List all the disks and file systems: [1]'
                                echo -e '> List all content of a dir based on modifed time: [2]'
                                echo -e '> List all content of a dir based on size: [3]'
                                echo -e '> List the biggest files/dir in a dir: [4]'
                                echo -e '> Go to main menu: [5]\n'

                                read listaction
                                if [ "$listaction" == '1' ]
                                then
                                        df -h -T

                                elif [ "$listaction" == '2' ]
                                then
                                        echo -e '\n> Enter the address of your directory (e.g. /home/user):\n'
                                        read listsoruce
                                        if [ -d "$listsoruce" ];
                                        then
                                                ls -lht $listsoruce
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$listaction" == '3' ]
                                then
                                        echo -e '\n> Enter the address of your directory (e.g. /home/user):\n'
                                        read listsoruce
                                        if [ -d "$listsoruce" ];
                                        then
                                                ls -laShr $listsoruce
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$listaction" == '4' ]
                                then
                                        echo -e '\n> Enter the address of your directory (e.g. /home/user):\n'
                                        read listsource
                                        echo -e '\n> Enter the number of biggest files/dir to be listed:\n'
                                        read number
                                        echo -e '\n'

                                        if [ -d "$listsource" ];
                                        then
                                                du -a $listsource | sort -n -r | head -n $number
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi

                                elif [ "$listaction" == '5' ]
                                then
                                        welcome
                                elif [ -z "$listaction" ]
                                then
                                        echo -e '\n> Enter a valid number!\n'
                                else
                                        echo -e '\n> Enter a valid number!\n'
                                fi
                        done
                ;;

                E | e)

                        while true
                        do
                                echo -e '\n--------------------------------< Move >-------------------------------'
                                echo -e '\n> Move a file/directory: [1]'
                                echo -e '> Go to main manu: [2]\n'

                                read moveaction
                                if [ "$moveaction" == '1' ]
                                then
                                        echo -e '\n> Enter the source file/directory (e.g. /home/user):\n'
                                        read movesoruce
                                        echo -e '\n> Enter the destination address ((e.g. /home/backup)):\n'
                                        read movedestination

                                        if $(mv $movesoruce $movedestination);
                                        then
                                                echo -e '\n The action was sucessfully done!\n'
                                                echo -e "\n> See your file in: $movedestination\n"
                                                ls -n $movedestination | head -n 6
                                        else
                                                echo -e '\n The action was not successful!\n'
                                        fi
                                elif [ "$moveaction" == '2' ]
                                then
                                        welcome
                                elif [ -z "$moveaction" ]
                                then
                                        echo -e '\n> Enter a valid number!\n'
                                else
                                        echo -e '\n> Enter a valid number!\n'
                                fi
                        done
                ;;

                F | f)

                        while true
                        do
                                echo -e '\n-------------------------------< Rename >-------------------------------'
                                echo -e '\n> Rename a file/directory: [1]'
                                echo -e '> Go to main manu: [2]\n'

                                read renameaction
                                if [ "$renameaction" == '1' ]
                                then
                                        echo -e '\n> Enter the address of your file/directory (e.g. /home/user/test.txt):\n'
                                        read renamesoruce
                                        echo -e '\n> Enter the address again with the new name of your file/directory:\n'
                                        read newname
                                        if $(mv $renamesoruce $newname);
                                        then
                                                echo -e '\n> The action was sucessfully done!\n'
                                                echo -e '\n> See your renamed file/directory:\n'
                                                        ls -n $newname
                                        else
                                                echo -e '\n> The action was not successful!\n'
                                        fi
                                elif [ "$renameaction" == '2' ]
                                then
                                        welcome
                                elif [ -z "$renameaction" ]
                                then
                                        echo -e '\n> Enter a valid number!\n'
				else
                                        echo -e '\n> Enter a valid number!\n'

                                fi
                        done

                ;;

                G | g)
                        exit 1
                ;;

                *)
                        echo -e '\n Enter a valid code!'
                        welcome
                ;;

                esac
        }
welcome
